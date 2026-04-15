# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0801Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0800-P.p";
INCLUDE "BF0801-P.p";
INCLUDE "BF0801-I.s";
INCLUDE "BF0802-I.s";
INCLUDE "BF0800-O.s";
INCLUDE "BF0802-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0801Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0801Create -> Title;
        "BF0801-I" -> InputS;
        "BF0801-P" -> CreateP;
        "BF0800-P" -> RetrieveP;
        "BF0802-I" -> EditS;
        "BF0802-P" -> UpdateP;
        "BF0800-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

