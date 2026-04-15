# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0902Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0900-P.p";
INCLUDE "BF0900-I.s";
INCLUDE "BF0902-I.s";
INCLUDE "BF0900-O.s";
INCLUDE "BF0902-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF0902Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0902Update -> Title;
        "BF0900-I" -> InputS;
        "BF0900-P" -> RetrieveP;
        "BF0902-I" -> EditS;
        "BF0902-P" -> UpdateP;
        "BF0900-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

