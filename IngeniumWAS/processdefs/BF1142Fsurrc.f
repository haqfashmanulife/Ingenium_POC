# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1142Fsurrc.f                                                *
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
INCLUDE "BF1142-I.s";
INCLUDE "BF1140-O.s";
INCLUDE "BF1142-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1142Fsurrc
{
#M245B2 CHANGES START HERE     
    MIR-POL-CRCY-CD = "JP";
#M245B2 CHANGES END HERE   
    STEP Main
    {
        USES PROCESS "GenConfrm";
        STRINGTABLE.IDS_TITLE_BF1142Fsurrc -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1142Fsurrc -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1142Fsurrc -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1142Fsurrc -> Phase3Title;
        "BF1140-I" -> KeyFieldsS;
        "BF1142-I" -> DataInputS;
        "BF1140-O" -> ConfirmS;
        "BF1142-P" -> GetInitialHostDataP;
        "BF1142-P" -> PerformHostEditsP;
        "BF1142-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

