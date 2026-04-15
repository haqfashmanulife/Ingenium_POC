# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1423Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     code cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1420-I.s";
INCLUDE "BF1420-P.p";
INCLUDE "BF1420-O.s";
INCLUDE "BF1423-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1423Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1423Delete -> Title;
        "BF1420-I" -> InputS;
        "BF1420-P" -> RetrieveP;
        "BF1420-O" -> ConfirmS;
        "BF1423-P" -> DeleteP;
        "BF1420-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

