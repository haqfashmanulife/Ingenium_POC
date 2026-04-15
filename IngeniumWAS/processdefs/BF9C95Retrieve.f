#*******************************************************************************
#*  Component:   BF9C95Retrieve.f                                              *
#*  Description: Future dated Trail Calculation Quote Inquiry Process          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
# *  M117PB  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9C95-P.p";
INCLUDE "BF9C95-I.s";
INCLUDE "BF9C95-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9C95Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9C95Retrieve -> Title;
        "BF9C95-I" -> InputS;
        "BF9C95-P" -> RetrieveP;
        "BF9C95-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

