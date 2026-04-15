# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF9D41Delete.f                                                *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION DELETE SCREEN               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION DELETE SCREEN            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9D40-P.p";
INCLUDE "BF9D40-I.s";
INCLUDE "BF9D40-O.s";
INCLUDE "BF9D43-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9D43Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9D43Delete -> Title;
        "BF9D40-I" -> InputS;
        "BF9D40-P" -> RetrieveP;
        "BF9D40-O" -> ConfirmS;
        "BF9D43-P" -> DeleteP;
        "BF9D40-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

