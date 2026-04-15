# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1074List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1074-I.s";
INCLUDE "BF1074-O.s";
INCLUDE "BF1074-P.p";

PROCESS BF1074List
{
    Title = STRINGTABLE.IDS_TITLE_BF1074List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1074-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1074-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF1074List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    STEP DisplayList
    {
        USES S-STEP "BF1074-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the OK button, go back and reget the list

    IF action == "ACTION_NEXT"
        BRANCH RetrieveList;

}

