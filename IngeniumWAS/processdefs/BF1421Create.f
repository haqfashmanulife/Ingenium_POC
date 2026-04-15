# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1421Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     code cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1420-P.p";
INCLUDE "BF1421-P.p";
INCLUDE "BF1420-I.s";
INCLUDE "BF1422-I.s";
INCLUDE "BF1420-O.s";
INCLUDE "BF1422-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1421Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1421Create -> Title;
        "BF1420-I" -> InputS;
        "BF1421-P" -> CreateP;
        "BF1420-P" -> RetrieveP;
        "BF1422-I" -> EditS;
        "BF1422-P" -> UpdateP;
        "BF1420-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

