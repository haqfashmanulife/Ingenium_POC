# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0525Bcalc.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0525-I.s";
INCLUDE "BF0525-P.p";
INCLUDE "BF0525-O.s";
INCLUDE "GenProcess.f";

PROCESS BF0525Bcalc
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0525Bcalc -> Title;
        "BF0525-I" -> InputS;
        "BF0525-P" -> ProcessP;
        "BF0525-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

