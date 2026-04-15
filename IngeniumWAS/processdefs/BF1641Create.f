# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1641Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1640-P.p";
INCLUDE "BF1641-P.p";
INCLUDE "BF1641-I.s";
INCLUDE "BF1642-I.s";
INCLUDE "BF1640-O.s";
INCLUDE "BF1642-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1641Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1641Create -> Title;
        "BF1641-I" -> InputS;
        "BF1641-P" -> CreateP;
        "BF1640-P" -> RetrieveP;
        "BF1642-I" -> EditS;
        "BF1642-P" -> UpdateP;
        "BF1640-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

