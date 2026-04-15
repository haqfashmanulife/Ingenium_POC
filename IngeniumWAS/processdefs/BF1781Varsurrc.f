# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1781Varsurrc.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1781Key-I.s";
INCLUDE "BF1781Data-I.s";
INCLUDE "BF1781-O.s";
INCLUDE "BF1781-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1781Varsurrc
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1781Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1781Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1781Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1781Phase3 -> Phase3Title;

        # FADM starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1781Key-I" -> KeyFieldsS;
        "BF1781-P" -> GetInitialHostDataP;
        "BF1781Data-I" -> DataInputS;
        "BF1781-P" -> PerformHostEditsP;
        "BF1781-O" -> ConfirmS;
        "BF1781-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

