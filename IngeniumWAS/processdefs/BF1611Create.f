# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1611Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1610-P.p";
INCLUDE "BF1611-P.p";
INCLUDE "BF1611-I.s";
INCLUDE "BF1612-I.s";
INCLUDE "BF1610-O.s";
INCLUDE "BF1612-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1611Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1611Create -> Title;
        "BF1611-I" -> InputS;
        "BF1611-P" -> CreateP;
        "BF1610-P" -> RetrieveP;
        "BF1612-I" -> EditS;
        "BF1612-P" -> UpdateP;
        "BF1610-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

