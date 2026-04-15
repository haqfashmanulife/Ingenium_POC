# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0650Change.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0650-I.s";
INCLUDE "BF0650-O.s";
INCLUDE "BF0650-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0650Change
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0650Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0650Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0650Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0650Phase3 -> Phase3Title;

        # KANC Change starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0650-P" -> GetInitialHostDataP;
        "BF0650-I" -> DataInputS;
        "BF0650-P" -> PerformHostEditsP;
        "BF0650-O" -> ConfirmS;
        "BF0650-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    IF DisplayInput == "FALSE"
        EXIT;

    ELSE
        BRANCH Main;

}

