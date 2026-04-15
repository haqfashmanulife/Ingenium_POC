# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0311Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0310-P.p";
INCLUDE "BF0311-P.p";
INCLUDE "BF0311-I.s";
INCLUDE "BF0312-I.s";
INCLUDE "BF0310-O.s";
INCLUDE "BF0312-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0311Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0311Create -> Title;
        "BF0311-I" -> InputS;
        "BF0311-P" -> CreateP;
        "BF0310-P" -> RetrieveP;
        "BF0312-I" -> EditS;
        "BF0312-P" -> UpdateP;
        "BF0310-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

