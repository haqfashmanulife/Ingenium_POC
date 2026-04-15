# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1141Fsurrb.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1140-I.s";
INCLUDE "BF1140-O.s";
INCLUDE "BF1141-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1141Fsurrb
{
    STEP Main
    {
        USES PROCESS "GenConfrm";
        STRINGTABLE.IDS_TITLE_BF1141Fsurrb -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1141Fsurrb -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1141Fsurrb -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1141Fsurrb -> Phase3Title;
        "NotApplicable" -> KeyFieldsS;
        "BF1140-I" -> DataInputS;
        "BF1140-O" -> ConfirmS;
        "BF1141-P" -> GetInitialHostDataP;
        "BF1141-P" -> PerformHostEditsP;
        "BF1141-P" -> UpdateHostP;
        "2" -> InitialState;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

