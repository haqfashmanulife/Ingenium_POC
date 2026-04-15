# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1145Fsurrf.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code Cleanup - fixed Phase 3 Title                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1145Key-I.s";
INCLUDE "BF1145-I.s";
INCLUDE "BF1145-O.s";
INCLUDE "BF1145-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1145Fsurrf
{
    STEP Main
    {
        USES PROCESS "GenConfrm";
        STRINGTABLE.IDS_TITLE_BF1145Fsurrf -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1145Fsurrf -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1145Fsurrf -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1145Fsurrf -> Phase3Title;
        "BF1145Key-I" -> KeyFieldsS;
        "BF1145-I" -> DataInputS;
        "BF1145-O" -> ConfirmS;
        "BF1145-P" -> GetInitialHostDataP;
        "BF1145-P" -> PerformHostEditsP;
        "BF1145-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

