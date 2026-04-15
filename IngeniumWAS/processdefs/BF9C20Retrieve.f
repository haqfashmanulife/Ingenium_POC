#*******************************************************************************
#*  Component:   BF9C20Retrieve.f                                              *
#*  Description: TD Reinstatement Information(REIN) Retrieve function          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9C20-P.p";
INCLUDE "BF9C20-I.s";
INCLUDE "BF9C20-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9C20Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9C20Retrieve -> Title;
        "BF9C20-I" -> InputS;
        "BF9C20-P" -> RetrieveP;
        "BF9C20-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


}

