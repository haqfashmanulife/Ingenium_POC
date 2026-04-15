# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0931Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0930-P.p";
INCLUDE "BF0931-P.p";
INCLUDE "BF0931-I.s";
INCLUDE "BF0932-I.s";
INCLUDE "BF0930-O.s";
INCLUDE "BF0932-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0931Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0931Create -> Title;
        "BF0931-I" -> InputS;
        "BF0931-P" -> CreateP;
        "BF0930-P" -> RetrieveP;
        "BF0932-I" -> EditS;
        "BF0932-P" -> UpdateP;
        "BF0930-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

