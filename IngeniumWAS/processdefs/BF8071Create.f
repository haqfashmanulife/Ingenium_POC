# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8071Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8070-P.p";
INCLUDE "BF8071-P.p";
INCLUDE "BF8071-I.s";
INCLUDE "BF8072-I.s";
INCLUDE "BF8070-O.s";
INCLUDE "BF8072-P.p";
INCLUDE "GenCreate.f";

PROCESS BF8071Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF8071Create -> Title;
        "BF8071-I" -> InputS;
        "BF8071-P" -> CreateP;
        "BF8070-P" -> RetrieveP;
        "BF8072-I" -> EditS;
        "BF8072-P" -> UpdateP;
        "BF8070-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

