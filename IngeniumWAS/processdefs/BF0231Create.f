# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0231Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0230-P.p";
INCLUDE "BF0231-P.p";
INCLUDE "BF0230-I.s";
INCLUDE "BF0232-I.s";
INCLUDE "BF0230-O.s";
INCLUDE "BF0232-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0231Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0231Create -> Title;
        "BF0230-I" -> InputS;
        "BF0231-P" -> CreateP;
        "BF0230-P" -> RetrieveP;
        "BF0232-I" -> EditS;
        "BF0232-P" -> UpdateP;
        "BF0230-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

