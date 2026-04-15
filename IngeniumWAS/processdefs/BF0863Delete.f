# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0863Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0860-P.p";
INCLUDE "BF0860-I.s";
INCLUDE "BF0860-O.s";
INCLUDE "BF0863-O.s";
INCLUDE "BF0863-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0863Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0863Delete -> Title;
        "BF0860-I" -> InputS;
        "BF0860-P" -> RetrieveP;
        "BF0860-O" -> ConfirmS;
        "BF0863-P" -> DeleteP;
        "BF0863-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

