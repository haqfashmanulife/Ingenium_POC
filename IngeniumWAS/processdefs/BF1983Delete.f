# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1983Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1980-P.p";
INCLUDE "BF1980-I.s";
INCLUDE "BF1980-O.s";
INCLUDE "BF1983-O.s";
INCLUDE "BF1983-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1983Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1983Delete -> Title;
        "BF1980-I" -> InputS;
        "BF1980-P" -> RetrieveP;
        "BF1980-O" -> ConfirmS;
        "BF1983-P" -> DeleteP;
        "BF1983-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

