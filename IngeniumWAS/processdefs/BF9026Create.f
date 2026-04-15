# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9026Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9025-P.p";
INCLUDE "BF9026-P.p";
INCLUDE "BF9025-I.s";
INCLUDE "BF9027-I.s";
INCLUDE "BF9025-O.s";
INCLUDE "BF9027-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9026Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9026Create -> Title;
        "BF9025-I" -> InputS;
        "BF9026-P" -> CreateP;
        "BF9025-P" -> RetrieveP;
        "BF9027-I" -> EditS;
        "BF9027-P" -> UpdateP;
        "BF9025-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

