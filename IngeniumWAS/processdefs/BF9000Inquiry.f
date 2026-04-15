#*******************************************************************************
#*  Component:   BF9000Inquiry.f                                               *
#*  Description: Claims Additional Questions Retrieve function                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS      Initial Version                                           *
#*  AFF019  CTS   CHANGES FOR BUTTONBAR                                        *
#*  AFF027  CTS   CHANGES FOR INPUT DISPLAY                                    *
#*  AFU014  CTS   CHANGE TO DISPLAY ALL QSTNS FOR A GIVEN CLAIM                *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9000-P.p";
INCLUDE "BF9250-I.s";
INCLUDE "BF9002-O.s";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9000Inquiry
{

    Title = STRINGTABLE.IDS_TITLE_BF9000Inquiry;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
#AFF027 CHANGES START
    IF DisplayInput != "FALSE"
    {
        STEP InputS
        {
            USES S-STEP "BF9250-I";
        }
    }
#AFF027 CHANGES END
  
    IF action == "ACTION_BACK"
        EXIT;

    TEMP-CLM-ID = MIR-CLM-ID;
    STEP RetrieveP
    {
        USES P-STEP "BF9000-P";
#AFU014 CHANGES START
#       "I" -> MIR-HID-FLOW-CHK-IND;
        "M" -> MIR-HID-FLOW-CHK-IND;
#AFU014 CHANGES END
    }
    IF LSIR-RETURN-CD != "00"
       BRANCH InputS;

# 23774A CHANGES BEGIN
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLM-ID -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
    {
        IF DisplayInput != "FALSE"
        {
            BRANCH InputS;
        }
        ELSE
            EXIT;   
    }
    
# 23774A CHANGES END

#AFF019 CHANGES START
#   ButtonBar = "ButtonBarOKCancelMoreMC";
    ButtonBar = "ButtonBarOkCancelMoreMC";
#AFF019 CHANGES END
    ButtonBarSize = "40";

    STEP OutputS
    {
        USES S-STEP "BF9002-O";
    }

    IF action == "ACTION_BACK"
    {
#AFF027 CHANGES START
        IF DisplayInput != "FALSE"
        {
           MESSAGES-T[0] = " ";
           MESSAGES-T[1] = " ";
           MESSAGES-T[2] = " ";  
           MIR-HID-MORE-QSTN-ID = " ";
           MIR-HID-MORE-LVL-NUM = " ";     
           ButtonBar = "ButtonBarOKCancel";
           ButtonBarSize = "40";
           BRANCH InputS;
        }
        ELSE
            EXIT;
#AFF027 CHANGES END
    }

    IF action == "ACTION_MORE"
    {
          #MIR-HID-MORE-QSTN-ID = MIR-HID-QSTN-ID-T[50];
          #MIR-HID-MORE-LVL-NUM = MIR-HID-LVL-NUM-T[50];
          MIR-CLM-ID = TEMP-CLM-ID;
          BRANCH RetrieveP;
    }
   
    IF action == "ACTION_MC"
    {
          MESSAGES-T[0] = " ";
          MESSAGES-T[1] = " ";
          MESSAGES-T[2] = " ";
          MIR-CLM-ID = TEMP-CLM-ID;
          STEP MCRetrieve
          {
               USES PROCESS "BF9250Retrieve";
               ATTRIBUTES
               { 
                GetMessages = "No";
               }
          }

          BRANCH RetrieveP; 
    }

    IF action == "ACTION_NEXT"
          EXIT;
}

