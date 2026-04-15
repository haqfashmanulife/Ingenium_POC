#*******************************************************************************
#*  Component:   BF9986PAIFundActivities.f                                     *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  MFFPI    JE      New screen for PA Fund Inquiry - Fund Activity Details    *
#*******************************************************************************   
INCLUDE "BF9986-P.p";
INCLUDE "BF9986-O.s";

PROCESS BF9986PAIFundActivities
{
    Title = STRINGTABLE.IDS_TITLE_BF9986PAIFundActivities;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarListsO";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    FLOW-PAGE = 1;
    SAVE-POL-ID[99]       = " ";
    SAVE-NEXT-EFF-DT[99]  = " ";
    SAVE-CIA-CVG-NUM[99]  = " ";
    SAVE-SCRN-PATH-IND    = " ";
    SAVE-MSGS-OUTPUT      = " ";
    SAVE-POL-ID-BASE      = " ";

    IF DisplayInput == "FALSE"
    {
       BRANCH RetrieveList;
    }
    
    STEP RetrieveList
    {
        USES P-STEP "BF9986-P";
        ATTRIBUTES
        {
            GetMessages  = "NO";
        }
    }

#    IF LSIR-RETURN-CD != "00"
#        EXIT;

    SAVE-NEXT-EFF-DT[FLOW-PAGE] = MIR-PREV-CIA-EFF-DT;
    SAVE-CIA-CVG-NUM[FLOW-PAGE] = MIR-PREV-CIA-CVG-NUM;
    SAVE-MSGS-OUTPUT1 = STRINGTABLE.IDS_MESSAGE_FundActivities;
    SAVE-MSGS-OUTPUT2 = STRINGTABLE.IDS_MESSAGE_FundActEndPage;
    SAVE-MSGS-OUTPUT3 = STRINGTABLE.IDS_MESSAGE_FundActTopPage;
    SAVE-POL-ID-BASE = MIR-SAVE-POL-ID-BASE;

    # Set up the button bar HTML page
    
    IF MIR-DV-MORE-IND == "N" && FLOW-PAGE == 1 && MIR-SCRN-PATH-IND == "FD"
     {
       ButtonBar = "ButtonBarListsPO";      # shows POLICY/OKAY
       MESSAGES-T[0] = "";
     }

    IF MIR-DV-MORE-IND == "N" && FLOW-PAGE == 1 && MIR-SCRN-PATH-IND != "FD"
     {
       ButtonBar = "ButtonBarListsO";       # shows OKAY
       MESSAGES-T[0] = "";
     }

    IF MIR-DV-MORE-IND == "N" && FLOW-PAGE != 1 && MIR-SCRN-PATH-IND == "FD"
     {
       ButtonBar = "ButtonBarListsPCN";     # shows POLICY/CANCEL/NEXT
       IF MIR-USER-LANG-CD == "JP"        
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT2;
          MESSAGES-T[2] = SAVE-MSGS-OUTPUT3;
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
       ELSE
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT2;
          MESSAGES-T[2] = SAVE-MSGS-OUTPUT3;
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
     }

    IF MIR-DV-MORE-IND == "N" && FLOW-PAGE != 1 && MIR-SCRN-PATH-IND != "FD"
     {
       ButtonBar = "ButtonBarListsCN";     # shows  CANCEL/NEXT
       IF MIR-USER-LANG-CD == "JP"        
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT2;
          MESSAGES-T[2] = SAVE-MSGS-OUTPUT3;
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
       ELSE
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT2;
          MESSAGES-T[2] = SAVE-MSGS-OUTPUT3;
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
     }

    IF MIR-DV-MORE-IND != "N" && FLOW-PAGE == 1 && MIR-SCRN-PATH-IND == "FD"
     {
       ButtonBar = "ButtonBarListsPCP";     # shows POLICY/CANCEL/PREVIOUS
       IF MIR-USER-LANG-CD == "JP"        
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;       
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
       ELSE
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
     }

    IF MIR-DV-MORE-IND != "N" && FLOW-PAGE == 1 && MIR-SCRN-PATH-IND != "FD"
     {
       ButtonBar = "ButtonBarListsCP";     # shows  CANCEL/PREVIOUS
       IF MIR-USER-LANG-CD == "JP"        
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;       
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
       ELSE
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
     }

    IF MIR-DV-MORE-IND != "N" && FLOW-PAGE != 1 && MIR-SCRN-PATH-IND == "FD"
     {
       ButtonBar = "ButtonBarListsPCPN";    # shows POLICY/CANCEL/PREVIOUS/NEXT
       IF MIR-USER-LANG-CD == "JP"        
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;       
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
       ELSE
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
     }    

    IF MIR-DV-MORE-IND != "N" && FLOW-PAGE != 1 && MIR-SCRN-PATH-IND != "FD"
     {
       ButtonBar = "ButtonBarListsCPN";    # shows  CANCEL/PREVIOUS/NEXT
       IF MIR-USER-LANG-CD == "JP"        
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;       
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
       ELSE
        {
          MESSAGES-T[1] = SAVE-MSGS-OUTPUT1;
          MESSAGES-T[2] = "";
          MESSAGES-T[3] = "";
          MESSAGES-T[4] = "";
          MESSAGES-T[5] = "";
        }
     }

    STEP DisplayList
    {
        USES S-STEP "BF9986-O";
    }

    IF action == "ACTION_CANCEL"
     {
        MESSAGES-T[0] = "";
        EXIT;
     }

    IF action == "ACTION_NEXT" || action == "ACTION_PREV"
     {
       IF action == "ACTION_NEXT"
        {
          FLOW-PAGE = FLOW-PAGE - 1;
          MIR-NEXT-CIA-EFF-DT  = SAVE-NEXT-EFF-DT[FLOW-PAGE];
          MIR-NEXT-CIA-CVG-NUM = SAVE-CIA-CVG-NUM[FLOW-PAGE];
        }
       ELSE
          FLOW-PAGE = FLOW-PAGE + 1;

       BRANCH RetrieveList;
    }

   IF action == "ACTION_TOP"
    {
      FLOW-PAGE = 1;
      MIR-NEXT-CIA-EFF-DT  = "9999999999";
      MIR-NEXT-CIA-CVG-NUM = "01";

      BRANCH RetrieveList;
    }

   IF action == "ACTION_POLD"
    {
       STEP PolicyInquiryForAgent
          {
           USES PROCESS "BF9965PAIPolicyInquiry";           
           SAVE-POL-ID-BASE -> MIR-POL-ID-BASE;
           " " -> MIR-POL-ID-SFX;
           "Y" -> MIR-HAS-VAR-IND;
           "FD" -> MIR-SCRN-PATH-IND;
          }
       MESSAGES-T[0] = "";
       BRANCH DisplayList;
    }
 
    EXIT;
}