# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2091Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2090-P.p";
INCLUDE "BF2091-P.p";
INCLUDE "BF2091-I.s";
INCLUDE "BF2092-I.s";
INCLUDE "BF2090-O.s";
INCLUDE "BF2092-P.p";
INCLUDE "GenCreate.f";

PROCESS BF2091Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2091Create -> Title;
        "BF2091-I" -> InputS;
        "BF2091-P" -> CreateP;
        "BF2090-P" -> RetrieveP;
        "BF2092-I" -> EditS;
        "BF2092-P" -> UpdateP;
        "BF2090-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

