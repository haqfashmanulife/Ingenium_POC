# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0611Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0610-P.p";
INCLUDE "BF0611-P.p";
INCLUDE "BF0611-I.s";
INCLUDE "BF0612-I.s";
INCLUDE "BF0610-O.s";
INCLUDE "BF0612-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0611Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            Explicit;
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0611Create -> Title;
        "BF0611-I" -> InputS;
        "BF0611-P" -> CreateP;
        "BF0610-P" -> RetrieveP;
        "BF0612-I" -> EditS;
        "BF0612-P" -> UpdateP;
        "BF0610-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

