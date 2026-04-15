# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1140Fsurra.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

INCLUDE "BF1140-I.s";
INCLUDE "BF1140-O.s";
INCLUDE "BF1140-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1140Fsurra
{
#M245B2 CHANGES START HERE     
    MIR-POL-CRCY-CD = "JP";
#M245B2 CHANGES END HERE   
    STEP Main
    {
        USES PROCESS "GenConfrm";
        STRINGTABLE.IDS_TITLE_BF1140Fsurra -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1140Fsurra -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1140Fsurra -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1140Fsurra -> Phase3Title;
        "NotApplicable" -> KeyFieldsS;
        "BF1140-I" -> DataInputS;
        "BF1140-O" -> ConfirmS;
        "BF1140-P" -> GetInitialHostDataP;
        "BF1140-P" -> PerformHostEditsP;
        "BF1140-P" -> UpdateHostP;
        "2" -> InitialState;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

