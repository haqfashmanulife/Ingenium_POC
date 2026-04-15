# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2081Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2080-P.p";
INCLUDE "BF2081-P.p";
INCLUDE "BF2081-I.s";
INCLUDE "BF2082-I.s";
INCLUDE "BF2080-O.s";
INCLUDE "BF2082-P.p";
INCLUDE "GenCreate.f";

PROCESS BF2081Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2081Create -> Title;
        "BF2081-I" -> InputS;
        "BF2081-P" -> CreateP;
        "BF2080-P" -> RetrieveP;
        "BF2082-I" -> EditS;
        "BF2082-P" -> UpdateP;
        "BF2080-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

