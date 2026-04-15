# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1021Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1021-I.s";
INCLUDE "BF1021-O.s";
INCLUDE "BF1021-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1021Reversal
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1021Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1021Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1021Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1021Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1021-P" -> GetInitialHostDataP;
        "BF1021-I" -> DataInputS;
        "BF1021-P" -> PerformHostEditsP;
        "BF1021-O" -> ConfirmS;
        "BF1021-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

