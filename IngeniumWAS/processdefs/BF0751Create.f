# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0751Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0750-P.p";
INCLUDE "BF0751-P.p";
INCLUDE "BF0751-I.s";
INCLUDE "BF0752-I.s";
INCLUDE "BF0750-O.s";
INCLUDE "BF0752-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0751Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0751Create -> Title;
        "BF0751-I" -> InputS;
        "BF0751-P" -> CreateP;
        "BF0750-P" -> RetrieveP;
        "BF0752-I" -> EditS;
        "BF0752-P" -> UpdateP;
        "BF0750-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

