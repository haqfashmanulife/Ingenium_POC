# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9253Delete.f                                                *
#*  Description: Master Claim Delete                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9250-P.p";
INCLUDE "BF9250-I.s";
INCLUDE "BF9250-O.s";
INCLUDE "BF9253-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9253Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9253Delete -> Title;
        "BF9250-I" -> InputS;
        "BF9250-P" -> RetrieveP;
        "BF9250-O" -> ConfirmS;
        "BF9253-P" -> DeleteP;
        "BF9250-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

