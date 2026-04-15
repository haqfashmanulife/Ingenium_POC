# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0823Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0820-P.p";
INCLUDE "BF0820-I.s";
INCLUDE "BF0820-O.s";
INCLUDE "BF0823-O.s";
INCLUDE "BF0823-P.p";
INCLUDE "GenDelete.f";

PROCESS BF0823Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0823Delete -> Title;
        "BF0820-I" -> InputS;
        "BF0820-P" -> RetrieveP;
        "BF0820-O" -> ConfirmS;
        "BF0823-P" -> DeleteP;
        "BF0823-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

