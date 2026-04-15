# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:     BF9D14RTDsrvb.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release   Description                                              *
#* MP302C   CTS       Reversal Survival Benefit                                *
#* R15582   CTS       AUDIT LOG RELATED CHANGES                                *
#*******************************************************************************

INCLUDE "BF9D14-I.s";
INCLUDE "BF9D14-O.s";
INCLUDE "BF9D14-P.p";
#R15582 CHANGES BEGIN
#INCLUDE "GenConfrm.f";
INCLUDE "GenConfrmAud.f";
#R15582 CHANGES END

PROCESS BF9D14RTDsrvb
{
    STEP Main
    {
#R15582 CHANGES BEGIN    
        #USES PROCESS "GenConfrm";
        USES PROCESS "GenConfrmAud";
#R15582 CHANGES END

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF9D14Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF9D14Phase1  -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF9D14Phase2  -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF9D14Phase3  -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF9D14-P" -> GetInitialHostDataP;
        "BF9D14-I" -> DataInputS;
        "BF9D14-P" -> PerformHostEditsP;
        "BF9D14-O" -> ConfirmS;
        "BF9D14-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Main;
}

