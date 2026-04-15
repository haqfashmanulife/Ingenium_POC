# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2101Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2100-P.p";
INCLUDE "BF2101-P.p";
INCLUDE "BF2101-I.s";
INCLUDE "BF2102-I.s";
INCLUDE "BF2100-O.s";
INCLUDE "BF2102-P.p";
INCLUDE "GenCreate.f";

PROCESS BF2101Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2101Create -> Title;
        "BF2101-I" -> InputS;
        "BF2101-P" -> CreateP;
        "BF2100-P" -> RetrieveP;
        "BF2102-I" -> EditS;
        "BF2102-P" -> UpdateP;
        "BF2100-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

