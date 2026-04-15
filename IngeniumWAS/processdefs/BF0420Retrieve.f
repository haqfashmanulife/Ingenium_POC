# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0420Retrieve.f                                              *
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
INCLUDE "BF0420-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF0420Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0420Retrieve -> Title;
        "BF0420-I" -> InputS;
        "BF0420-P" -> RetrieveP;
        "BF0420-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

