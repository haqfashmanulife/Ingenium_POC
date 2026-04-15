# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0313Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0310-P.p";
INCLUDE "BF0310-I.s";
INCLUDE "BF0310-O.s";
INCLUDE "BF0313-O.s";
INCLUDE "BF0313-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0313Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0313Delete -> Title;
        "BF0310-I" -> InputS;
        "BF0310-P" -> RetrieveP;
        "BF0310-O" -> ConfirmS;
        "BF0313-P" -> DeleteP;
        "BF0313-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

