# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0793Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0790-P.p";
INCLUDE "BF0790-I.s";
INCLUDE "BF0790-O.s";
INCLUDE "BF0793-O.s";
INCLUDE "BF0793-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0793Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0793Delete -> Title;
        "BF0790-I" -> InputS;
        "BF0790-P" -> RetrieveP;
        "BF0790-O" -> ConfirmS;
        "BF0793-P" -> DeleteP;
        "BF0793-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

