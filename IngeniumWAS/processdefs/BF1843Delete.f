# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1843Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1840-I.s";
INCLUDE "BF1840-O.s";
INCLUDE "BF1843-O.s";
INCLUDE "BF1840-P.p";
INCLUDE "BF1843-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1843Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1843Delete -> Title;
        "BF1840-I" -> InputS;
        "BF1840-P" -> RetrieveP;
        "BF1840-O" -> ConfirmS;
        "BF1843-P" -> DeleteP;
        "BF1843-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

