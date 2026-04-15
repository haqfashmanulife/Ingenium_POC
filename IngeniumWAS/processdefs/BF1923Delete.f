# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1923Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1920-I.s";
INCLUDE "BF1920-P.p";
INCLUDE "BF1920-O.s";
INCLUDE "BF1923-P.p";
INCLUDE "BF1923-O.s";
INCLUDE "GenDelete.f";

PROCESS BF1923Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1923Delete -> Title;
        "BF1920-I" -> InputS;
        "BF1920-P" -> RetrieveP;
        "BF1920-O" -> ConfirmS;
        "BF1923-P" -> DeleteP;
        "BF1923-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

