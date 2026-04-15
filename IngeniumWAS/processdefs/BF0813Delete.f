# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0813Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0810-P.p";
INCLUDE "BF0810-I.s";
INCLUDE "BF0810-O.s";
INCLUDE "BF0813-O.s";
INCLUDE "BF0813-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0813Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0813Delete -> Title;
        "BF0810-I" -> InputS;
        "BF0810-P" -> RetrieveP;
        "BF0810-O" -> ConfirmS;
        "BF0813-P" -> DeleteP;
        "BF0813-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

