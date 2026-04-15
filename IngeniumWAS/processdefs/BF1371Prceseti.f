# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1371Prceseti.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1370-I.s";
INCLUDE "BF1370-P.p";
INCLUDE "BF1371-I.s";
INCLUDE "BF1371-O.s";
INCLUDE "BF1371-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1371Prceseti
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1371Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1371Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1371Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1371Phase3 -> Phase3Title;

        # Prceseti starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1370-I" -> KeyFieldsS;
        "BF1370-P" -> GetInitialHostDataP;
        "BF1371-I" -> DataInputS;
        "BF1371-P" -> PerformHostEditsP;
        "BF1371-O" -> ConfirmS;
        "BF1371-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

