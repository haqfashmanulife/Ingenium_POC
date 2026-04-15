# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0740Test.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0740-I.s";
INCLUDE "BF0740-O.s";
INCLUDE "BF0740-P.p";

PROCESS BF0740Test
{
    Title = STRINGTABLE.IDS_TITLE_BF0740Test;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF0740-I
    {
        USES S-STEP "BF0740-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0740-P
    {
        USES P-STEP "BF0740-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0740-I;


    ButtonBar = "ButtonBarOK";

    STEP BF0740-O
    {
        USES S-STEP "BF0740-O";
    }

}

