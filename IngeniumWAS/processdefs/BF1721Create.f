# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1721Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1720-P.p";
INCLUDE "BF1721-P.p";
INCLUDE "BF1721-I.s";
INCLUDE "BF1722-I.s";
INCLUDE "BF1720-O.s";
INCLUDE "BF1722-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1721Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1721Create -> Title;
        "BF1721-I" -> InputS;
        "BF1721-P" -> CreateP;
        "BF1720-P" -> RetrieveP;
        "BF1722-I" -> EditS;
        "BF1722-P" -> UpdateP;
        "BF1720-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

