# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0911Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0910-P.p";
INCLUDE "BF0911-P.p";
INCLUDE "BF0911-I.s";
INCLUDE "BF0912-I.s";
INCLUDE "BF0910-O.s";
INCLUDE "BF0912-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0911Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0911Create -> Title;
        "BF0911-I" -> InputS;
        "BF0911-P" -> CreateP;
        "BF0910-P" -> RetrieveP;
        "BF0912-I" -> EditS;
        "BF0912-P" -> UpdateP;
        "BF0910-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

