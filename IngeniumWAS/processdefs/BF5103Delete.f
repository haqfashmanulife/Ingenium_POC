# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5103Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5100-I.s";
INCLUDE "BF5100-P.p";
INCLUDE "BF5100-O.s";
INCLUDE "BF5103-P.p";
INCLUDE "BF5103-O.s";
INCLUDE "GenDelete.f";

PROCESS BF5103Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF5103Delete -> Title;
        "BF5100-I" -> InputS;
        "BF5100-P" -> RetrieveP;
        "BF5100-O" -> ConfirmS;
        "BF5103-P" -> DeleteP;
        "BF5103-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

