# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0613Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0610-P.p";
INCLUDE "BF0610-I.s";
INCLUDE "BF0610-O.s";
INCLUDE "BF0613-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0613Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0613Delete -> Title;
        "BF0610-I" -> InputS;
        "BF0610-P" -> RetrieveP;
        "BF0610-O" -> ConfirmS;
        "BF0613-P" -> DeleteP;
        "BF0610-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

