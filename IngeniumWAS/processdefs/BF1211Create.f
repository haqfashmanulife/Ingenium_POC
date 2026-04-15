# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1211Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1210-P.p";
INCLUDE "BF1211-P.p";
INCLUDE "BF1211-I.s";
INCLUDE "BF1212-I.s";
INCLUDE "BF1210-O.s";
INCLUDE "BF1212-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1211Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1211Create -> Title;
        "BF1211-I" -> InputS;
        "BF1211-P" -> CreateP;
        "BF1210-P" -> RetrieveP;
        "BF1212-I" -> EditS;
        "BF1212-P" -> UpdateP;
        "BF1210-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

