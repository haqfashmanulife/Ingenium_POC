# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1412Reject.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1412-I.s";
INCLUDE "BF1412-O.s";
INCLUDE "BF1412-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1412Reject
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1412Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1412Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1412Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1412Phase3 -> Phase3Title;

        # PEND starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1412-P" -> GetInitialHostDataP;
        "BF1412-I" -> DataInputS;
        "BF1412-P" -> PerformHostEditsP;
        "BF1412-O" -> ConfirmS;
        "BF1412-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

