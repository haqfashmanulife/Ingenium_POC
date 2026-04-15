# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1933Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1930-P.p";
INCLUDE "BF1930-I.s";
INCLUDE "BF1930-O.s";
INCLUDE "BF1933-O.s";
INCLUDE "BF1933-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1933Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1933Delete -> Title;
        "BF1930-I" -> InputS;
        "BF1930-P" -> RetrieveP;
        "BF1930-O" -> ConfirmS;
        "BF1933-P" -> DeleteP;
        "BF1933-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

