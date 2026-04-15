# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1800Amount.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1800Data-I.s";
INCLUDE "BF1800Key-I.s";
INCLUDE "BF1800-O.s";
INCLUDE "BF1800-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1800Amount
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1800Amount -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1800Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1800Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1800Phase3 -> Phase3Title;

        # FPay starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1800Key-I" -> KeyFieldsS;
        "BF1800-P" -> GetInitialHostDataP;
        "BF1800Data-I" -> DataInputS;
        "BF1800-P" -> PerformHostEditsP;
        "BF1800-O" -> ConfirmS;
        "BF1800-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

