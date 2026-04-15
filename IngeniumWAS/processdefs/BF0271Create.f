# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0271Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0270-P.p";
INCLUDE "BF0271-P.p";
INCLUDE "BF0271-I.s";
INCLUDE "BF0272-I.s";
INCLUDE "BF0270-O.s";
INCLUDE "BF0272-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0271Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0271Create -> Title;
        "BF0271-I" -> InputS;
        "BF0271-P" -> CreateP;
        "BF0270-P" -> RetrieveP;
        "BF0272-I" -> EditS;
        "BF0272-P" -> UpdateP;
        "BF0270-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

