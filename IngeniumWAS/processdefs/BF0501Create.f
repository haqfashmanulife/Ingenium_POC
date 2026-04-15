# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0501Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0500-P.p";
INCLUDE "BF0501-P.p";
INCLUDE "BF0501-I.s";
INCLUDE "BF0502-I.s";
INCLUDE "BF0500-O.s";
INCLUDE "BF0502-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0501Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0501Create -> Title;
        "BF0501-I" -> InputS;
        "BF0501-P" -> CreateP;
        "BF0500-P" -> RetrieveP;
        "BF0502-I" -> EditS;
        "BF0502-P" -> UpdateP;
        "BF0500-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

