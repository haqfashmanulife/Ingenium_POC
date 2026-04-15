# Converted to Pathfinder 3.0 on Dec 13, 2024 10:39:22 AM EDT

#*******************************************************************************
#*  Component:   BF9G78Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*        MIR-ANTY-POL-ID = POL-ID;                                            *
#*  UYDM36   CTS      INITIAL VERSION OF UNISYS ANNUITY POLICY INQUIRY SCREEN  *
#*******************************************************************************


INCLUDE "BF9G78-I.s";
INCLUDE "BF9G78-O.s";
INCLUDE "BF9G78-P.p";

PROCESS BF9G78Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9G78Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
      
    FLOW-PAGE1 = 0;
    MIR-RECORD-CTR = "0";
    
    STEP RetrieveS
    {
        USES S-STEP "BF9G78-I";
        "ButtonBarOKCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveP
    {
        USES P-STEP "BF9G78-P";
    }
    POL-ID = MIR-ANTY-POL-ID;
    RECORD-CTR1 = MIR-RECORD-CTR1;

    IF LSIR-RETURN-CD != "00"
        BRANCH RetrieveS;
		
    ButtonBar = "ButtonBarOKCancelMore";
                  
    STEP DisplayRetrieve
    {
        USES S-STEP "BF9G78-O";
    }
    MIR-ANTY-POL-ID = POL-ID;
    IF action == "ACTION_MORE" 
    {
        FLOW-PAGE1 = FLOW-PAGE1 + 1;
        MIR-RECORD-CTR = FLOW-PAGE1;
        MIR-RECORD-CTR1 = RECORD-CTR1;
        MIR-ANTY-POL-ID = POL-ID;
        BRANCH RetrieveP;
    }

    IF action == "ACTION_CANCEL" 
    {
        BRANCH RetrieveS;
    }

    IF action == "ACTION_OK" 
    {
        BRANCH RetrieveS;
    }
          
}
