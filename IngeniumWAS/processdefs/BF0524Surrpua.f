# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0524Surrpua.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0524-I.s";
INCLUDE "BF0524-P.p";
INCLUDE "BF0524-O.s";
INCLUDE "GenProcess.f";

PROCESS BF0524Surrpua
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0524Surrpua -> Title;
        "BF0524-I" -> InputS;
        "BF0524-P" -> ProcessP;
        "BF0524-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

