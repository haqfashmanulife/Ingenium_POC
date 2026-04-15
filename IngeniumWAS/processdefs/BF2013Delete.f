# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2013Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2010-P.p";
INCLUDE "BF2010-I.s";
INCLUDE "BF2010-O.s";
INCLUDE "BF2013-O.s";
INCLUDE "BF2013-P.p";
INCLUDE "GenDelete.f";

PROCESS BF2013Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF2013Delete -> Title;
        "BF2010-I" -> InputS;
        "BF2010-P" -> RetrieveP;
        "BF2010-O" -> ConfirmS;
        "BF2013-P" -> DeleteP;
        "BF2013-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

