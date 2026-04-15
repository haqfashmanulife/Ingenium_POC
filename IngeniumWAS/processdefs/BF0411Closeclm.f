# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0411Closeclm.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0411-I.s";
INCLUDE "BF0411-O.s";
INCLUDE "BF0411-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0411Closeclm
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0411Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0411Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0411Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0411Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0411-P" -> GetInitialHostDataP;
        "BF0411-I" -> DataInputS;
        "BF0411-P" -> PerformHostEditsP;
        "BF0411-O" -> ConfirmS;
        "BF0411-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK" || DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

