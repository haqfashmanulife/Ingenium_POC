# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0481Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0481-P.p";
INCLUDE "BF0481-I.s";
INCLUDE "BF0481-O.s";
INCLUDE "GenProcess.f";

PROCESS BF0481Reversal
{

    # To mark a policy/coverage change history record as Reversed

    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0481Reversal -> Title;
        "BF0481-I" -> InputS;
        "BF0481-P" -> ProcessP;
        "BF0481-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

