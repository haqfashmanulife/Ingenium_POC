# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1741Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1740-P.p";
INCLUDE "BF1741-P.p";
INCLUDE "BF1741-I.s";
INCLUDE "BF1742-I.s";
INCLUDE "BF1740-O.s";
INCLUDE "BF1742-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1741Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1741Create -> Title;
        "BF1741-I" -> InputS;
        "BF1741-P" -> CreateP;
        "BF1740-P" -> RetrieveP;
        "BF1742-I" -> EditS;
        "BF1742-P" -> UpdateP;
        "BF1740-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

