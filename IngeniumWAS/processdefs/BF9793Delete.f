# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9793Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   25JAN02  Module created                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9790-P.p";
INCLUDE "BF9790-I.s";
INCLUDE "BF9790-O.s";
INCLUDE "BF9793-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9793Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9793Delete -> Title;
        "BF9790-I" -> InputS;
        "BF9790-P" -> RetrieveP;
        "BF9790-O" -> ConfirmS;
        "BF9793-P" -> DeleteP;
        "BF9790-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

