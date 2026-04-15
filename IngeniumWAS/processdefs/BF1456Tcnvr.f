# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1456Tcnvr.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1456-I.s";
INCLUDE "BF1456-O.s";
INCLUDE "BF1456-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1456Tcnvr
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1456Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1456Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1456Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1456Phase3 -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1456-P" -> GetInitialHostDataP;
        "BF1456-I" -> DataInputS;
        "BF1456-P" -> PerformHostEditsP;
        "BF1456-O" -> ConfirmS;
        "BF1456-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

