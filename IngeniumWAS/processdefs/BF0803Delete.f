# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0803Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0800-P.p";
INCLUDE "BF0800-I.s";
INCLUDE "BF0800-O.s";
INCLUDE "BF0803-O.s";
INCLUDE "BF0803-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0803Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0803Delete -> Title;
        "BF0800-I" -> InputS;
        "BF0800-P" -> RetrieveP;
        "BF0800-O" -> ConfirmS;
        "BF0803-P" -> DeleteP;
        "BF0803-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

