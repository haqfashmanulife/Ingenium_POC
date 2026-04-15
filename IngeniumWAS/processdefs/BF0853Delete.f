# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0853Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016737  611J     Code cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0850-I.s";
INCLUDE "BF0850-O.s";
INCLUDE "BF0850-P.p";
INCLUDE "BF0853-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0853Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0853Delete -> Title;
        "BF0850-I" -> InputS;
        "BF0850-P" -> RetrieveP;
        "BF0850-O" -> ConfirmS;
        "BF0853-P" -> DeleteP;
        "BF0850-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

