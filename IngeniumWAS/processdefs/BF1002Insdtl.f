# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1002Insdtl.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  B10592  YUC      Change to hide input screen                               *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF1002-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF1002-O.s";
INCLUDE "BF1002-P.p";

PROCESS BF1002Insdtl
{
    Title = STRINGTABLE.IDS_TITLE_BF1002Insdtl;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list
    # 09AUG2002  B10592  YUC   Add 2 lines to hide input screen

    IF DisplayInput == "FALSE"
        BRANCH RetrieveList;


    STEP ListStart
    {
        USES S-STEP "BF1002-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1002-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF1002Insdtl;
    ButtonBar = "ButtonBarLists";

    STEP DisplayList
    {
        USES S-STEP "BF1002-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
        MIR-DV-PRCES-STATE-CD = "2";

        BRANCH RetrieveList;

    }
}

