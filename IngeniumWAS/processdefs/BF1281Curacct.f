# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1281Curacct.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

INCLUDE "BF1281-I.s";
INCLUDE "BF1281-O.s";
INCLUDE "BF1281-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1281Curacct
{
#M245B2 CHANGES START HERE     
    MIR-PMT-CRCY-CD = "JP";
#M245B2 CHANGES END HERE
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1281Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1281Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1281Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1281Phase3 -> Phase3Title;

        # GACC starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1281-P" -> GetInitialHostDataP;
        "BF1281-I" -> DataInputS;
        "BF1281-P" -> PerformHostEditsP;
        "BF1281-O" -> ConfirmS;
        "BF1281-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

