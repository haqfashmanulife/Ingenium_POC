# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0771Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0770-P.p";
INCLUDE "BF0771-P.p";
INCLUDE "BF0771-I.s";
INCLUDE "BF0772-I.s";
INCLUDE "BF0770-O.s";
INCLUDE "BF0772-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0771Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0771Create -> Title;
        "BF0771-I" -> InputS;
        "BF0771-P" -> CreateP;
        "BF0770-P" -> RetrieveP;
        "BF0772-I" -> EditS;
        "BF0772-P" -> UpdateP;
        "BF0770-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

