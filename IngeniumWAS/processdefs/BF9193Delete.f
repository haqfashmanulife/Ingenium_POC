# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:09 PM EDT

#*******************************************************************************
#*  Component:   BF9193Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      NEW FOR CONVERSION POLICIES                               *
#*******************************************************************************

INCLUDE "BF9190-I.s";
INCLUDE "BF9190-P.p";
INCLUDE "BF9190-O.s";
INCLUDE "BF9193-P.p";
INCLUDE "BF9193-O.s";
INCLUDE "GenDelete.f";

PROCESS BF9193Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9193Delete -> Title;
        "BF9190-I" -> InputS;
        "BF9190-P" -> RetrieveP;
        "BF9190-O" -> ConfirmS;
        "BF9193-P" -> DeleteP;
        "BF9193-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

