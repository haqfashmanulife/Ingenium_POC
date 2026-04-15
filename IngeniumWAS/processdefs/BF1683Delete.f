# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1683Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1680-P.p";
INCLUDE "BF1680-I.s";
INCLUDE "BF1680-O.s";
INCLUDE "BF1683-O.s";
INCLUDE "BF1683-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1683Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1683Delete -> Title;
        "BF1680-I" -> InputS;
        "BF1680-P" -> RetrieveP;
        "BF1680-O" -> ConfirmS;
        "BF1683-P" -> DeleteP;
        "BF1683-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

