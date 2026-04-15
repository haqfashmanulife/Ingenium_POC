# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9031Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9030-P.p";
INCLUDE "BF9031-P.p";
INCLUDE "BF9031-I.s";
INCLUDE "BF9032-I.s";
INCLUDE "BF9030-O.s";
INCLUDE "BF9032-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9031Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9031Create -> Title;
        "BF9031-I" -> InputS;
        "BF9031-P" -> CreateP;
        "BF9030-P" -> RetrieveP;
        "BF9032-I" -> EditS;
        "BF9032-P" -> UpdateP;
        "BF9030-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

