# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0601Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0600-P.p";
INCLUDE "BF0601-P.p";
INCLUDE "BF0601-I.s";
INCLUDE "BF0602-I.s";
INCLUDE "BF0600-O.s";
INCLUDE "BF0602-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0601Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0601Create -> Title;
        "BF0601-I" -> InputS;
        "BF0601-P" -> CreateP;
        "BF0600-P" -> RetrieveP;
        "BF0602-I" -> EditS;
        "BF0602-P" -> UpdateP;
        "BF0600-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

