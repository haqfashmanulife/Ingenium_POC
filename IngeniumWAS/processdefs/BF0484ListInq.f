# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0484ListInq.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#** R11834	     New Flow For Change History List Screen                   *  
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0484-I.s";
INCLUDE "BF0484-O.s";
INCLUDE "BF0484-P.p";

PROCESS BF0484ListInq
{
    Title = STRINGTABLE.IDS_TITLE_BF0484List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0484-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0484-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0484List;
    ButtonBar = "ButtonBarLists";

    STEP DisplayList
    {
        USES S-STEP "BF0484-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;
}

