# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0526Bpay.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0526-I.s";
INCLUDE "BF0526-P.p";
INCLUDE "BF0526-O.s";
INCLUDE "GenProcess.f";

PROCESS BF0526Bpay
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0526Bpay -> Title;
        "BF0526-I" -> InputS;
        "BF0526-P" -> ProcessP;
        "BF0526-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

