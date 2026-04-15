# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1681Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1680-P.p";
INCLUDE "BF1681-P.p";
INCLUDE "BF1681-I.s";
INCLUDE "BF1682-I.s";
INCLUDE "BF1680-O.s";
INCLUDE "BF1682-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1681Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1681Create -> Title;
        "BF1681-I" -> InputS;
        "BF1681-P" -> CreateP;
        "BF1680-P" -> RetrieveP;
        "BF1682-I" -> EditS;
        "BF1682-P" -> UpdateP;
        "BF1680-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

