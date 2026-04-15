# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0642Trxnrev.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0642-I.s";
INCLUDE "BF0642-O.s";
INCLUDE "BF0642-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0642Trxnrev
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0642Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0642Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0642Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0642Phase3 -> Phase3Title;

        # APRO starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0642-I" -> DataInputS;
        "BF0642-P" -> PerformHostEditsP;
        "BF0642-O" -> ConfirmS;
        "BF0642-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

