# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1853Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1850-P.p";
INCLUDE "BF1850-I.s";
INCLUDE "BF1850-O.s";
INCLUDE "BF1853-O.s";
INCLUDE "BF1853-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1853Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1853Delete -> Title;
        "BF1850-I" -> InputS;
        "BF1850-P" -> RetrieveP;
        "BF1850-O" -> ConfirmS;
        "BF1853-P" -> DeleteP;
        "BF1853-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

