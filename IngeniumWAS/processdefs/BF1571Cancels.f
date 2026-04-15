# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1571Cancels.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1571-I.s";
INCLUDE "BF1571-O.s";
INCLUDE "BF1571-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1571Cancels
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1571Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1571Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1571Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1571Phase3 -> Phase3Title;

        # REIS-C starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1571-P" -> GetInitialHostDataP;
        "BF1571-I" -> DataInputS;
        "BF1571-P" -> PerformHostEditsP;
        "BF1571-O" -> ConfirmS;
        "BF1571-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

