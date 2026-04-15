# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0932Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0930-P.p";
INCLUDE "BF0930-I.s";
INCLUDE "BF0932-I.s";
INCLUDE "BF0930-O.s";
INCLUDE "BF0932-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF0932Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0932Update -> Title;
        "BF0930-I" -> InputS;
        "BF0930-P" -> RetrieveP;
        "BF0932-I" -> EditS;
        "BF0932-P" -> UpdateP;
        "BF0930-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

