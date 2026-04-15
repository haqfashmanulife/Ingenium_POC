# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0341Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0340-P.p";
INCLUDE "BF0341-P.p";
INCLUDE "BF0341-I.s";
INCLUDE "BF0342-I.s";
INCLUDE "BF0340-O.s";
INCLUDE "BF0342-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0341Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0341Create -> Title;
        "BF0341-I" -> InputS;
        "BF0341-P" -> CreateP;
        "BF0340-P" -> RetrieveP;
        "BF0342-I" -> EditS;
        "BF0342-P" -> UpdateP;
        "BF0340-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

