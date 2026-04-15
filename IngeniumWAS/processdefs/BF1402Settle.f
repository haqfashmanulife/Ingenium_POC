# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1402Settle.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1402-I.s";
INCLUDE "BF1402-O.s";
INCLUDE "BF1402-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1402Settle
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1402Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1402Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1402Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1402Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1402-P" -> GetInitialHostDataP;
        "BF1402-I" -> DataInputS;
        "BF1402-P" -> PerformHostEditsP;
        "BF1402-O" -> ConfirmS;
        "BF1402-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

