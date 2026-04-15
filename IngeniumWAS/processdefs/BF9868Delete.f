# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9868Delete.f                                                *
#*  Description: BENM Discharge Multiplier Delete function                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9865-I.s";
INCLUDE "BF9865-P.p";
INCLUDE "BF9865-O.s";
INCLUDE "BF9868-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9868Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9868Delete -> Title;
        "BF9865-I" -> InputS;
        "BF9865-P" -> RetrieveP;
        "BF9865-O" -> ConfirmS;
        "BF9868-P" -> DeleteP;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

