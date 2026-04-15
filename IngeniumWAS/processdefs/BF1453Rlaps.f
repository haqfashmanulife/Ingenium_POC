# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1453Rlaps.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1453-I.s";
INCLUDE "BF1453-O.s";
INCLUDE "BF1453-P.p";
#R15582 CHANGES BEGIN
#INCLUDE "GenConfrm.f";
INCLUDE "GenConfrmAud.f";
#R15582 CHANGES END

PROCESS BF1453Rlaps
{
    STEP Main
    {
#R15582 CHANGES BEGIN    
        #USES PROCESS "GenConfrm";
        USES PROCESS "GenConfrmAud";
#R15582 CHANGES END
        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1453Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1453Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1453Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1453Phase3 -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1453-P" -> GetInitialHostDataP;
        "BF1453-I" -> DataInputS;
        "BF1453-P" -> PerformHostEditsP;
        "BF1453-O" -> ConfirmS;
        "BF1453-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

