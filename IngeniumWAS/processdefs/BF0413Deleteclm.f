# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0413Deleteclm.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0413-I.s";
INCLUDE "BF0413-O.s";
INCLUDE "BF0413-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0413Deleteclm
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0413Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0413Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0413Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0413Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0413-P" -> GetInitialHostDataP;
        "BF0413-I" -> DataInputS;
        "BF0413-P" -> PerformHostEditsP;
        "BF0413-O" -> ConfirmS;
        "BF0413-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK" || DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

