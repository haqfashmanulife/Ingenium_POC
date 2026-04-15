# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0993Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0990-P.p";
INCLUDE "BF0990-I.s";
INCLUDE "BF0990-O.s";
INCLUDE "BF0993-O.s";
INCLUDE "BF0993-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0993Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0993Delete -> Title;
        "BF0990-I" -> InputS;
        "BF0990-P" -> RetrieveP;
        "BF0990-O" -> ConfirmS;
        "BF0993-P" -> DeleteP;
        "BF0993-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

