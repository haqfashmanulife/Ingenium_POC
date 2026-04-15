# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1369Revrsrpu.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1369-I.s";
INCLUDE "BF1369-O.s";
INCLUDE "BF1369-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1369Revrsrpu
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1369Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1369Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1369Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1369Phase3 -> Phase3Title;

        # SERV starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1369-P" -> GetInitialHostDataP;
        "BF1369-I" -> DataInputS;
        "BF1369-P" -> PerformHostEditsP;
        "BF1369-O" -> ConfirmS;
        "BF1369-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

