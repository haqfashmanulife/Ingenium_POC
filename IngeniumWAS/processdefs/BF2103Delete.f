# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2103Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2100-P.p";
INCLUDE "BF2100-I.s";
INCLUDE "BF2100-O.s";
INCLUDE "BF2103-O.s";
INCLUDE "BF2103-P.p";
INCLUDE "GenDelete.f";

PROCESS BF2103Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF2103Delete -> Title;
        "BF2100-I" -> InputS;
        "BF2100-P" -> RetrieveP;
        "BF2100-O" -> ConfirmS;
        "BF2103-P" -> DeleteP;
        "BF2103-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

