# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1061Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1060-P.p";
INCLUDE "BF1061-P.p";
INCLUDE "BF1061-I.s";
INCLUDE "BF1062-I.s";
INCLUDE "BF1060-O.s";
INCLUDE "BF1062-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1061Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1061Create -> Title;
        "BF1061-I" -> InputS;
        "BF1061-P" -> CreateP;
        "BF1060-P" -> RetrieveP;
        "BF1062-I" -> EditS;
        "BF1062-P" -> UpdateP;
        "BF1060-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

