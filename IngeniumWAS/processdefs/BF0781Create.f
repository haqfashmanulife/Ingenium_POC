# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0781Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0780-P.p";
INCLUDE "BF0781-P.p";
INCLUDE "BF0781-I.s";
INCLUDE "BF0782-I.s";
INCLUDE "BF0780-O.s";
INCLUDE "BF0782-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0781Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0781Create -> Title;
        "BF0781-I" -> InputS;
        "BF0781-P" -> CreateP;
        "BF0780-P" -> RetrieveP;
        "BF0782-I" -> EditS;
        "BF0782-P" -> UpdateP;
        "BF0780-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

