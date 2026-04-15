#*******************************************************************************
#*  Component:   BF9C22Update.f                                                *
#*  Description: TD Reinstatement Information(REIN) Update function            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  NWLGLR  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9C20-P.p";
INCLUDE "BF9C20-I.s";
INCLUDE "BF9C22-I.s";
INCLUDE "BF9C20-O.s";
INCLUDE "BF9C22-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF9C22Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9C22Update -> Title;
        "BF9C20-I" -> InputS;
        "BF9C20-P" -> RetrieveP;
        "BF9C22-I" -> EditS;
        "BF9C22-P" -> UpdateP;
        "BF9C20-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    
}

