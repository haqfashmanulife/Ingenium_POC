# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9011Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL18  6.1      New for release 6.1                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9010-P.p";
INCLUDE "BF9011-P.p";
INCLUDE "BF9010-I.s";
INCLUDE "BF9012-I.s";
INCLUDE "BF9010-O.s";
INCLUDE "BF9012-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9011Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9011Create -> Title;
        "BF9010-I" -> InputS;
        "BF9011-P" -> CreateP;
        "BF9010-P" -> RetrieveP;
        "BF9012-I" -> EditS;
        "BF9012-P" -> UpdateP;
        "BF9010-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

