# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0461Trnano.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0461-I.s";
INCLUDE "BF0461-O.s";
INCLUDE "BF0461-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0461Trnano
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0461Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0461Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0461Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0461Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0461-P" -> GetInitialHostDataP;
        "BF0461-I" -> DataInputS;
        "BF0461-P" -> PerformHostEditsP;
        "BF0461-O" -> ConfirmS;
        "BF0461-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

