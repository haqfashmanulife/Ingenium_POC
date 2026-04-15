# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0981Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0980-P.p";
INCLUDE "BF0981-P.p";
INCLUDE "BF0981-I.s";
INCLUDE "BF0982-I.s";
INCLUDE "BF0980-O.s";
INCLUDE "BF0982-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0981Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0981Create -> Title;
        "BF0981-I" -> InputS;
        "BF0981-P" -> CreateP;
        "BF0980-P" -> RetrieveP;
        "BF0982-I" -> EditS;
        "BF0982-P" -> UpdateP;
        "BF0980-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

