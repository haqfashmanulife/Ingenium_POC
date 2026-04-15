# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1481Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1480-P.p";
INCLUDE "BF1481-P.p";
INCLUDE "BF1481-I.s";
INCLUDE "BF1482-I.s";
INCLUDE "BF1480-O.s";
INCLUDE "BF1482-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1481Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1481Create -> Title;
        "BF1481-I" -> InputS;
        "BF1481-P" -> CreateP;
        "BF1480-P" -> RetrieveP;
        "BF1482-I" -> EditS;
        "BF1482-P" -> UpdateP;
        "BF1480-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

