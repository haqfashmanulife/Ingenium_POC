# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0403Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0400-I.s";
INCLUDE "BF0400-P.p";
INCLUDE "BF0400-O.s";
INCLUDE "BF0403-P.p";
INCLUDE "BF0403-O.s";
INCLUDE "GenDelete.f";

PROCESS BF0403Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0403Delete -> Title;
        "BF0400-I" -> InputS;
        "BF0400-P" -> RetrieveP;
        "BF0400-O" -> ConfirmS;
        "BF0403-P" -> DeleteP;
        "BF0403-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

