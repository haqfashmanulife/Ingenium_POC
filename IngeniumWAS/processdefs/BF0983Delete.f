# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0983Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0980-I.s";
INCLUDE "BF0980-P.p";
INCLUDE "BF0980-O.s";
INCLUDE "BF0983-P.p";
INCLUDE "BF0983-O.s";
INCLUDE "GenDelete.f";

PROCESS BF0983Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0983Delete -> Title;
        "BF0980-I" -> InputS;
        "BF0980-P" -> RetrieveP;
        "BF0980-O" -> ConfirmS;
        "BF0983-P" -> DeleteP;
        "BF0983-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

