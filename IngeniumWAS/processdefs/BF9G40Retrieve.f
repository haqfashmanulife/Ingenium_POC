# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF9G40Retrieve.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB15C   CTS      REINSURANCE CHANGES                                      *
#*  TL0906   CTS      DEFECT FIX FOR MORE BUTTON                               *
#*  TL1052   CTS      DEFECT FIX FOR TLB-1052                                  *
#*******************************************************************************

INCLUDE "BF9G44-I.s";
INCLUDE "BF9G40-O.s";
INCLUDE "BF9G40-P.p";

PROCESS BF9G40Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9G40Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

# TL1052 CHANGES STARTS      
#    FLOW-PAGE1 = 0;
#    MIR-RECORD-CTR1 = "0";
     FLOW-PAGE1 = 1;
# TL1052 CHANGES ENDS    

    STEP RetrieveP
    {
        USES P-STEP "BF9G40-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH RetrieveP;

    ButtonBar = "ButtonBarOKCancelMore";

    STEP DisplayRetrieve
    {
        USES S-STEP "BF9G40-O";
    }

    IF action == "ACTION_MORE" 
    {
     #   TL0906 CHANGES STARTS HERE 
# TL1052 CHANGES STARTS  
        FLOW-PAGE1 = FLOW-PAGE1 + 1;
     #   MIR-RECORD-CTR1 = FLOW-PAGE1;
        SAVE-RECORD-CTR[FLOW-PAGE1] = MIR-RECORD-CTR1-N; 
        BRANCH RetrieveP;
     #     IF MIR-MORE-EXISTS-FLAG == "Y"
     #     {
     #       FLOW-PAGE1 = FLOW-PAGE1 + 1;
     #       MIR-RECORD-CTR1 = FLOW-PAGE1;
     #      BRANCH RetrieveP;
     #     }
     #     BRANCH DisplayRetrieve;
# TL1052 CHANGES ENDS  
     #   TL0906 CHANGES ENDS HERE 
    }

    IF action == "ACTION_BACK"
        EXIT;

}

