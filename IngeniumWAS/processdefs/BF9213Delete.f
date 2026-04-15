# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9213Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02GL03   6.1     New for Manuflex Phase2                                   *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9210-I.s";
INCLUDE "BF9210-P.p";
INCLUDE "BF9210-O.s";
INCLUDE "BF9213-P.p";
INCLUDE "BF9213-O.s";
INCLUDE "GenDelete.f";

PROCESS BF9213Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9213Delete -> Title;
        "BF9210-I" -> InputS;
        "BF9210-P" -> RetrieveP;
        "BF9210-O" -> ConfirmS;
        "BF9213-P" -> DeleteP;
        "BF9213-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

