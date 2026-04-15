# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A71Create.f                                                *
#*  Description: Death Claim Notes (FTXT) Create function                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *                                                                          
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A70-P.p";
INCLUDE "BF9A71-P.p";
INCLUDE "BF9A74-I.s";
INCLUDE "BF9A72-I.s";
INCLUDE "BF9A70-O.s";
INCLUDE "BF9A72-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9A71Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9A71Create -> Title;
        "BF9A74-I" -> InputS;
        "BF9A71-P" -> CreateP;
        "BF9A70-P" -> RetrieveP;
        "BF9A72-I" -> EditS;
        "BF9A72-P" -> UpdateP;
        "BF9A70-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

