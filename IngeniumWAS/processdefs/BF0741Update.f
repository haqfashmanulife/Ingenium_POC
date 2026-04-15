# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0741Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0741-I.s";
INCLUDE "BF0741-O.s";
INCLUDE "BF0741-P.p";

PROCESS BF0741Update
{
    Title = STRINGTABLE.IDS_TITLE_BF0741Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF0741-I
    {
        USES S-STEP "BF0741-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0741-P
    {
        USES P-STEP "BF0741-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0741-I;


    ButtonBar = "ButtonBarOK";

    STEP BF0741-O
    {
        USES S-STEP "BF0741-O";
    }

}

