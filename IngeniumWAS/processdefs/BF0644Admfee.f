# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0644Admfee.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0644Data-I.s";
INCLUDE "BF0644Change-I.s";
INCLUDE "BF0644-O.s";
INCLUDE "BF0644-P.p";
INCLUDE "GenConfrmChg.f";

PROCESS BF0644Admfee
{
    STEP Main
    {
        USES PROCESS "GenConfrmChg";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0644Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0644Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0644Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0644Phase3 -> Phase3Title;
        STRINGTABLE.IDS_TITLE_BF0644Change -> ChangeTitle;

        # Fsrgia starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0644Data-I" -> DataInputS;
        "BF0644-P" -> PerformHostEditsP;
        "BF0644-O" -> ConfirmS;
        "BF0644-P" -> UpdateHostP;
        "BF0644Change-I" -> ChangeS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

