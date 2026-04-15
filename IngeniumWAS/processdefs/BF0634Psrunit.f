# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0634Psrunit.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0634Data-I.s";
INCLUDE "BF0634Key-I.s";
INCLUDE "BF0634Change-I.s";
INCLUDE "BF0634-O.s";
INCLUDE "BF0634-P.p";
INCLUDE "GenConfrmChg.f";

PROCESS BF0634Psrunit
{
    STEP Main
    {
        USES PROCESS "GenConfrmChg";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0634Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0634Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0634Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0634Phase3 -> Phase3Title;
        STRINGTABLE.IDS_TITLE_BF0634Change -> ChangeTitle;

        # Psrunit starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF0634Key-I" -> KeyFieldsS;
        "BF0634-P" -> GetInitialHostDataP;
        "BF0634Data-I" -> DataInputS;
        "BF0634-P" -> PerformHostEditsP;
        "BF0634-O" -> ConfirmS;
        "BF0634-P" -> UpdateHostP;
        "BF0634Change-I" -> ChangeS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

