# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A43Delete.f                                                *
#*  Description: Death Benefit Support Table (DBEN) Delete function            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *                                                                           
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A40-P.p";
INCLUDE "BF9A40-I.s";
INCLUDE "BF9A40-O.s";
INCLUDE "BF9A43-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9A43Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9A43Delete -> Title;
        "BF9A40-I" -> InputS;
        "BF9A40-P" -> RetrieveP;
        "BF9A40-O" -> ConfirmS;
        "BF9A43-P" -> DeleteP;
        "BF9A40-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

