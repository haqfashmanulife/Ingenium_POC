# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1951Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1950-P.p";
INCLUDE "BF1951-P.p";
INCLUDE "BF1951-I.s";
INCLUDE "BF1952-I.s";
INCLUDE "BF1950-O.s";
INCLUDE "BF1952-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1951Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1951Create -> Title;
        "BF1951-I" -> InputS;
        "BF1951-P" -> CreateP;
        "BF1950-P" -> RetrieveP;
        "BF1952-I" -> EditS;
        "BF1952-P" -> UpdateP;
        "BF1950-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

