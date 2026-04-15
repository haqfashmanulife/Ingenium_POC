# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0221Claim.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0221-I.s";
INCLUDE "BF0221-O.s";
INCLUDE "BF0221-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0221Claim
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Setup default Account Description

        STRINGTABLE.IDS_TITLE_BF0220DisbursementDescription -> MIR-DV-ACCT-DESC-TXT-T[1];

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0221Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0221Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0221Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0221Phase3 -> Phase3Title;

        # DISB starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0221-P" -> GetInitialHostDataP;
        "BF0221-I" -> DataInputS;
        "BF0221-P" -> PerformHostEditsP;
        "BF0221-O" -> ConfirmS;
        "BF0221-P" -> UpdateHostP;
        "259900" -> MIR-ACCT-BASE-ID-T[1];
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

