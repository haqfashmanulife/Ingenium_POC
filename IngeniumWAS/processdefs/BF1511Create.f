# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1511Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1510-P.p";
INCLUDE "BF1511-P.p";
INCLUDE "BF1511-I.s";
INCLUDE "BF1512-I.s";
INCLUDE "BF1510-O.s";
INCLUDE "BF1512-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1511Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1511Create -> Title;
        SESSION.MIR-CO-ID -> MIR-CO-ID;
        "BF1511-I" -> InputS;
        "BF1511-P" -> CreateP;
        "BF1510-P" -> RetrieveP;
        "BF1512-I" -> EditS;
        "BF1512-P" -> UpdateP;
        "BF1510-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

