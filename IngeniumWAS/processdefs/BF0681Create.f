# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0681Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0680-P.p";
INCLUDE "BF0681-P.p";
INCLUDE "BF0681-I.s";
INCLUDE "BF0682-I.s";
INCLUDE "BF0680-O.s";
INCLUDE "BF0682-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0681Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0681Create -> Title;
        "BF0681-I" -> InputS;
        "BF0681-P" -> CreateP;
        "BF0680-P" -> RetrieveP;
        "BF0682-I" -> EditS;
        "BF0682-P" -> UpdateP;
        "BF0680-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

