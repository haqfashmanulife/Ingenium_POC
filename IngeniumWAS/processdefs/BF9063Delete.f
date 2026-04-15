# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9063Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB01  TMC      New for MCL                                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9060-I.s";
INCLUDE "BF9060-P.p";
INCLUDE "BF9060-O.s";
INCLUDE "BF9063-P.p";
INCLUDE "BF9063-O.s";
INCLUDE "GenDelete.f";

PROCESS BF9063Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9063Delete -> Title;
        "BF9060-I" -> InputS;
        "BF9060-P" -> RetrieveP;
        "BF9060-O" -> ConfirmS;
        "BF9063-P" -> DeleteP;
        "BF9063-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

