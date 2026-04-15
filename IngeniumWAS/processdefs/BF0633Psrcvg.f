# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0633Psrcvg.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0633Key-I.s";
INCLUDE "BF0633Data-I.s";
INCLUDE "BF0633Change-I.s";
INCLUDE "BF0633-O.s";
INCLUDE "BF0633-P.p";
INCLUDE "GenConfrmChg.f";

PROCESS BF0633Psrcvg
{
    STEP Main
    {
        USES PROCESS "GenConfrmChg";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0633Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0633Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0633Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0633Phase3 -> Phase3Title;
        STRINGTABLE.IDS_TITLE_BF0633Change -> ChangeTitle;

        # Psramt starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF0633Key-I" -> KeyFieldsS;
        "BF0633-P" -> GetInitialHostDataP;
        "BF0633Data-I" -> DataInputS;
        "BF0633-P" -> PerformHostEditsP;
        "BF0633-O" -> ConfirmS;
        "BF0633-P" -> UpdateHostP;
        "BF0633Change-I" -> ChangeS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

