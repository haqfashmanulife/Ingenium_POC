# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0422Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J     Code Cleanup                                              *
#*******************************************************************************

INCLUDE "BF0420-P.p";
INCLUDE "BF0420-I.s";
INCLUDE "BF0422-I.s";
INCLUDE "BF0420-O.s";
INCLUDE "BF0422-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF0422Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0422Update -> Title;
        "BF0420-I" -> InputS;
        "BF0420-P" -> RetrieveP;
        "BF0422-I" -> EditS;
        "BF0422-P" -> UpdateP;
        "BF0420-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

