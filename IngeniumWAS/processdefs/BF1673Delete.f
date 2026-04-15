# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1673Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1670-P.p";
INCLUDE "BF1670-I.s";
INCLUDE "BF1670-O.s";
INCLUDE "BF1673-O.s";
INCLUDE "BF1673-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1673Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1673Delete -> Title;
        SESSION.MIR-CO-ID -> MIR-CO-ID;
        "BF1670-I" -> InputS;
        "BF1670-P" -> RetrieveP;
        "BF1670-O" -> ConfirmS;
        "BF1673-P" -> DeleteP;
        "BF1673-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

