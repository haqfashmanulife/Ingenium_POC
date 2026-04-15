# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1020Clipymt.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1020-I.s";
INCLUDE "BF1020-O.s";
INCLUDE "BF1020-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1020Clipymt
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1020Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1020Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1020Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1020Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1020-P" -> GetInitialHostDataP;
        "BF1020-I" -> DataInputS;
        "BF1020-P" -> PerformHostEditsP;
        "BF1020-O" -> ConfirmS;
        "BF1020-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

