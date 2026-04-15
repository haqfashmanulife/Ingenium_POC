# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0289Addition.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0289-P.p";
INCLUDE "BF0289-I.s";
INCLUDE "BF0289-O.s";
INCLUDE "GenProcess.f";

PROCESS BF0289Addition
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0289Addition -> Title;
        "BF0289-I" -> InputS;
        "BF0289-P" -> ProcessP;
        "BF0289-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

