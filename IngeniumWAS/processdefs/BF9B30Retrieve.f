#*******************************************************************************
#*  Component:   BF9B30Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1542  CTS      Flow file for APL history Inquiry                         *
#*******************************************************************************

INCLUDE "BF0530-P.p";
INCLUDE "BF9B30-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9B30Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9B30Retrieve -> Title;
        "A" -> MIR-POL-LOAN-ID;
        "BF0530-P" -> RetrieveP;
        "BF9B30-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

