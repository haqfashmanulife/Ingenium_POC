# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0711Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup					       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0711-I.s";
INCLUDE "BF0711-P.p";
INCLUDE "BF0711-O.s";
INCLUDE "BF0711Quote.f";

PROCESS BF0711Create
{
    STEP Main
    {
        USES PROCESS "BF0711Quote";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0711Create -> Title;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

