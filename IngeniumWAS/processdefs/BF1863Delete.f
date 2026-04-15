# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1863Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1860-P.p";
INCLUDE "BF1860-I.s";
INCLUDE "BF1860-O.s";
INCLUDE "BF1863-O.s";
INCLUDE "BF1863-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1863Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1863Delete -> Title;
        "BF1860-I" -> InputS;
        "BF1860-P" -> RetrieveP;
        "BF1860-O" -> ConfirmS;
        "BF1863-P" -> DeleteP;
        "BF1863-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

