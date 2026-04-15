# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1035Link.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1035-P.p";
INCLUDE "BF1035-I.s";
INCLUDE "BF1035-O.s";
INCLUDE "GenProcess.f";

PROCESS BF1035Link
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1035Link -> Title;
        "BF1035-I" -> InputS;
        "BF1035-P" -> ProcessP;
        "BF1035-O" -> OutputS;
    }


    # Return to list (used RETURN) since FALSE will skip past the -I screen in GenProcess

    IF DisplayInput == "RETURN"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

