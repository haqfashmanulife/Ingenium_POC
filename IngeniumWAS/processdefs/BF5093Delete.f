# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5093Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5090-I.s";
INCLUDE "BF5090-P.p";
INCLUDE "BF5090-O.s";
INCLUDE "BF5093-P.p";
INCLUDE "BF5093-O.s";
INCLUDE "GenDelete.f";

PROCESS BF5093Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF5093Delete -> Title;
        "BF5090-I" -> InputS;
        "BF5090-P" -> RetrieveP;
        "BF5090-O" -> ConfirmS;
        "BF5093-P" -> DeleteP;
        "BF5093-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

