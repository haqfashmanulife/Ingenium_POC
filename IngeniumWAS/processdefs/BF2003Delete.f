# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2003Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2000-P.p";
INCLUDE "BF2000-I.s";
INCLUDE "BF2000-O.s";
INCLUDE "BF2003-P.p";
INCLUDE "GenDelete.f";

PROCESS BF2003Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF2003Delete -> Title;
        "BF2000-I" -> InputS;
        "BF2000-P" -> RetrieveP;
        "BF2000-O" -> ConfirmS;
        "BF2003-P" -> DeleteP;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

