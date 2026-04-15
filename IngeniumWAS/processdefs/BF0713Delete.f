# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0713Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0710-I.s";
INCLUDE "BF0710-P.p";
INCLUDE "BF0710-O.s";
INCLUDE "BF0713-P.p";
INCLUDE "BF0713-O.s";
INCLUDE "GenDelete.f";

PROCESS BF0713Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0713Delete -> Title;
        "BF0710-I" -> InputS;
        "BF0710-P" -> RetrieveP;
        "BF0710-O" -> ConfirmS;
        "BF0713-P" -> DeleteP;
        "BF0713-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

