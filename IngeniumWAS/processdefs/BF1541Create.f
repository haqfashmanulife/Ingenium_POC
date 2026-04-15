# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1541Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1540-P.p";
INCLUDE "BF1541-P.p";
INCLUDE "BF1541-I.s";
INCLUDE "BF1542-I.s";
INCLUDE "BF1540-O.s";
INCLUDE "BF1542-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1541Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1541Create -> Title;
        "BF1541-I" -> InputS;
        "BF1541-P" -> CreateP;
        "BF1540-P" -> RetrieveP;
        "BF1542-I" -> EditS;
        "BF1542-P" -> UpdateP;
        "BF1540-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

