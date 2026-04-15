# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2061Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2060-P.p";
INCLUDE "BF2061-P.p";
INCLUDE "BF2061-I.s";
INCLUDE "BF2062-I.s";
INCLUDE "BF2060-O.s";
INCLUDE "BF2062-P.p";
INCLUDE "GenCreate.f";

PROCESS BF2061Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2061Create -> Title;
        "BF2061-I" -> InputS;
        "BF2061-P" -> CreateP;
        "BF2060-P" -> RetrieveP;
        "BF2062-I" -> EditS;
        "BF2062-P" -> UpdateP;
        "BF2060-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

