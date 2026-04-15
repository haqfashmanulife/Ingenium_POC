# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0632Psrgia.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0632Data-I.s";
INCLUDE "BF0632Change-I.s";
INCLUDE "BF0632-O.s";
INCLUDE "BF0632-P.p";
INCLUDE "GenConfrmChg.f";

PROCESS BF0632Psrgia
{
    STEP Main
    {
        USES PROCESS "GenConfrmChg";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0632Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0632Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0632Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0632Phase3 -> Phase3Title;
        STRINGTABLE.IDS_TITLE_BF0632Change -> ChangeTitle;

        # Psrgia starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0632Data-I" -> DataInputS;
        "BF0632-P" -> PerformHostEditsP;
        "BF0632-O" -> ConfirmS;
        "BF0632-P" -> UpdateHostP;
        "BF0632Change-I" -> ChangeS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

