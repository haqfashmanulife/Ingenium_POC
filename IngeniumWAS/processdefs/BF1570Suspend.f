# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1570Suspend.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1570Key-I.s";
INCLUDE "BF1570Data-I.s";
INCLUDE "BF1570-O.s";
INCLUDE "BF1570-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1570Suspend
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1570Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1570Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1570Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1570Phase3 -> Phase3Title;

        # Suspend starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1570Key-I" -> KeyFieldsS;
        "BF1570-P" -> GetInitialHostDataP;
        "BF1570Data-I" -> DataInputS;
        "BF1570-P" -> PerformHostEditsP;
        "BF1570-O" -> ConfirmS;
        "BF1570-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

