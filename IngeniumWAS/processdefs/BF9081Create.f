#*******************************************************************************
#*  Component:   BF9081Create.f                                                *
#*  Description: Benefit Category-Name Table (CQBC) Create function            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS      Initial Version                                           *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9081-P.p";
INCLUDE "BF9081-I.s";
INCLUDE "BF9081-O.s";

PROCESS BF9081Create
{

    Title = STRINGTABLE.IDS_TITLE_BF9081Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP Input
    {
        USES S-STEP "BF9081-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;

    STEP Create
    {
        USES P-STEP "BF9081-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";

    STEP Output
    {
        USES S-STEP "BF9081-O";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;

}

