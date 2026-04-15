# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0061Connect.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0061-P.p";
INCLUDE "BF0061-I.s";
INCLUDE "BF0061-O.s";
INCLUDE "GenProcess.f";
INCLUDE "BF0060-P.p";

PROCESS BF0061Connect
{

    # Process the data for the key value

    STEP Process
    {
        USES P-STEP "BF0060-P";
    }

    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0061Connect -> Title;
        "BF0061-I" -> InputS;
        "BF0061-P" -> ProcessP;
        "BF0061-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

}

