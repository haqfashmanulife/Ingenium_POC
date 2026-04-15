# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0963Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0960-P.p";
INCLUDE "BF0960-I.s";
INCLUDE "BF0960-O.s";
INCLUDE "BF0963-O.s";
INCLUDE "BF0963-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0963Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0963Delete -> Title;
        "BF0960-I" -> InputS;
        "BF0960-P" -> RetrieveP;
        "BF0960-O" -> ConfirmS;
        "BF0963-P" -> DeleteP;
        "BF0963-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

