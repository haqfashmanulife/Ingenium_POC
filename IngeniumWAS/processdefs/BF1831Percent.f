# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1831Percent.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1831Key-I.s";
INCLUDE "BF1831Data-I.s";
INCLUDE "BF1831-O.s";
INCLUDE "BF1831-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1831Percent
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1831Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1831Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1831Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1831Phase3 -> Phase3Title;

        # FADM starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1831Key-I" -> KeyFieldsS;
        "BF1831-P" -> GetInitialHostDataP;
        "BF1831Data-I" -> DataInputS;
        "BF1831-P" -> PerformHostEditsP;
        "BF1831-O" -> ConfirmS;
        "BF1831-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

