# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0641Change.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0641Key-I.s";
INCLUDE "BF0641Data-I.s";
INCLUDE "BF0641-O.s";
INCLUDE "BF0641-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0641Change
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0641Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0641Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0641Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0641Phase3 -> Phase3Title;

        # APRO starts with Phase 2.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF0641Key-I" -> KeyFieldsS;
        "BF0641-P" -> GetInitialHostDataP;
        "BF0641Data-I" -> DataInputS;
        "BF0641-P" -> PerformHostEditsP;
        "BF0641-O" -> ConfirmS;
        "BF0641-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

