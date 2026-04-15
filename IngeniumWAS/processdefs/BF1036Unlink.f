# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1036Unlink.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1036-P.p";
INCLUDE "BF1036-I.s";
INCLUDE "BF1036-O.s";
INCLUDE "GenProcess.f";

PROCESS BF1036Unlink
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1036Unlink -> Title;
        "BF1036-I" -> InputS;
        "BF1036-P" -> ProcessP;
        "BF1036-O" -> OutputS;
    }


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

