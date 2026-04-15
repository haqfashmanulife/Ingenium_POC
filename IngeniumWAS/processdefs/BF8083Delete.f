# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8083Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J     Code Cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8080-P.p";
INCLUDE "BF8080-I.s";
INCLUDE "BF8080-O.s";
INCLUDE "BF8080-O.s";
INCLUDE "BF8083-P.p";
INCLUDE "GenDelete.f";

PROCESS BF8083Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF8083Delete -> Title;
        "BF8080-I" -> InputS;
        "BF8080-P" -> RetrieveP;
        "BF8080-O" -> ConfirmS;
        "BF8083-P" -> DeleteP;
        "BF8080-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

