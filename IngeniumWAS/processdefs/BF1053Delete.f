# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1053Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1050-P.p";
INCLUDE "BF1050-I.s";
INCLUDE "BF1050-O.s";
INCLUDE "BF1053-O.s";
INCLUDE "BF1053-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1053Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1053Delete -> Title;
        "BF1050-I" -> InputS;
        "BF1050-P" -> RetrieveP;
        "BF1050-O" -> ConfirmS;
        "BF1053-P" -> DeleteP;
        "BF1053-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

