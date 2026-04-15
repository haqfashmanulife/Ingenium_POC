# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1441Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1441Key-I.s";
INCLUDE "BF1441Data-I.s";
INCLUDE "BF1441-O.s";
INCLUDE "BF1441-P.p";
#R15582 CHANGES BEGIN
#INCLUDE "GenConfrm.f";
INCLUDE "GenConfrmAud.f";
#R15582 CHANGES END

PROCESS BF1441Reversal
{
    STEP Main
    {
#R15582 CHANGES BEGIN    
    #USES PROCESS "GenConfrm";
        USES PROCESS "GenConfrmAud";
#R15582 CHANGES END        

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1441Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1441Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1441Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1441Phase3 -> Phase3Title;

        # Reversal starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1441Key-I" -> KeyFieldsS;
        "BF1441-P" -> GetInitialHostDataP;
        "BF1441Data-I" -> DataInputS;
        "BF1441-P" -> PerformHostEditsP;
        "BF1441-O" -> ConfirmS;
        "BF1441-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

