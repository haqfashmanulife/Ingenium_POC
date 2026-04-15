# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0291Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0290-P.p";
INCLUDE "BF0291-P.p";
INCLUDE "BF0291-I.s";
INCLUDE "BF0292-I.s";
INCLUDE "BF0290-O.s";
INCLUDE "BF0292-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0291Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0291Create -> Title;
        "BF0291-I" -> InputS;
        "BF0291-P" -> CreateP;
        "BF0290-P" -> RetrieveP;
        "BF0292-I" -> EditS;
        "BF0292-P" -> UpdateP;
        "BF0290-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

