# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1790Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1790-I.s";
INCLUDE "BF1790-O.s";
INCLUDE "BF1790-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1790Reversal
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1790Reversal -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1790Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1790Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1790Phase3 -> Phase3Title;

        # FREV starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "not applicable" -> KeyFieldsS;
        "BF1790-P" -> GetInitialHostDataP;
        "BF1790-I" -> DataInputS;
        "BF1790-P" -> PerformHostEditsP;
        "BF1790-O" -> ConfirmS;
        "BF1790-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

