# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0701Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0700-P.p";
INCLUDE "BF0701-P.p";
INCLUDE "BF0700-I.s";
INCLUDE "BF0702-I.s";
INCLUDE "BF0700-O.s";
INCLUDE "BF0702-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0701Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0701Create -> Title;
        "BF0700-I" -> InputS;
        "BF0701-P" -> CreateP;
        "BF0700-P" -> RetrieveP;
        "BF0702-I" -> EditS;
        "BF0702-P" -> UpdateP;
        "BF0700-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

