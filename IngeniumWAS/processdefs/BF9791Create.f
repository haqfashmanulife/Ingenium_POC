# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9791Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02AC03  01MAY02  Module created                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9790-P.p";
INCLUDE "BF9791-P.p";
INCLUDE "BF9790-I.s";
INCLUDE "BF9792-I.s";
INCLUDE "BF9790-O.s";
INCLUDE "BF9792-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9791Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9791Create -> Title;
        "BF9790-I" -> InputS;
        "BF9791-P" -> CreateP;
        "BF9790-P" -> RetrieveP;
        "BF9792-I" -> EditS;
        "BF9792-P" -> UpdateP;
        "BF9790-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

