# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1467Rcncl.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS044  CTS      CANCELLATION REVERSAL SCREEN CHANGES                      *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1461-I.s";
INCLUDE "BF1461-O.s";
INCLUDE "BF1467-P.p";
INCLUDE "GenConfrmAud.f";


PROCESS BF1467Rcncl
{
    STEP Main
    {
        USES PROCESS "GenConfrmAud";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1467Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1467Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1467Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1467Phase3 -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1467-P" -> GetInitialHostDataP;
        "BF1461-I" -> DataInputS;
        "BF1467-P" -> PerformHostEditsP;
        "BF1461-O" -> ConfirmS;
        "BF1467-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

