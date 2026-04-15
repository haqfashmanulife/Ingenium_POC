# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1572Transfer.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1572-I.s";
INCLUDE "BF1572-O.s";
INCLUDE "BF1572-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1572Transfer
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1572Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1572Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1572Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1572Phase3 -> Phase3Title;

        # REIS-C starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1572-P" -> GetInitialHostDataP;
        "BF1572-I" -> DataInputS;
        "BF1572-P" -> PerformHostEditsP;
        "BF1572-O" -> ConfirmS;
        "BF1572-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

