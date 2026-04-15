# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0673Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0670-P.p";
INCLUDE "BF0670-I.s";
INCLUDE "BF0670-O.s";
INCLUDE "BF0673-O.s";
INCLUDE "BF0673-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0673Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0673Delete -> Title;
        "BF0670-I" -> InputS;
        "BF0670-P" -> RetrieveP;
        "BF0670-O" -> ConfirmS;
        "BF0673-P" -> DeleteP;
        "BF0673-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

