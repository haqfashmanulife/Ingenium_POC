# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0791Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0790-P.p";
INCLUDE "BF0791-P.p";
INCLUDE "BF0791-I.s";
INCLUDE "BF0792-I.s";
INCLUDE "BF0790-O.s";
INCLUDE "BF0792-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0791Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0791Create -> Title;
        "BF0791-I" -> InputS;
        "BF0791-P" -> CreateP;
        "BF0790-P" -> RetrieveP;
        "BF0792-I" -> EditS;
        "BF0792-P" -> UpdateP;
        "BF0790-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

