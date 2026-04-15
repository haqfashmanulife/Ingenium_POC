# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0831Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  015983  602J     Changes to use fewer steps                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0830-P.p";
INCLUDE "BF0831-P.p";
INCLUDE "BF0830-I.s";
INCLUDE "BF0832-I.s";
INCLUDE "BF0830-O.s";
INCLUDE "BF0832-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0831Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0831Create -> Title;
        "BF0830-I" -> InputS;
        "BF0831-P" -> CreateP;
        "BF0830-P" -> RetrieveP;
        "BF0832-I" -> EditS;
        "BF0832-P" -> UpdateP;
        "BF0830-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

