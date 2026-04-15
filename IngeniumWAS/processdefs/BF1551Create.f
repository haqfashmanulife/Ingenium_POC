# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1551Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1550-P.p";
INCLUDE "BF1551-P.p";
INCLUDE "BF1551-I.s";
INCLUDE "BF1552-I.s";
INCLUDE "BF1550-O.s";
INCLUDE "BF1552-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1551Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1551Create -> Title;
        "BF1551-I" -> InputS;
        "BF1551-P" -> CreateP;
        "BF1550-P" -> RetrieveP;
        "BF1552-I" -> EditS;
        "BF1552-P" -> UpdateP;
        "BF1550-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

