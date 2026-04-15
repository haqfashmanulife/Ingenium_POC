# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0462Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0462-I.s";
INCLUDE "BF0462-O.s";
INCLUDE "BF0462-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0462Reversal
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0462Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0462Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0462Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0462Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0462-P" -> GetInitialHostDataP;
        "BF0462-I" -> DataInputS;
        "BF0462-P" -> PerformHostEditsP;
        "BF0462-O" -> ConfirmS;
        "BF0462-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

