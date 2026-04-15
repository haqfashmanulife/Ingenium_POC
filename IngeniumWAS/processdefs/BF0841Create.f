# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0841Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0840-P.p";
INCLUDE "BF0841-P.p";
INCLUDE "BF0841-I.s";
INCLUDE "BF0842-I.s";
INCLUDE "BF0840-O.s";
INCLUDE "BF0842-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0841Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0841Create -> Title;
        "BF0841-I" -> InputS;
        "BF0841-P" -> CreateP;
        "BF0840-P" -> RetrieveP;
        "BF0842-I" -> EditS;
        "BF0842-P" -> UpdateP;
        "BF0840-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

