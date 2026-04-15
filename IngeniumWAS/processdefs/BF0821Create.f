# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0821Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                             *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0820-P.p";
INCLUDE "BF0821-P.p";
INCLUDE "BF0821-I.s";
INCLUDE "BF0822-I.s";
INCLUDE "BF0820-O.s";
INCLUDE "BF0822-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0821Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0821Create -> Title;
        "BF0821-I" -> InputS;
        "BF0821-P" -> CreateP;
        "BF0820-P" -> RetrieveP;
        "BF0822-I" -> EditS;
        "BF0822-P" -> UpdateP;
        "BF0820-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

