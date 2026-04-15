# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1723Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1720-P.p";
INCLUDE "BF1720-I.s";
INCLUDE "BF1720-O.s";
INCLUDE "BF1723-O.s";
INCLUDE "BF1723-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1723Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1723Delete -> Title;
        "BF1720-I" -> InputS;
        "BF1720-P" -> RetrieveP;
        "BF1720-O" -> ConfirmS;
        "BF1723-P" -> DeleteP;
        "BF1723-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

