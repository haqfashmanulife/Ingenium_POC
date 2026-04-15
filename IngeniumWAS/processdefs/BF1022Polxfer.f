# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1022Polxfer.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1022-I.s";
INCLUDE "BF1022-O.s";
INCLUDE "BF1022-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1022Polxfer
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1022Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1022Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1022Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1022Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1022-P" -> GetInitialHostDataP;
        "BF1022-I" -> DataInputS;
        "BF1022-P" -> PerformHostEditsP;
        "BF1022-O" -> ConfirmS;
        "BF1022-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

