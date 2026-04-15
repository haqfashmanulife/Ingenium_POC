# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0991Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0990-P.p";
INCLUDE "BF0991-P.p";
INCLUDE "BF0991-I.s";
INCLUDE "BF0992-I.s";
INCLUDE "BF0990-O.s";
INCLUDE "BF0992-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0991Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0991Create -> Title;
        "BF0991-I" -> InputS;
        "BF0991-P" -> CreateP;
        "BF0990-P" -> RetrieveP;
        "BF0992-I" -> EditS;
        "BF0992-P" -> UpdateP;
        "BF0990-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

