#*******************************************************************************
#*  Component:   BF9002Update.f                                                *
#*  Description:   Claims Additional Questions Update                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   INITIAL VERSION                                              *
#*  AFF017  CTS   CHANGES FOR BUTTONBAR                                        *
#*  AFF019  CTS   CHANGES FOR BUTTONBAR                                        *
#*  AFF027  CTS   CHANGES FOR INPUT DISPLAY                                    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9250-I.s";
INCLUDE "BF9000-P.p";
INCLUDE "BF9002-I.s";
INCLUDE "BF9002-P.p";
INCLUDE "BF9002-O.s";

PROCESS BF9002Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9002Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
#AFF017 CHANGES START
#   ButtonBar = "ButtonBarOkCancel";
    ButtonBar = "ButtonBarOKCancel";
#AFF017 CHANGES END
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list
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

    STEP RetrieveP
    {
        USES P-STEP "BF9000-P";
        "U" -> MIR-HID-FLOW-CHK-IND;  
    }

    IF LSIR-RETURN-CD != "00"
    {
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        BRANCH InputS;
    }

    ButtonBar = "ButtonBarOKCancelMore";
    ButtonBarSize = "40";

    TEMP-CLM-ID = MIR-CLM-ID;
    STEP UpdateS
    {
        USES S-STEP "BF9002-I";
    }

    IF action == "ACTION_BACK"
    {
#AFF027 CHANGES START
        IF DisplayInput != "FALSE"
        {
           MESSAGES-T[0]="";
           MESSAGES-T[1]="";
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

    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" 
    {
          #MIR-HID-MORE-QSTN-ID = MIR-HID-PARNT-QSTN-ID-T[50];
          #MIR-HID-MORE-LVL-NUM = MIR-HID-LVL-NUM-T[50];
          MIR-CLM-ID = TEMP-CLM-ID;
          BRANCH RetrieveP;
    }    

    STEP UpdateP
    {
       USES P-STEP "BF9002-P";
       TEMP-CLM-ID -> MIR-CLM-ID;

    }

    IF LSIR-RETURN-CD != "00"
    {
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        BRANCH InputS;
    }    

    MIR-HID-MORE-QSTN-ID = " ";
    MIR-HID-MORE-LVL-NUM = " ";

    STEP RetrieveP1
    {
        USES P-STEP "BF9000-P";
        "I" -> MIR-HID-FLOW-CHK-IND;  
    }


#AFF019 CHANGES START

    ButtonBar = "ButtonBarOkCancelMoreMC";
    ButtonBarSize = "40";
#AFF019 CHANGES END


    TEMP-CLM-ID = MIR-CLM-ID;

    STEP Update
    {
        USES S-STEP "BF9002-O";
    }

    IF action == "ACTION_BACK"
    {
#AFF027 CHANGES START
        IF DisplayInput != "FALSE"
        {
           MESSAGES-T[0]="";
           MESSAGES-T[1]="";
           MESSAGES-T[2]=""; 
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
          #MIR-HID-MORE-QSTN-ID = MIR-HID-PARNT-QSTN-ID-T[50];
          #MIR-HID-MORE-LVL-NUM = MIR-HID-LVL-NUM-T[50];
          MIR-CLM-ID = TEMP-CLM-ID;
          BRANCH RetrieveP1;
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

          BRANCH RetrieveP1; 
    }

    IF action == "ACTION_NEXT"
          EXIT;
  
}
