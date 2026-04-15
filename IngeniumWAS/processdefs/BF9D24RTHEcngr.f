# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:     BF9D24RTHEcngr.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release   Description                                              *
#* MP302C   CTS       Reversal Survival Benefit                                *
#* R15582   CTS       AUDIT LOG RELATED CHANGES                                *
#* UY3071   CTS      INGENIUM HEALTH CONGRATULATORY BENEFIT                    *
#*******************************************************************************

INCLUDE "BF9D24-I.s";
INCLUDE "BF9D24-O.s";
INCLUDE "BF9D24-P.p";
INCLUDE "GenConfrmAud.f";

PROCESS BF9D24RTHEcngr
{
    STEP Main
    {
        USES PROCESS "GenConfrmAud";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF9D24Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF9D24Phase1  -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF9D24Phase2  -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF9D24Phase3  -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF9D24-P" -> GetInitialHostDataP;
        "BF9D24-I" -> DataInputS;
        "BF9D24-P" -> PerformHostEditsP;
        "BF9D24-O" -> ConfirmS;
        "BF9D24-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Main;
}

