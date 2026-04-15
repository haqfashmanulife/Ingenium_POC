# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0693Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0690-P.p";
INCLUDE "BF0690-I.s";
INCLUDE "BF0690-O.s";
INCLUDE "BF0693-O.s";
INCLUDE "BF0693-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0693Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0693Delete -> Title;
        "BF0690-I" -> InputS;
        "BF0690-P" -> RetrieveP;
        "BF0690-O" -> ConfirmS;
        "BF0693-P" -> DeleteP;
        "BF0693-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

