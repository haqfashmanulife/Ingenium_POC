# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1943Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1940-P.p";
INCLUDE "BF1940-I.s";
INCLUDE "BF1940-O.s";
INCLUDE "BF1943-O.s";
INCLUDE "BF1943-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1943Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1943Delete -> Title;
        "BF1940-I" -> InputS;
        "BF1940-P" -> RetrieveP;
        "BF1940-O" -> ConfirmS;
        "BF1943-P" -> DeleteP;
        "BF1943-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

