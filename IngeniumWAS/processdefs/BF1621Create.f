# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1621Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1620-P.p";
INCLUDE "BF1621-P.p";
INCLUDE "BF1621-I.s";
INCLUDE "BF1622-I.s";
INCLUDE "BF1620-O.s";
INCLUDE "BF1622-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1621Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1621Create -> Title;
        "BF1621-I" -> InputS;
        "BF1621-P" -> CreateP;
        "BF1620-P" -> RetrieveP;
        "BF1622-I" -> EditS;
        "BF1622-P" -> UpdateP;
        "BF1620-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

