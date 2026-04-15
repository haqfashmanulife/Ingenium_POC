# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1143Fsurrd.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1140-I.s";
INCLUDE "BF1143-I.s";
INCLUDE "BF1140-O.s";
INCLUDE "BF1143-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1143Fsurrd
{
    STEP Main
    {
        USES PROCESS "GenConfrm";
        STRINGTABLE.IDS_TITLE_BF1143Fsurrd -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1143Fsurrd -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1143Fsurrd -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1143Fsurrd -> Phase3Title;
        "BF1140-I" -> KeyFieldsS;
        "BF1143-I" -> DataInputS;
        "BF1140-O" -> ConfirmS;
        "BF1143-P" -> GetInitialHostDataP;
        "BF1143-P" -> PerformHostEditsP;
        "BF1143-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

