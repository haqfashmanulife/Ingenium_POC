# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0381Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0380-P.p";
INCLUDE "BF0381-P.p";
INCLUDE "BF0381-I.s";
INCLUDE "BF0382-I.s";
INCLUDE "BF0380-O.s";
INCLUDE "BF0382-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0381Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0381Create -> Title;
        "BF0381-I" -> InputS;
        "BF0381-P" -> CreateP;
        "BF0380-P" -> RetrieveP;
        "BF0382-I" -> EditS;
        "BF0382-P" -> UpdateP;
        "BF0380-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

