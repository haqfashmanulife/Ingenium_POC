# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1830Amount.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1830Key-I.s";
INCLUDE "BF1830Data-I.s";
INCLUDE "BF1830-O.s";
INCLUDE "BF1830-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1830Amount
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1830Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1830Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1830Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1830Phase3 -> Phase3Title;

        # FADM starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1830Key-I" -> KeyFieldsS;
        "BF1830-P" -> GetInitialHostDataP;
        "BF1830Data-I" -> DataInputS;
        "BF1830-P" -> PerformHostEditsP;
        "BF1830-O" -> ConfirmS;
        "BF1830-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

