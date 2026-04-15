# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9211Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02GL03   6.1     New for Manuflex Phase2                                   *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9210-P.p";
INCLUDE "BF9211-P.p";
INCLUDE "BF9210-I.s";
INCLUDE "BF9212-I.s";
INCLUDE "BF9210-O.s";
INCLUDE "BF9212-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9211Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9211Create -> Title;
        "BF9210-I" -> InputS;
        "BF9211-P" -> CreateP;
        "BF9210-P" -> RetrieveP;
        "BF9212-I" -> EditS;
        "BF9212-P" -> UpdateP;
        "BF9210-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

