# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1591Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1590-P.p";
INCLUDE "BF1591-P.p";
INCLUDE "BF1591-I.s";
INCLUDE "BF1592-I.s";
INCLUDE "BF1590-O.s";
INCLUDE "BF1592-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1591Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1591Create -> Title;
        "BF1591-I" -> InputS;
        "BF1591-P" -> CreateP;
        "BF1590-P" -> RetrieveP;
        "BF1592-I" -> EditS;
        "BF1592-P" -> UpdateP;
        "BF1590-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

