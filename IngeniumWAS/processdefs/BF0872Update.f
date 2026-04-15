# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0872Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0870-P.p";
INCLUDE "BF0870-I.s";
INCLUDE "BF0872-I.s";
INCLUDE "BF0870-O.s";
INCLUDE "BF0872-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF0872Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0872Update -> Title;
        "BF0870-I" -> InputS;
        "BF0870-P" -> RetrieveP;
        "BF0872-I" -> EditS;
        "BF0872-P" -> UpdateP;
        "BF0870-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

