# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5091Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5090-P.p";
INCLUDE "BF5091-P.p";
INCLUDE "BF5091-I.s";
INCLUDE "BF5092-I.s";
INCLUDE "BF5090-O.s";
INCLUDE "BF5092-P.p";
INCLUDE "GenCreate.f";

PROCESS BF5091Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF5091Create -> Title;
        "BF5091-I" -> InputS;
        "BF5091-P" -> CreateP;
        "BF5090-P" -> RetrieveP;
        "BF5092-I" -> EditS;
        "BF5092-P" -> UpdateP;
        "BF5090-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

