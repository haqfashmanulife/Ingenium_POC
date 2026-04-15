# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2111Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2110-P.p";
INCLUDE "BF2111-P.p";
INCLUDE "BF2111-I.s";
INCLUDE "BF2112-I.s";
INCLUDE "BF2110-O.s";
INCLUDE "BF2112-P.p";
INCLUDE "GenCreate.f";

PROCESS BF2111Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2111Create -> Title;
        "BF2111-I" -> InputS;
        "BF2111-P" -> CreateP;
        "BF2110-P" -> RetrieveP;
        "BF2112-I" -> EditS;
        "BF2112-P" -> UpdateP;
        "BF2110-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

