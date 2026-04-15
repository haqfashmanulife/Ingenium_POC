# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1661Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1660-P.p";
INCLUDE "BF1661-P.p";
INCLUDE "BF1661-I.s";
INCLUDE "BF1662-I.s";
INCLUDE "BF1660-O.s";
INCLUDE "BF1662-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1661Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1661Create -> Title;
        SESSION.MIR-CO-ID -> MIR-CO-ID;
        "BF1661-I" -> InputS;
        "BF1661-P" -> CreateP;
        "BF1660-P" -> RetrieveP;
        "BF1662-I" -> EditS;
        "BF1662-P" -> UpdateP;
        "BF1660-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

