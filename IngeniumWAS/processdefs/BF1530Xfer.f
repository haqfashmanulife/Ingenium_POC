# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1530Xfer.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1530Key-I.s";
INCLUDE "BF1530Data-I.s";
INCLUDE "BF1530-O.s";
INCLUDE "BF1530-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1530Xfer
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1530Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1530Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1530Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1530Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1530Key-I" -> KeyFieldsS;
        "BF1530-P" -> GetInitialHostDataP;
        "BF1530Data-I" -> DataInputS;
        "BF1530-P" -> PerformHostEditsP;
        "BF1530-O" -> ConfirmS;
        "BF1530-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

