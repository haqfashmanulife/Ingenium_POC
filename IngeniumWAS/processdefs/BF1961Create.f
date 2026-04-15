# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1961Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1960-P.p";
INCLUDE "BF1961-P.p";
INCLUDE "BF1961-I.s";
INCLUDE "BF1962-I.s";
INCLUDE "BF1960-O.s";
INCLUDE "BF1962-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1961Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1961Create -> Title;
        "BF1961-I" -> InputS;
        "BF1961-P" -> CreateP;
        "BF1960-P" -> RetrieveP;
        "BF1962-I" -> EditS;
        "BF1962-P" -> UpdateP;
        "BF1960-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

