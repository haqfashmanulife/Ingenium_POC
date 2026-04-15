# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2043Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2040-P.p";
INCLUDE "BF2040-I.s";
INCLUDE "BF2040-O.s";
INCLUDE "BF2043-O.s";
INCLUDE "BF2043-P.p";
INCLUDE "GenDelete.f";

PROCESS BF2043Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF2043Delete -> Title;
        "BF2040-I" -> InputS;
        "BF2040-P" -> RetrieveP;
        "BF2040-O" -> ConfirmS;
        "BF2043-P" -> DeleteP;
        "BF2043-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

