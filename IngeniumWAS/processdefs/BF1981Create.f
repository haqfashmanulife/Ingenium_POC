# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1981Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1980-P.p";
INCLUDE "BF1981-P.p";
INCLUDE "BF1981-I.s";
INCLUDE "BF1982-I.s";
INCLUDE "BF1980-O.s";
INCLUDE "BF1982-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1981Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1981Create -> Title;
        "BF1981-I" -> InputS;
        "BF1981-P" -> CreateP;
        "BF1980-P" -> RetrieveP;
        "BF1982-I" -> EditS;
        "BF1982-P" -> UpdateP;
        "BF1980-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

