#*******************************************************************************
#*  Component:   BF9985PAIFundInquiry.f                                        *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  MFFPI    JE      New screen for PA Inquiry - PA FUND INQUIRY               *
#*******************************************************************************
   
INCLUDE "BF9985-P.p";
INCLUDE "BF9985-O.s";

PROCESS BF9985PAIFundInquiry
{
    Title = STRINGTABLE.IDS_TITLE_BF9985PAIFundInquiry;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarListsOFA";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH RetrieveList;

    SAVE-SCRN-PATH-IND = " ";
    SAVE-MSGS-OUTPUT   = " ";
    
    STEP RetrieveList
    {
        USES P-STEP "BF9985-P";
        ATTRIBUTES
        {
            GetMessages  = "NO";
        }
    }

    SAVE-MSGS-OUTPUT = STRINGTABLE.IDS_MESSAGE_FundInquiry;

    IF MIR-SCRN-PATH-IND != "FD" && MIR-MORE-REC-IND == "M"
     {
       ButtonBar = "ButtonBarListsOFA";
       SAVE-SCRN-PATH-IND = "PD";
       IF MIR-USER-LANG-CD == "JP"        
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT;
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
       ELSE
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT;
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
     }
 
    IF MIR-SCRN-PATH-IND != "FD" && MIR-MORE-REC-IND != "M"
     {
          ButtonBar = "ButtonBarListsO";
          MESSAGES-T[0] = "";
     }
    IF MIR-SCRN-PATH-IND == "FD" && MIR-MORE-REC-IND == "M"
     {
       ButtonBar = "ButtonBarListsPOFA";
       SAVE-SCRN-PATH-IND = "FD";
       IF MIR-USER-LANG-CD == "JP"        
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT;
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
       ELSE
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT;
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }

     }

    IF MIR-SCRN-PATH-IND == "FD" && MIR-MORE-REC-IND != "M"
     {
       ButtonBar = "ButtonBarListsPO";
       MESSAGES-T[0] = "";
     }

    STEP DisplayList
    {
        USES S-STEP "BF9985-O";
    }

    IF action == "ACTION_OK"
        EXIT;

    IF action == "ACTION_POLD"
    {
       STEP PolicyInquiryForAgent
          {
           USES PROCESS "BF9965PAIPolicyInquiry";           
           MIR-SAVE-POL-ID-BASE -> MIR-POL-ID-BASE;
           " " -> MIR-POL-ID-SFX;
           "01" -> MIR-CVG-NUM;
           "Y" -> MIR-HAS-VAR-IND;
           "FD" -> MIR-SCRN-PATH-IND;           
          }
       MESSAGES-T[0] = "";
       BRANCH DisplayList;
    }

    IF action == "ACTION_FACT"
    {
          STEP FundActivitiesList
          {
           USES PROCESS "BF9986PAIFundActivities";           
           MIR-SAVE-POL-ID-BASE -> MIR-POL-ID-BASE;
           " " -> MIR-POL-ID-SFX;
           SAVE-SCRN-PATH-IND -> MIR-SCRN-PATH-IND;           
          }
       MESSAGES-T[0] = "";
       BRANCH DisplayList;
    }

    EXIT;
}
