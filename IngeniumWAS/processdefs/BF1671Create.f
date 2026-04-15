# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1671Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1670-P.p";
INCLUDE "BF1671-P.p";
INCLUDE "BF1671-I.s";
INCLUDE "BF1672-I.s";
INCLUDE "BF1670-O.s";
INCLUDE "BF1672-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1671Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1671Create -> Title;
        SESSION.MIR-CO-ID -> MIR-CO-ID;
        "BF1671-I" -> InputS;
        "BF1671-P" -> CreateP;
        "BF1670-P" -> RetrieveP;
        "BF1672-I" -> EditS;
        "BF1672-P" -> UpdateP;
        "BF1670-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

