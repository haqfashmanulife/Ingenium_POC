# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9D51Create.f                                                *
#*  Description: CURRENCY EXCHANGE RATE CREATE SCREEN                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M271O2  CTS     CURRENCY EXCHANGE RATE CREATE SCREEN                       *
#*******************************************************************************

INCLUDE "BF9D50-I.s";
INCLUDE "BF9D50-P.p";
INCLUDE "BF9D51-P.p";
INCLUDE "BF9D52-I.s";
INCLUDE "BF9D50-O.s";
INCLUDE "BF9D52-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9D51Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9D51Create -> Title;
        "BF9D50-I" -> InputS;
        "BF9D51-P" -> CreateP;
        "BF9D50-P" -> RetrieveP;
        "BF9D52-I" -> EditS;
        "BF9D52-P" -> UpdateP;
        "BF9D50-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}
