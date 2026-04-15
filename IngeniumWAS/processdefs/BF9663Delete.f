# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9663Delete.f                                                *
#*  Description: Benefit Support Table (BENS) Delete function                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HPR102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9660-P.p";
INCLUDE "BF9660-I.s";
INCLUDE "BF9660-O.s";
INCLUDE "BF9663-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9663Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9663Delete -> Title;
        "BF9660-I" -> InputS;
        "BF9660-P" -> RetrieveP;
        "BF9660-O" -> ConfirmS;
        "BF9663-P" -> DeleteP;
        "BF9660-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

