# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0351Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0350-P.p";
INCLUDE "BF0351-P.p";
INCLUDE "BF0351-I.s";
INCLUDE "BF0352-I.s";
INCLUDE "BF0350-O.s";
INCLUDE "BF0352-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0351Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0351Create -> Title;
        "BF0351-I" -> InputS;
        "BF0351-P" -> CreateP;
        "BF0350-P" -> RetrieveP;
        "BF0352-I" -> EditS;
        "BF0352-P" -> UpdateP;
        "BF0350-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

