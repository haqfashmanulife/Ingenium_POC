# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1782Varsurrd.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1782Key-I.s";
INCLUDE "BF1782Data-I.s";
INCLUDE "BF1782-O.s";
INCLUDE "BF1782-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1782Varsurrd
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1782Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1782Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1782Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1782Phase3 -> Phase3Title;

        # FADM starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1782Key-I" -> KeyFieldsS;
        "BF1782-P" -> GetInitialHostDataP;
        "BF1782Data-I" -> DataInputS;
        "BF1782-P" -> PerformHostEditsP;
        "BF1782-O" -> ConfirmS;
        "BF1782-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

