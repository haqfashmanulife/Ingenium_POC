# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1031Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1030-P.p";
INCLUDE "BF1031-P.p";
INCLUDE "BF1031-I.s";
INCLUDE "BF1032-I.s";
INCLUDE "BF1030-O.s";
INCLUDE "BF1032-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1031Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1031Create -> Title;
        "BF1031-I" -> InputS;
        "BF1031-P" -> CreateP;
        "BF1030-P" -> RetrieveP;
        "BF1032-I" -> EditS;
        "BF1032-P" -> UpdateP;
        "BF1030-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

