# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1813Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1810-P.p";
INCLUDE "BF1810-I.s";
INCLUDE "BF1810-O.s";
INCLUDE "BF1813-O.s";
INCLUDE "BF1813-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1813Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1813Delete -> Title;
        "BF1810-I" -> InputS;
        "BF1810-P" -> RetrieveP;
        "BF1810-O" -> ConfirmS;
        "BF1813-P" -> DeleteP;
        "BF1813-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

