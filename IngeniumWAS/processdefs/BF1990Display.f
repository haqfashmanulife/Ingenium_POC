# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1990Display.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1990-P.p";
INCLUDE "BF1990-I.s";
INCLUDE "BF1990-O.s";

PROCESS BF1990Display
{
    Title = STRINGTABLE.IDS_TITLE_BF1990Display;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP DisplayStart
    {
        USES S-STEP "BF1990-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1990-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DisplayStart;


    ButtonBar = "ButtonBarLists";

    STEP DisplayList
    {
        USES S-STEP "BF1990-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;

}

