# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1581Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1580-P.p";
INCLUDE "BF1581-P.p";
INCLUDE "BF1581-I.s";
INCLUDE "BF1582-I.s";
INCLUDE "BF1580-O.s";
INCLUDE "BF1582-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1581Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1581Create -> Title;
        "BF1581-I" -> InputS;
        "BF1581-P" -> CreateP;
        "BF1580-P" -> RetrieveP;
        "BF1582-I" -> EditS;
        "BF1582-P" -> UpdateP;
        "BF1580-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

