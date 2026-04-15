#*******************************************************************************
#*  Component:   BF9831Create.f                                                *
#*  Description: Question Description Create function                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS      Initial Version                                           *
#*  AFF024  CTS      Add code for display the question Id while change the     *
#*  AFF024  CTS      language in the screen                                    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9005-P.p";
INCLUDE "BF9831-P.p";
INCLUDE "BF9831-I.s";
INCLUDE "BF9900-O.s";
INCLUDE "BF9900-P.p";
INCLUDE "BF9832-I.s";
INCLUDE "BF9832-P.p";


PROCESS BF9831Create
{

    STEP GenQstn
    {
        USES P-STEP "BF9005-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;
    
    Title = STRINGTABLE.IDS_TITLE_BF9831Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

#*AFF024 changes strat
    MIR-HID-QSTN-ID = MIR-QSTN-ID;   
#*AFF024 changesEND

    STEP InputS
    {
         USES S-STEP "BF9831-I";
#*AFF024 changes strat
         MIR-HID-QSTN-ID -> MIR-QSTN-ID;
#*AFF024 changes END
    }

    IF action == "ACTION_BACK"
        EXIT;

#*AFF024 changes strat
    IF action == "ACTION_LANGCHANGE"
        BRANCH InputS;
#*AFF024 changes END
   
    STEP CreateP
    {
         USES P-STEP "BF9831-P";
         MIR-HID-QSTN-ID -> MIR-QSTN-ID;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH InputS;

    STEP RetrieveP
    {
         USES P-STEP "BF9900-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH InputS;

    Title = STRINGTABLE.IDS_TITLE_BF9831Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";

    STEP UpdateS
    {
         USES S-STEP "BF9832-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP UpdateP
    {
         USES P-STEP "BF9832-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH UpdateS;

    Title = STRINGTABLE.IDS_TITLE_BF9831Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";

    STEP OutputS
    {
         USES S-STEP "BF9900-O";
    }

    IF action == "ACTION_NEXT"
        EXIT;
  
}

