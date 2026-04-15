# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2113Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2110-I.s";
INCLUDE "BF2110-P.p";
INCLUDE "BF2110-O.s";
INCLUDE "BF2113-P.p";
INCLUDE "BF2113-O.s";
INCLUDE "GenDelete.f";

PROCESS BF2113Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF2113Delete -> Title;
        "BF2110-I" -> InputS;
        "BF2110-P" -> RetrieveP;
        "BF2110-O" -> ConfirmS;
        "BF2113-P" -> DeleteP;
        "BF2113-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

