# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1523Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015995  602J     Use fewer pages and S steps                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1520-P.p";
INCLUDE "BF1520-I.s";
INCLUDE "BF1520-O.s";
INCLUDE "BF1523-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1523Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1523Delete -> Title;
        "BF1520-I" -> InputS;
        "BF1520-P" -> RetrieveP;
        "BF1520-O" -> ConfirmS;
        "BF1523-P" -> DeleteP;
        "BF1520-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

