# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0520Calc.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0520-I.s";
INCLUDE "BF0520-P.p";
INCLUDE "BF0520-O.s";
INCLUDE "GenProcess.f";

PROCESS BF0520Calc
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0520Calc -> Title;
        "BF0520-I" -> InputS;
        "BF0520-P" -> ProcessP;
        "BF0520-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

