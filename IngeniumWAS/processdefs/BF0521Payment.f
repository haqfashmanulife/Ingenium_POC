# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0521Payment.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0521-I.s";
INCLUDE "BF0521-P.p";
INCLUDE "BF0521-O.s";
INCLUDE "GenProcess.f";

PROCESS BF0521Payment
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0521Payment -> Title;
        "BF0521-I" -> InputS;
        "BF0521-P" -> ProcessP;
        "BF0521-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

