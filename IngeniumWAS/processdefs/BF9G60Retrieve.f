# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9G60Retrieve.f                                              *
#*  Description: Inquiry - Client History Maintenance                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS065  CTS      Client History Maintenance                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9G60-P.p";
INCLUDE "BF9G60-I.s";
INCLUDE "BF9G60-O.s";
INCLUDE "BF9G64-O.s";


PROCESS BF9G60Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9G60Input;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP Input
    {
	     USES S-STEP "BF9G60-I";
		 "ButtonBarOKCancel" -> ButtonBar;
         STRINGTABLE.IDS_TITLE_BF9G60Input -> Title;		 
    }

    IF action == "ACTION_BACK"
    EXIT;

        FLOW-PAGE1 = 0;

# IF POLICY ID IS NOT BLANK
    IF MIR-POL-ID != ""
    {
        STEP Retrieve1
        {
            USES P-STEP "BF9G64-P";
        }

        IF LSIR-RETURN-CD != "00"
        {
           BRANCH Input;
        }
        STEP PolRel
        {
             USES S-STEP "BF9G64-O";
            "ButtonBarOKCancel" -> ButtonBar;
            STRINGTABLE.IDS_TITLE_BF9G60Output -> Title;
        }   

        IF action == "ACTION_BACK" || action == "ACTION_NEXT"
           EXIT;  

        IF (index == "0")
            {
                BRANCH PolRel;
            }                       
        MIR-CLI-ID =  MIR-CLI-ID-T[index] ;           
    }

     STEP Retrieve2
     {
         USES P-STEP "BF9G60-P";
         
     }
     
    IF LSIR-RETURN-CD != "00"
    {
          BRANCH Input;
    }

    temp-MSGS-T[1] = MESSAGES-T[1];
    temp-MSGS-T[2] = MESSAGES-T[2];
    temp-MSGS-T[3] = MESSAGES-T[3];
    temp-MSGS-T[4] = MESSAGES-T[4];
    temp-MSGS-T[5] = MESSAGES-T[5];
    temp-MSGS-T[6] = MESSAGES-T[6];
    temp-MSGS-T[7] = MESSAGES-T[7];
    temp-MSGS-T[8] = MESSAGES-T[8];
    temp-MSGS-T[9] = MESSAGES-T[9];
    temp-MSGS-T[10] = MESSAGES-T[10];

 
	STEP PolRel
        {
             USES S-STEP "BF9G60-O";
	     "ButtonBarOKCancelMore" -> ButtonBar;
              STRINGTABLE.IDS_TITLE_BF9G60Output -> Title;
	}
    IF action == "ACTION_MORE"
    {
        FLOW-PAGE1 = FLOW-PAGE1 + 1;
        SAVE-RECORD-CTR[FLOW-PAGE1] = MIR-RECORD-CTR-N;
        BRANCH Retrieve2; 
    }
      IF action == "ACTION_BACK"
                 EXIT; 
                                 
}