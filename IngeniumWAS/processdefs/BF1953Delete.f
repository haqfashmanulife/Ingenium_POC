# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1953Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1950-P.p";
INCLUDE "BF1950-I.s";
INCLUDE "BF1950-O.s";
INCLUDE "BF1953-O.s";
INCLUDE "BF1953-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1953Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1953Delete -> Title;
        "BF1950-I" -> InputS;
        "BF1950-P" -> RetrieveP;
        "BF1950-O" -> ConfirmS;
        "BF1953-P" -> DeleteP;
        "BF1953-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

