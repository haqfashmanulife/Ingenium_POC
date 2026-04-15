# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1464Trepl.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1464-I.s";
INCLUDE "BF1464-O.s";
INCLUDE "BF1464-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1464Trepl
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1464Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1464Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1464Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1464Phase3 -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1464-P" -> GetInitialHostDataP;
        "BF1464-I" -> DataInputS;
        "BF1464-P" -> PerformHostEditsP;
        "BF1464-O" -> ConfirmS;
        "BF1464-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

