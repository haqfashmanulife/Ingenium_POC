# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1801Percent.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1801Key-I.s";
INCLUDE "BF1801Data-I.s";
INCLUDE "BF1801-O.s";
INCLUDE "BF1801-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1801Percent
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1801Percent -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1801Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1801Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1801Phase3 -> Phase3Title;

        # FPay starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1801Key-I" -> KeyFieldsS;
        "BF1801-P" -> GetInitialHostDataP;
        "BF1801Data-I" -> DataInputS;
        "BF1801-P" -> PerformHostEditsP;
        "BF1801-O" -> ConfirmS;
        "BF1801-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

