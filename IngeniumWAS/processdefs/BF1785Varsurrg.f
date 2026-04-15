# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1785Varsurrg.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1785Key-I.s";
INCLUDE "BF1785Data-I.s";
INCLUDE "BF1785-O.s";
INCLUDE "BF1785-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1785Varsurrg
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1785Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1785Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1785Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1785Phase3 -> Phase3Title;

        # FADM starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1785Key-I" -> KeyFieldsS;
        "BF1785-P" -> GetInitialHostDataP;
        "BF1785Data-I" -> DataInputS;
        "BF1785-P" -> PerformHostEditsP;
        "BF1785-O" -> ConfirmS;
        "BF1785-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

