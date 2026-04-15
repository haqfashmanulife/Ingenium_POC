# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9B97Aplint.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP166A  CTS      APL INTEREST CAPITALIZATION                               *
#*  R15582  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9B97-I.s";
INCLUDE "BF9B97-O.s";
INCLUDE "BF9B97-P.p";
#R15582 CHANGES BEGIN
#INCLUDE "GenConfrm.f";
INCLUDE "GenConfrmAud.f";
#R15582 CHANGES END

PROCESS BF9B97RevAplint
{
    STEP Main
    {
#R15582 CHANGES BEGIN    
        #USES PROCESS "GenConfrm";
        USES PROCESS "GenConfrmAud";
#R15582 CHANGES END

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF9B97Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF9B97Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF9B97Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF9B97Phase3 -> Phase3Title;        

        # SERV-APL starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF9B97-P" -> GetInitialHostDataP;
        "BF9B97-I" -> DataInputS;
        "BF9B97-P" -> PerformHostEditsP;
        "BF9B97-O" -> ConfirmS;
        "BF9B97-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

