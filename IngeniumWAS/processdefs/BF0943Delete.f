# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0943Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0940-I.s";
INCLUDE "BF0940-P.p";
INCLUDE "BF0940-O.s";
INCLUDE "BF0943-P.p";
INCLUDE "BF0943-O.s";
INCLUDE "GenDelete.f";

PROCESS BF0943Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0943Delete -> Title;
        "BF0940-I" -> InputS;
        "BF0940-P" -> RetrieveP;
        "BF0940-O" -> ConfirmS;
        "BF0943-P" -> DeleteP;
        "BF0943-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

