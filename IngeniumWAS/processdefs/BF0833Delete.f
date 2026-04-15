# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0833Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015983  602J     Changes to use fewer steps                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0830-P.p";
INCLUDE "BF0830-I.s";
INCLUDE "BF0830-O.s";
INCLUDE "BF0833-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0833Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0833Delete -> Title;
        "BF0830-I" -> InputS;
        "BF0830-P" -> RetrieveP;
        "BF0830-O" -> ConfirmS;
        "BF0833-P" -> DeleteP;
        "BF0830-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

