# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1458Tdeath.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1458-I.s";
INCLUDE "BF1458-O.s";
INCLUDE "BF1458-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1458Tdeath
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1458Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1458Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1458Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1458Phase3 -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1458-P" -> GetInitialHostDataP;
        "BF1458-I" -> DataInputS;
        "BF1458-P" -> PerformHostEditsP;
        "BF1458-O" -> ConfirmS;
        "BF1458-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

