# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1413OpenSetl.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02NB64  WBP      New                                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1410-I.s";
INCLUDE "BF1410-O.s";
INCLUDE "BF1413-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1413OpenSetl
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1413Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1413Process -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1413Process -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1413Process -> Phase3Title;

        # PEND starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1413-P" -> GetInitialHostDataP;
        "BF1410-I" -> DataInputS;
        "BF1413-P" -> PerformHostEditsP;
        "BF1410-O" -> ConfirmS;
        "BF1413-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

