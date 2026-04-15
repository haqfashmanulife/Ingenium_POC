# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0233Cancel.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0233-I.s";
INCLUDE "BF0233-O.s";
INCLUDE "BF0233-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0233Cancel
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0233Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0233Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0233Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0233Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0233-P" -> GetInitialHostDataP;
        "BF0233-I" -> DataInputS;
        "BF0233-P" -> PerformHostEditsP;
        "BF0233-O" -> ConfirmS;
        "BF0233-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

