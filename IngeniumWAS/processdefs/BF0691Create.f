# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0691Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0690-P.p";
INCLUDE "BF0691-P.p";
INCLUDE "BF0691-I.s";
INCLUDE "BF0692-I.s";
INCLUDE "BF0690-O.s";
INCLUDE "BF0692-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0691Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0691Create -> Title;
        "BF0691-I" -> InputS;
        "BF0691-P" -> CreateP;
        "BF0690-P" -> RetrieveP;
        "BF0692-I" -> EditS;
        "BF0692-P" -> UpdateP;
        "BF0690-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

