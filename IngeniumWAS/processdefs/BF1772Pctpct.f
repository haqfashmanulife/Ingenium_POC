# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1772Pctpct.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1772Key-I.s";
INCLUDE "BF1772Data-I.s";
INCLUDE "BF1772-O.s";
INCLUDE "BF1772-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1772Pctpct
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1772Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1772Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1772Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1772Phase3 -> Phase3Title;

        # FTRS starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1772Key-I" -> KeyFieldsS;
        "BF1772-P" -> GetInitialHostDataP;
        "BF1772Data-I" -> DataInputS;
        "BF1772-P" -> PerformHostEditsP;
        "BF1772-O" -> ConfirmS;
        "BF1772-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

