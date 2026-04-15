# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0055Init.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0055-P.p";
INCLUDE "BF0055-I.s";
INCLUDE "BF0055-O.s";
INCLUDE "GenProcess.f";

PROCESS BF0055Init
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0055Init -> Title;
        "BF0055-I" -> InputS;
        "BF0055-P" -> ProcessP;
        "BF0055-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

