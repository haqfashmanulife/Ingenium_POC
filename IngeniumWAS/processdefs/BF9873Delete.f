# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9873Delete.f                                                *
#*  Description: Disease/Surgery Major Code Delete function                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9870-I.s";
INCLUDE "BF9870-P.p";
INCLUDE "BF9870-O.s";
INCLUDE "BF9873-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9873Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9873Delete -> Title;
        "BF9870-I" -> InputS;
        "BF9870-P" -> RetrieveP;
        "BF9870-O" -> ConfirmS;
        "BF9873-P" -> DeleteP;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

