# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0961Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0960-P.p";
INCLUDE "BF0961-P.p";
INCLUDE "BF0961-I.s";
INCLUDE "BF0961Data-I.s";
INCLUDE "BF0961-O.s";
INCLUDE "BF0962-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0961Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0961Create -> Title;
        "BF0961-I" -> InputS;
        "BF0961-P" -> CreateP;
        "BF0960-P" -> RetrieveP;
        "BF0961Data-I" -> EditS;
        "BF0962-P" -> UpdateP;
        "BF0961-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

