# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0361Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0360-P.p";
INCLUDE "BF0361-P.p";
INCLUDE "BF0361-I.s";
INCLUDE "BF0362-I.s";
INCLUDE "BF0360-O.s";
INCLUDE "BF0362-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0361Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0361Create -> Title;
        "BF0361-I" -> InputS;
        "BF0361-P" -> CreateP;
        "BF0360-P" -> RetrieveP;
        "BF0362-I" -> EditS;
        "BF0362-P" -> UpdateP;
        "BF0360-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

