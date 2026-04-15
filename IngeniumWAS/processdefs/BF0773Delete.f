# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0773Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0770-P.p";
INCLUDE "BF0770-I.s";
INCLUDE "BF0770-O.s";
INCLUDE "BF0773-O.s";
INCLUDE "BF0773-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0773Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0773Delete -> Title;
        "BF0770-I" -> InputS;
        "BF0770-P" -> RetrieveP;
        "BF0770-O" -> ConfirmS;
        "BF0773-P" -> DeleteP;
        "BF0773-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

