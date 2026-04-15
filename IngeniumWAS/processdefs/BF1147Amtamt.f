# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1147Amtamt.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  6.1.1J   Code Cleanup - fixed Phase 3 title                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1147Key-I.s";
INCLUDE "BF1147-I.s";
INCLUDE "BF1147-O.s";
INCLUDE "BF1147-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1147Amtamt
{
    STEP Main
    {
        USES PROCESS "GenConfrm";
        STRINGTABLE.IDS_TITLE_BF1147Amtamt -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1147Amtamt -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1147Amtamt -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1147Amtamt -> Phase3Title;
        "BF1147Key-I" -> KeyFieldsS;
        "BF1147-I" -> DataInputS;
        "BF1147-O" -> ConfirmS;
        "BF1147-P" -> GetInitialHostDataP;
        "BF1147-P" -> PerformHostEditsP;
        "BF1147-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

