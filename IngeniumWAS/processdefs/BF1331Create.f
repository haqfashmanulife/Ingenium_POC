# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1331Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1330-P.p";
INCLUDE "BF1331-P.p";
INCLUDE "BF1330-I.s";
INCLUDE "BF1332-I.s";
INCLUDE "BF1330-O.s";
INCLUDE "BF1332-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1331Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1331Create -> Title;
        "BF1330-I" -> InputS;
        "BF1331-P" -> CreateP;
        "BF1330-P" -> RetrieveP;
        "BF1332-I" -> EditS;
        "BF1332-P" -> UpdateP;
        "BF1330-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

