# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9B00Retrieve.f                                              *
#*  Description: Death Claim Summary Sheet(for UL)                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCASS  CTS      Intial Version                                            *                                                                            
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9B00-P.p";
INCLUDE "BF9B00-I.s";
INCLUDE "BF9B00-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9B00Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9B00Retrieve -> Title;
        "BF9B00-I" -> InputS;
        "BF9B00-P" -> RetrieveP;
        "BF9B00-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

