# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0861Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0860-P.p";
INCLUDE "BF0861-P.p";
INCLUDE "BF0861-I.s";
INCLUDE "BF0862-I.s";
INCLUDE "BF0860-O.s";
INCLUDE "BF0862-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0861Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0861Create -> Title;
        "BF0861-I" -> InputS;
        "BF0861-P" -> CreateP;
        "BF0860-P" -> RetrieveP;
        "BF0862-I" -> EditS;
        "BF0862-P" -> UpdateP;
        "BF0860-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

