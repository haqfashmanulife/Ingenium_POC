# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1663Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1660-P.p";
INCLUDE "BF1660-I.s";
INCLUDE "BF1660-O.s";
INCLUDE "BF1663-O.s";
INCLUDE "BF1663-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1663Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1663Delete -> Title;
        SESSION.MIR-CO-ID -> MIR-CO-ID;
        "BF1660-I" -> InputS;
        "BF1660-P" -> RetrieveP;
        "BF1660-O" -> ConfirmS;
        "BF1663-P" -> DeleteP;
        "BF1663-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

