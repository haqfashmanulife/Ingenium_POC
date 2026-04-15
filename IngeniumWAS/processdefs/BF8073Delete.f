# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8073Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8070-P.p";
INCLUDE "BF8070-I.s";
INCLUDE "BF8070-O.s";
INCLUDE "BF8073-O.s";
INCLUDE "BF8073-P.p";
INCLUDE "GenDelete.f";

PROCESS BF8073Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF8073Delete -> Title;
        "BF8070-I" -> InputS;
        "BF8070-P" -> RetrieveP;
        "BF8070-O" -> ConfirmS;
        "BF8073-P" -> DeleteP;
        "BF8073-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

