# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1457Rcnvr.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1457-I.s";
INCLUDE "BF1457-O.s";
INCLUDE "BF1457-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1457Rcnvr
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1457Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1457Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1457Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1457Phase3 -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1457-P" -> GetInitialHostDataP;
        "BF1457-I" -> DataInputS;
        "BF1457-P" -> PerformHostEditsP;
        "BF1457-O" -> ConfirmS;
        "BF1457-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

