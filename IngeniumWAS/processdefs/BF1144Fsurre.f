# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1144Fsurre.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1144-I.s";
INCLUDE "BF1144-O.s";
INCLUDE "BF1144-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1144Fsurre
{
    STEP Main
    {
        USES PROCESS "GenConfrm";
        STRINGTABLE.IDS_TITLE_BF1144Fsurre -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1144Fsurre -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1144Fsurre -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1144Fsurre -> Phase3Title;
        "NotApplicable" -> KeyFieldsS;
        "BF1144-I" -> DataInputS;
        "BF1144-O" -> ConfirmS;
        "BF1144-P" -> GetInitialHostDataP;
        "BF1144-P" -> PerformHostEditsP;
        "BF1144-P" -> UpdateHostP;
        "2" -> InitialState;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

