# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A73Delete.f                                                *
#*  Description: Death Claim Notes (FTXT) Delete function                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *                                                                            
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A70-P.p";
INCLUDE "BF9A70-I.s";
INCLUDE "BF9A70-O.s";
INCLUDE "BF9A73-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9A73Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9A73Delete -> Title;
        "BF9A70-I" -> InputS;
        "BF9A70-P" -> RetrieveP;
        "BF9A70-O" -> ConfirmS;
        "BF9A73-P" -> DeleteP;
        "BF9A70-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

