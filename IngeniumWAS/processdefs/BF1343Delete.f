# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1343Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1340-P.p";
INCLUDE "BF1340-I.s";
INCLUDE "BF1340-O.s";
INCLUDE "BF1343-O.s";
INCLUDE "BF1343-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1343Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1343Delete -> Title;
        "BF1340-I" -> InputS;
        "BF1340-P" -> RetrieveP;
        "BF1340-O" -> ConfirmS;
        "BF1343-P" -> DeleteP;
        "BF1343-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

