# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1321Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1320-P.p";
INCLUDE "BF1321-P.p";
INCLUDE "BF1321-I.s";
INCLUDE "BF1322-I.s";
INCLUDE "BF1320-O.s";
INCLUDE "BF1322-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1321Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1321Create -> Title;
        "BF1321-I" -> InputS;
        "BF1321-P" -> CreateP;
        "BF1320-P" -> RetrieveP;
        "BF1322-I" -> EditS;
        "BF1322-P" -> UpdateP;
        "BF1320-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

