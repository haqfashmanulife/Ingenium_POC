# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0580Doc.f                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0580-I.s";
INCLUDE "BF0580-P.p";

PROCESS BF0580Doc
{
    Title = STRINGTABLE.IDS_TITLE_BF0580Doc;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF0580-I
    {
        USES S-STEP "BF0580-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0580-P
    {
        USES P-STEP "BF0580-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0580-I;


    BRANCH BF0580-I;
}

