# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1271Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1270-P.p";
INCLUDE "BF1271-P.p";
INCLUDE "BF1271-I.s";
INCLUDE "BF1272-I.s";
INCLUDE "BF1270-O.s";
INCLUDE "BF1272-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1271Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1271Create -> Title;
        "BF1271-I" -> InputS;
        "BF1271-P" -> CreateP;
        "BF1270-P" -> RetrieveP;
        "BF1272-I" -> EditS;
        "BF1272-P" -> UpdateP;
        "BF1270-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

