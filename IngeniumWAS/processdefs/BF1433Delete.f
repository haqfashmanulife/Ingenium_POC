# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1433Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015996  602J     Use fewer pages and S steps                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1430-I.s";
INCLUDE "BF1430-P.p";
INCLUDE "BF1430-O.s";
INCLUDE "BF1433-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1433Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1433Delete -> Title;
        "BF1430-I" -> InputS;
        "BF1430-P" -> RetrieveP;
        "BF1430-O" -> ConfirmS;
        "BF1433-P" -> DeleteP;
        "BF1430-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

