# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1626All.f                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1626-P.p";
INCLUDE "BF1626-I.s";
INCLUDE "BF1626-O.s";
INCLUDE "GenProcess.f";

PROCESS BF1626All
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1626All -> Title;
        "BF1626-I" -> InputS;
        "BF1626-P" -> ProcessP;
        "BF1626-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

