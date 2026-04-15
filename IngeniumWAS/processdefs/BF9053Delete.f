# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9053Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9050-I.s";
INCLUDE "BF9050-P.p";
INCLUDE "BF9050-O.s";
INCLUDE "BF9053-P.p";
INCLUDE "BF9053-O.s";
INCLUDE "GenDelete.f";

PROCESS BF9053Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9053Delete -> Title;
        "BF9050-I" -> InputS;
        "BF9050-P" -> RetrieveP;
        "BF9050-O" -> ConfirmS;
        "BF9053-P" -> DeleteP;
        "BF9053-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

