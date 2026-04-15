# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0683Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0680-P.p";
INCLUDE "BF0680-I.s";
INCLUDE "BF0680-O.s";
INCLUDE "BF0683-O.s";
INCLUDE "BF0683-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0683Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0683Delete -> Title;
        "BF0680-I" -> InputS;
        "BF0680-P" -> RetrieveP;
        "BF0680-O" -> ConfirmS;
        "BF0683-P" -> DeleteP;
        "BF0683-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

