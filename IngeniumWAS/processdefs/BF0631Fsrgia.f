# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0631Fsrgia.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0631Data-I.s";
INCLUDE "BF0631Change-I.s";
INCLUDE "BF0631-O.s";
INCLUDE "BF0631-P.p";
INCLUDE "GenConfrmChg.f";

PROCESS BF0631Fsrgia
{
    STEP Main
    {
        USES PROCESS "GenConfrmChg";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0631Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0631Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0631Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0631Phase3 -> Phase3Title;
        STRINGTABLE.IDS_TITLE_BF0631Change -> ChangeTitle;

        # Fsrgia starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0631Data-I" -> DataInputS;
        "BF0631-P" -> PerformHostEditsP;
        "BF0631-O" -> ConfirmS;
        "BF0631-P" -> UpdateHostP;
        "BF0631Change-I" -> ChangeS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

