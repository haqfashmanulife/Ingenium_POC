# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0703Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0700-P.p";
INCLUDE "BF0700-I.s";
INCLUDE "BF0700-O.s";
INCLUDE "BF0703-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0703Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0703Delete -> Title;
        "BF0700-I" -> InputS;
        "BF0700-P" -> RetrieveP;
        "BF0700-O" -> ConfirmS;
        "BF0703-P" -> DeleteP;
        "BF0700-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

