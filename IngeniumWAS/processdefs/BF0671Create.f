# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0671Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0670-P.p";
INCLUDE "BF0671-P.p";
INCLUDE "BF0671-I.s";
INCLUDE "BF0672-I.s";
INCLUDE "BF0670-O.s";
INCLUDE "BF0672-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0671Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0671Create -> Title;
        "BF0671-I" -> InputS;
        "BF0671-P" -> CreateP;
        "BF0670-P" -> RetrieveP;
        "BF0672-I" -> EditS;
        "BF0672-P" -> UpdateP;
        "BF0670-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

