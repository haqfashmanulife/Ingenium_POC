# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0410Openclm.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0410-I.s";
INCLUDE "BF0410-O.s";
INCLUDE "BF0410-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0410Openclm
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0410Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0410Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0410Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0410Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0410-P" -> GetInitialHostDataP;
        "BF0410-I" -> DataInputS;
        "BF0410-P" -> PerformHostEditsP;
        "BF0410-O" -> ConfirmS;
        "BF0410-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK" || DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

