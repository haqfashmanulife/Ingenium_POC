# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9061Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB01  TMC      New for MCL                                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9060-P.p";
INCLUDE "BF9061-P.p";
INCLUDE "BF9060-I.s";
INCLUDE "BF9062-I.s";
INCLUDE "BF9060-O.s";
INCLUDE "BF9062-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9061Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9061Create -> Title;
        "BF9060-I" -> InputS;
        "BF9061-P" -> CreateP;
        "BF9060-P" -> RetrieveP;
        "BF9062-I" -> EditS;
        "BF9062-P" -> UpdateP;
        "BF9060-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

