# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1243Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1240-P.p";
INCLUDE "BF1240-I.s";
INCLUDE "BF1240-O.s";
INCLUDE "BF1243-O.s";
INCLUDE "BF1243-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1243Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1243Delete -> Title;
        "BF1240-I" -> InputS;
        "BF1240-P" -> RetrieveP;
        "BF1240-O" -> ConfirmS;
        "BF1243-P" -> DeleteP;
        "BF1243-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

