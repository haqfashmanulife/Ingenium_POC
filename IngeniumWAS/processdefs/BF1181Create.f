# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1181Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1180-P.p";
INCLUDE "BF1181-P.p";
INCLUDE "BF1181-I.s";
INCLUDE "BF1182-I.s";
INCLUDE "BF1180-O.s";
INCLUDE "BF1182-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1181Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1181Create -> Title;
        "BF1181-I" -> InputS;
        "BF1181-P" -> CreateP;
        "BF1180-P" -> RetrieveP;
        "BF1182-I" -> EditS;
        "BF1182-P" -> UpdateP;
        "BF1180-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

