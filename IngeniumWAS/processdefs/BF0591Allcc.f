# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0591Allcc.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0590-I.s";
INCLUDE "BF0590-P.p";
INCLUDE "BF0590-O.s";
INCLUDE "BF0591-O.s";
INCLUDE "BF0591-P.p";

PROCESS BF0591Allcc
{
    Title = STRINGTABLE.IDS_TITLE_BF0591Allcc;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF0590-I
    {
        USES S-STEP "BF0590-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0590-P
    {
        USES P-STEP "BF0590-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0590-I;


    ButtonBar = "ButtonBarOKCancel";

    STEP BF0590-O
    {
        USES S-STEP "BF0590-O";
    }

    IF action == "ACTION_BACK"
        BRANCH BF0590-I;


    STEP BF0591-P
    {
        USES P-STEP "BF0591-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0590-I;



    # Return to native function

    BRANCH BF0590-I;
}

