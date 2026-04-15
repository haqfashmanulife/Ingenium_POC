# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1783Varsurre.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1783Key-I.s";
INCLUDE "BF1783Data-I.s";
INCLUDE "BF1783-O.s";
INCLUDE "BF1783-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1783Varsurre
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1783Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1783Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1783Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1783Phase3 -> Phase3Title;

        # FADM starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1783Key-I" -> KeyFieldsS;
        "BF1783-P" -> GetInitialHostDataP;
        "BF1783Data-I" -> DataInputS;
        "BF1783-P" -> PerformHostEditsP;
        "BF1783-O" -> ConfirmS;
        "BF1783-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

