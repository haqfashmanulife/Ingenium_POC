# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1411Inforce.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  B00887  WBP      Default MIR-DV-PSTDT-ISS-CD to 'S'                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1411-I.s";
INCLUDE "BF1411-O.s";
INCLUDE "BF1411-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1411Inforce
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1411Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1411Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1411Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1411Phase3 -> Phase3Title;

        # PEND starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1411-P" -> GetInitialHostDataP;
        "BF1411-I" -> DataInputS;
        "BF1411-P" -> PerformHostEditsP;
        "BF1411-O" -> ConfirmS;
        "BF1411-P" -> UpdateHostP;
        "S" -> MIR-DV-PSTDT-ISS-CD;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

