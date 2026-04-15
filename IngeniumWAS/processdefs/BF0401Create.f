# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0401Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0400-P.p";
INCLUDE "BF0401-P.p";
INCLUDE "BF0401-I.s";
INCLUDE "BF0402-I.s";
INCLUDE "BF0400-O.s";
INCLUDE "BF0402-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0401Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0401Create -> Title;
        "BF0401-I" -> InputS;
        "BF0401-P" -> CreateP;
        "BF0400-P" -> RetrieveP;
        "BF0402-I" -> EditS;
        "BF0402-P" -> UpdateP;
        "BF0400-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

