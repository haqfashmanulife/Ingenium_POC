# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0731Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0730-P.p";
INCLUDE "BF0731-P.p";
INCLUDE "BF0731-I.s";
INCLUDE "BF0732-I.s";
INCLUDE "BF0730-O.s";
INCLUDE "BF0732-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0731Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0731Create -> Title;
        "BF0731-I" -> InputS;
        "BF0731-P" -> CreateP;
        "BF0730-P" -> RetrieveP;
        "BF0732-I" -> EditS;
        "BF0732-P" -> UpdateP;
        "BF0730-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

