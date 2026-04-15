# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1601Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1600-P.p";
INCLUDE "BF1601-P.p";
INCLUDE "BF1601-I.s";
INCLUDE "BF1602-I.s";
INCLUDE "BF1600-O.s";
INCLUDE "BF1602-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1601Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1601Create -> Title;
        "BF1601-I" -> InputS;
        "BF1601-P" -> CreateP;
        "BF1600-P" -> RetrieveP;
        "BF1602-I" -> EditS;
        "BF1602-P" -> UpdateP;
        "BF1600-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

