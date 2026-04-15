# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1784Varsurrf.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1784Key-I.s";
INCLUDE "BF1784Data-I.s";
INCLUDE "BF1784-O.s";
INCLUDE "BF1784-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1784Varsurrf
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1784Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1784Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1784Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1784Phase3 -> Phase3Title;

        # FADM starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1784Key-I" -> KeyFieldsS;
        "BF1784-P" -> GetInitialHostDataP;
        "BF1784Data-I" -> DataInputS;
        "BF1784-P" -> PerformHostEditsP;
        "BF1784-O" -> ConfirmS;
        "BF1784-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

