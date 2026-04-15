# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0262Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*  017151  612J     Code cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0260-P.p";
INCLUDE "BF0260-I.s";
INCLUDE "BF0262-I.s";
INCLUDE "BF0260-O.s";
INCLUDE "BF0262-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF0262Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0262Update -> Title;
        "BF0260-I" -> InputS;
        "BF0260-P" -> RetrieveP;
        "BF0262-I" -> EditS;
        "BF0262-P" -> UpdateP;
        "BF0260-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

