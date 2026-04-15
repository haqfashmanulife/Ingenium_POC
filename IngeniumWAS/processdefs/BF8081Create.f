# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8081Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J     Code Cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8080-P.p";
INCLUDE "BF8081-P.p";
INCLUDE "BF8080-I.s";
INCLUDE "BF8082-I.s";
INCLUDE "BF8080-O.s";
INCLUDE "BF8082-P.p";
INCLUDE "GenCreate.f";

PROCESS BF8081Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF8081Create -> Title;
        "BF8080-I" -> InputS;
        "BF8081-P" -> CreateP;
        "BF8080-P" -> RetrieveP;
        "BF8082-I" -> EditS;
        "BF8082-P" -> UpdateP;
        "BF8080-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

