# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1146Fsurrg.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  6.1.1J   Code Cleanup - fixed Phase 3 title                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1145Key-I.s";
INCLUDE "BF1146-I.s";
INCLUDE "BF1146-O.s";
INCLUDE "BF1146-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1146Fsurrg
{
    STEP Main
    {
        USES PROCESS "GenConfrm";
        STRINGTABLE.IDS_TITLE_BF1146Fsurrg -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1146Fsurrg -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1146Fsurrg -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1146Fsurrg -> Phase3Title;
        "BF1145Key-I" -> KeyFieldsS;
        "BF1146-I" -> DataInputS;
        "BF1146-O" -> ConfirmS;
        "BF1146-P" -> GetInitialHostDataP;
        "BF1146-P" -> PerformHostEditsP;
        "BF1146-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

