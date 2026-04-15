# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0391Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0390-P.p";
INCLUDE "BF0391-P.p";
INCLUDE "BF0391-I.s";
INCLUDE "BF0392-I.s";
INCLUDE "BF0390-O.s";
INCLUDE "BF0392-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0391Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0391Create -> Title;
        "BF0391-I" -> InputS;
        "BF0391-P" -> CreateP;
        "BF0390-P" -> RetrieveP;
        "BF0392-I" -> EditS;
        "BF0392-P" -> UpdateP;
        "BF0390-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

