# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9023Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01CP02  6.1      New for release 6.1                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9020-I.s";
INCLUDE "BF9020-P.p";
INCLUDE "BF9020-O.s";
INCLUDE "BF9023-P.p";
INCLUDE "BF9023-O.s";
INCLUDE "GenDelete.f";

PROCESS BF9023Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9023Delete -> Title;
        "BF9020-I" -> InputS;
        "BF9020-P" -> RetrieveP;
        "BF9020-O" -> ConfirmS;
        "BF9023-P" -> DeleteP;
        "BF9023-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

