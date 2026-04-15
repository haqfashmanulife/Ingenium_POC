# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1051Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1050-P.p";
INCLUDE "BF1051-P.p";
INCLUDE "BF1051-I.s";
INCLUDE "BF1052-I.s";
INCLUDE "BF1050-O.s";
INCLUDE "BF1052-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1051Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1051Create -> Title;
        "BF1051-I" -> InputS;
        "BF1051-P" -> CreateP;
        "BF1050-P" -> RetrieveP;
        "BF1052-I" -> EditS;
        "BF1052-P" -> UpdateP;
        "BF1050-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

