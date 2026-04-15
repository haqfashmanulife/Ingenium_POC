# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2063Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2060-I.s";
INCLUDE "BF2060-P.p";
INCLUDE "BF2060-O.s";
INCLUDE "BF2063-P.p";
INCLUDE "BF2063-O.s";
INCLUDE "GenDelete.f";

PROCESS BF2063Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF2063Delete -> Title;
        "BF2060-I" -> InputS;
        "BF2060-P" -> RetrieveP;
        "BF2060-O" -> ConfirmS;
        "BF2063-P" -> DeleteP;
        "BF2063-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

