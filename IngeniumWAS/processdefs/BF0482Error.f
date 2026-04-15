# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0482Error.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0482-P.p";
INCLUDE "BF0482-I.s";
INCLUDE "BF0482-O.s";
INCLUDE "GenProcess.f";

PROCESS BF0482Error
{

    # To mark a policy/coverage change history record as Errored

    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0482Error -> Title;
        "BF0482-I" -> InputS;
        "BF0482-P" -> ProcessP;
        "BF0482-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

