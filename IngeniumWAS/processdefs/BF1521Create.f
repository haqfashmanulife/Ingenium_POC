# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1521Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015995  602J     Use fewer pages and S steps                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1520-P.p";
INCLUDE "BF1521-P.p";
INCLUDE "BF1520-I.s";
INCLUDE "BF1522-I.s";
INCLUDE "BF1520-O.s";
INCLUDE "BF1522-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1521Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1521Create -> Title;
        "BF1520-I" -> InputS;
        "BF1521-P" -> CreateP;
        "BF1520-P" -> RetrieveP;
        "BF1522-I" -> EditS;
        "BF1522-P" -> UpdateP;
        "BF1520-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

