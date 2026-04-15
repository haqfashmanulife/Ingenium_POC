# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9093Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   25JAN02  Module created                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9090-P.p";
INCLUDE "BF9090-I.s";
INCLUDE "BF9090-O.s";
INCLUDE "BF9093-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9093Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9093Delete -> Title;
        "BF9090-I" -> InputS;
        "BF9090-P" -> RetrieveP;
        "BF9090-O" -> ConfirmS;
        "BF9093-P" -> DeleteP;
        "BF9090-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

