# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0412Reopenclm.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0412-I.s";
INCLUDE "BF0412-O.s";
INCLUDE "BF0412-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0412Reopenclm
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0412Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0412Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0412Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0412Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0412-P" -> GetInitialHostDataP;
        "BF0412-I" -> DataInputS;
        "BF0412-P" -> PerformHostEditsP;
        "BF0412-O" -> ConfirmS;
        "BF0412-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK" || DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

