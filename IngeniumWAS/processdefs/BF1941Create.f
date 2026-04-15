# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1941Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1940-P.p";
INCLUDE "BF1941-P.p";
INCLUDE "BF1941-I.s";
INCLUDE "BF1942-I.s";
INCLUDE "BF1940-O.s";
INCLUDE "BF1942-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1941Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1941Create -> Title;
        "BF1941-I" -> InputS;
        "BF1941-P" -> CreateP;
        "BF1940-P" -> RetrieveP;
        "BF1942-I" -> EditS;
        "BF1942-P" -> UpdateP;
        "BF1940-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

