# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1241Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1240-P.p";
INCLUDE "BF1241-P.p";
INCLUDE "BF1241-I.s";
INCLUDE "BF1242-I.s";
INCLUDE "BF1240-O.s";
INCLUDE "BF1242-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1241Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1241Create -> Title;
        "BF1241-I" -> InputS;
        "BF1241-P" -> CreateP;
        "BF1240-P" -> RetrieveP;
        "BF1242-I" -> EditS;
        "BF1242-P" -> UpdateP;
        "BF1240-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

