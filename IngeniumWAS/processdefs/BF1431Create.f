# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1431Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015996  602J     Use fewer pages and S steps                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1430-P.p";
INCLUDE "BF1431-P.p";
INCLUDE "BF1430-I.s";
INCLUDE "BF1432-I.s";
INCLUDE "BF1430-O.s";
INCLUDE "BF1432-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1431Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1431Create -> Title;
        "BF1430-I" -> InputS;
        "BF1431-P" -> CreateP;
        "BF1430-P" -> RetrieveP;
        "BF1432-I" -> EditS;
        "BF1432-P" -> UpdateP;
        "BF1430-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

