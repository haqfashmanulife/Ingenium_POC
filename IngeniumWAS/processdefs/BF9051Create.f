# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9051Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9050-P.p";
INCLUDE "BF9051-P.p";
INCLUDE "BF9050-I.s";
INCLUDE "BF9052-I.s";
INCLUDE "BF9050-O.s";
INCLUDE "BF9052-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9051Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9051Create -> Title;
        "BF9050-I" -> InputS;
        "BF9051-P" -> CreateP;
        "BF9050-P" -> RetrieveP;
        "BF9052-I" -> EditS;
        "BF9052-P" -> UpdateP;
        "BF9050-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

