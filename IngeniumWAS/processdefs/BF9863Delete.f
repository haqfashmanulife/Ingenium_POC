# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9863Delete.f                                                *
#*  Description: Claim Requirements Table (CRTB) Delete function               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9860-P.p";
INCLUDE "BF9860-I.s";
INCLUDE "BF9860-O.s";
INCLUDE "BF9863-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9863Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9863Delete -> Title;
        "BF9860-I" -> InputS;
        "BF9860-P" -> RetrieveP;
        "BF9860-O" -> ConfirmS;
        "BF9863-P" -> DeleteP;
        "BF9860-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

