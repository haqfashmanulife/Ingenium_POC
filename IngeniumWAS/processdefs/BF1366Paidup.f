# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1366Paidup.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1366-I.s";
INCLUDE "BF1366-O.s";
INCLUDE "BF1366-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1366Paidup
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1366Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1366Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1366Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1366Phase3 -> Phase3Title;

        # SERV starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1366-P" -> GetInitialHostDataP;
        "BF1366-I" -> DataInputS;
        "BF1366-P" -> PerformHostEditsP;
        "BF1366-O" -> ConfirmS;
        "BF1366-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

