# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9021Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01CP02  6.1      New for release 6.1                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9020-P.p";
INCLUDE "BF9021-P.p";
INCLUDE "BF9020-I.s";
INCLUDE "BF9022-I.s";
INCLUDE "BF9020-O.s";
INCLUDE "BF9022-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9021Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9021Create -> Title;
        "BF9020-I" -> InputS;
        "BF9021-P" -> CreateP;
        "BF9020-P" -> RetrieveP;
        "BF9022-I" -> EditS;
        "BF9022-P" -> UpdateP;
        "BF9020-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

