# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0621Payment.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0621Data-I.s";
INCLUDE "BF0621Change-I.s";
INCLUDE "BF0621-O.s";
INCLUDE "BF0621-P.p";
INCLUDE "GenConfrmChg.f";

PROCESS BF0621Payment
{
    STEP Main
    {
        USES PROCESS "GenConfrmChg";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0621Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0621Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0621Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0621Phase3 -> Phase3Title;
        STRINGTABLE.IDS_TITLE_BF0621Change -> ChangeTitle;

        # APAY starts with Phase 1.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0621Data-I" -> DataInputS;
        "BF0621-P" -> PerformHostEditsP;
        "BF0621-O" -> ConfirmS;
        "BF0621-P" -> UpdateHostP;
        "BF0621Change-I" -> ChangeS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

