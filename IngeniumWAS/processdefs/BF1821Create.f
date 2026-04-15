# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1821Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1820-P.p";
INCLUDE "BF1821-P.p";
INCLUDE "BF1821-I.s";
INCLUDE "BF1822-I.s";
INCLUDE "BF1820-O.s";
INCLUDE "BF1822-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1821Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1821Create -> Title;
        "BF1821-I" -> InputS;
        "BF1821-P" -> CreateP;
        "BF1820-P" -> RetrieveP;
        "BF1822-I" -> EditS;
        "BF1822-P" -> UpdateP;
        "BF1820-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

