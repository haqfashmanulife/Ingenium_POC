# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0223Expense.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0223-I.s";
INCLUDE "BF0223-O.s";
INCLUDE "BF0223-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0223Expense
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Setup default Account Description

        STRINGTABLE.IDS_TITLE_BF0220DisbursementDescription -> MIR-DV-ACCT-DESC-TXT-T[1];

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0223Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0223Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0223Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0223Phase3 -> Phase3Title;

        # DISB starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0223-P" -> GetInitialHostDataP;
        "BF0223-I" -> DataInputS;
        "BF0223-P" -> PerformHostEditsP;
        "BF0223-O" -> ConfirmS;
        "BF0223-P" -> UpdateHostP;
        "259900" -> MIR-ACCT-BASE-ID-T[1];
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

