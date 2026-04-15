# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0371Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0370-P.p";
INCLUDE "BF0371-P.p";
INCLUDE "BF0371-I.s";
INCLUDE "BF0372-I.s";
INCLUDE "BF0370-O.s";
INCLUDE "BF0372-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0371Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0371Create -> Title;
        "BF0371-I" -> InputS;
        "BF0371-P" -> CreateP;
        "BF0370-P" -> RetrieveP;
        "BF0372-I" -> EditS;
        "BF0372-P" -> UpdateP;
        "BF0370-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

