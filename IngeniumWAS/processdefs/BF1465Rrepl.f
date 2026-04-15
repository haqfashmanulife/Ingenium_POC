# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1465Rrepl.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1465-I.s";
INCLUDE "BF1465-O.s";
INCLUDE "BF1465-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1465Rrepl
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1465Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1465Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1465Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1465Phase3 -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1465-P" -> GetInitialHostDataP;
        "BF1465-I" -> DataInputS;
        "BF1465-P" -> PerformHostEditsP;
        "BF1465-O" -> ConfirmS;
        "BF1465-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

