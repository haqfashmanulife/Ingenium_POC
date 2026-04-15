# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1513Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1510-P.p";
INCLUDE "BF1510-I.s";
INCLUDE "BF1510-O.s";
INCLUDE "BF1513-O.s";
INCLUDE "BF1513-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1513Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1513Delete -> Title;
        SESSION.MIR-CO-ID -> MIR-CO-ID;
        "BF1510-I" -> InputS;
        "BF1510-P" -> RetrieveP;
        "BF1510-O" -> ConfirmS;
        "BF1513-P" -> DeleteP;
        "BF1513-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

