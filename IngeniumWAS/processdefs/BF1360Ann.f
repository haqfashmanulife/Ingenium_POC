# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1360Ann.f                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1360-I.s";
INCLUDE "BF1360-O.s";
INCLUDE "BF1360-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1360Ann
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1360Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1360Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1360Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1360Phase3 -> Phase3Title;

        # SERV-ANN starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1360-P" -> GetInitialHostDataP;
        "BF1360-I" -> DataInputS;
        "BF1360-P" -> PerformHostEditsP;
        "BF1360-O" -> ConfirmS;
        "BF1360-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

