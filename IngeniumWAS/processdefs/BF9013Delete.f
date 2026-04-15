# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9013Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL18  6.1      New for release 6.1                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9010-I.s";
INCLUDE "BF9010-P.p";
INCLUDE "BF9010-O.s";
INCLUDE "BF9013-P.p";
INCLUDE "BF9013-O.s";
INCLUDE "GenDelete.f";

PROCESS BF9013Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9013Delete -> Title;
        "BF9010-I" -> InputS;
        "BF9010-P" -> RetrieveP;
        "BF9010-O" -> ConfirmS;
        "BF9013-P" -> DeleteP;
        "BF9013-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

