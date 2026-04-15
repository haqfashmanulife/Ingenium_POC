# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2041Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2040-P.p";
INCLUDE "BF2041-P.p";
INCLUDE "BF2041-I.s";
INCLUDE "BF2042-I.s";
INCLUDE "BF2040-O.s";
INCLUDE "BF2042-P.p";
INCLUDE "GenCreate.f";

PROCESS BF2041Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2041Create -> Title;
        "BF2041-I" -> InputS;
        "BF2041-P" -> CreateP;
        "BF2040-P" -> RetrieveP;
        "BF2042-I" -> EditS;
        "BF2042-P" -> UpdateP;
        "BF2040-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

