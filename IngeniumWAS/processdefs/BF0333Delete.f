# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0333Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0330-I.s";
INCLUDE "BF0330-P.p";
INCLUDE "BF0330-O.s";
INCLUDE "BF0333-P.p";
INCLUDE "BF0333-O.s";
INCLUDE "GenDelete.f";

PROCESS BF0333Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0333Delete -> Title;
        "BF0330-I" -> InputS;
        "BF0330-P" -> RetrieveP;
        "BF0330-O" -> ConfirmS;
        "BF0333-P" -> DeleteP;
        "BF0333-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

