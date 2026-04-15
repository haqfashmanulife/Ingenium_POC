# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0750Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0750-P.p";
INCLUDE "BF0750-I.s";
INCLUDE "BF0750-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF0750Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0750Retrieve -> Title;
        "BF0750-I" -> InputS;
        "BF0750-P" -> RetrieveP;
        "BF0750-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

