# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1963Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1960-P.p";
INCLUDE "BF1960-I.s";
INCLUDE "BF1960-O.s";
INCLUDE "BF1963-O.s";
INCLUDE "BF1963-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1963Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1963Delete -> Title;
        "BF1960-I" -> InputS;
        "BF1960-P" -> RetrieveP;
        "BF1960-O" -> ConfirmS;
        "BF1963-P" -> DeleteP;
        "BF1963-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

