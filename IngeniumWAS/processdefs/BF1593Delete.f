# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1593Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1590-I.s";
INCLUDE "BF1590-P.p";
INCLUDE "BF1590-O.s";
INCLUDE "BF1593-P.p";
INCLUDE "BF1593-O.s";
INCLUDE "GenDelete.f";

PROCESS BF1593Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1593Delete -> Title;
        "BF1590-I" -> InputS;
        "BF1590-P" -> RetrieveP;
        "BF1590-O" -> ConfirmS;
        "BF1593-P" -> DeleteP;
        "BF1593-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

