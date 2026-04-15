# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0783Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0780-P.p";
INCLUDE "BF0780-I.s";
INCLUDE "BF0780-O.s";
INCLUDE "BF0783-O.s";
INCLUDE "BF0783-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0783Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0783Delete -> Title;
        "BF0780-I" -> InputS;
        "BF0780-P" -> RetrieveP;
        "BF0780-O" -> ConfirmS;
        "BF0783-P" -> DeleteP;
        "BF0783-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

