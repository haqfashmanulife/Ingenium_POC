# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0733Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0730-P.p";
INCLUDE "BF0730-I.s";
INCLUDE "BF0730-O.s";
INCLUDE "BF0730-O.s";
INCLUDE "BF0733-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0733Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0733Delete -> Title;
        "BF0730-I" -> InputS;
        "BF0730-P" -> RetrieveP;
        "BF0730-O" -> ConfirmS;
        "BF0733-P" -> DeleteP;
        "BF0730-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

