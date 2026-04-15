#*******************************************************************************
#*  Component:   BF9B50Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP161N  CTS      Underwriting Guidance Tool                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9B50-I.s";
INCLUDE "BF9B50-P.p";
INCLUDE "BF9B50-O.s";

PROCESS BF9B50Retrieve
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9B50Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;

    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF9B50-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9B50-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    ButtonBar = "ButtonBarOK";

    STEP Output
    {
        USES S-STEP "BF9B50-O";
    }

    EXIT;
}

