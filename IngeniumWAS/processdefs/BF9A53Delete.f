# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A53Delete.f                                                *
#*  Description: Death Master Claim Delete                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS       INITIAL VERSION                                          *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A50-P.p";
INCLUDE "BF9A50-I.s";
INCLUDE "BF9A50-O.s";
INCLUDE "BF9A53-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9A53Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9A53Delete -> Title;
        "BF9A50-I" -> InputS;
        "BF9A50-P" -> RetrieveP;
        "BF9A50-O" -> ConfirmS;
        "BF9A53-P" -> DeleteP;
        "BF9A50-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


   
}

