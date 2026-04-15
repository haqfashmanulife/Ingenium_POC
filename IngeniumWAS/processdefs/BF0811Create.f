# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0811Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0810-P.p";
INCLUDE "BF0811-P.p";
INCLUDE "BF0811-I.s";
INCLUDE "BF0812-I.s";
INCLUDE "BF0810-O.s";
INCLUDE "BF0812-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0811Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0811Create -> Title;
        "BF0811-I" -> InputS;
        "BF0811-P" -> CreateP;
        "BF0810-P" -> RetrieveP;
        "BF0812-I" -> EditS;
        "BF0812-P" -> UpdateP;
        "BF0810-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

