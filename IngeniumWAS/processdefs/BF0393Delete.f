# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0393Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0390-P.p";
INCLUDE "BF0390-I.s";
INCLUDE "BF0390-O.s";
INCLUDE "BF0393-O.s";
INCLUDE "BF0393-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0393Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0393Delete -> Title;
        "BF0390-I" -> InputS;
        "BF0390-P" -> RetrieveP;
        "BF0390-O" -> ConfirmS;
        "BF0393-P" -> DeleteP;
        "BF0393-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

