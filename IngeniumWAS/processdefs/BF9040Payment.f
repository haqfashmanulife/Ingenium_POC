# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9040Payment.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

INCLUDE "BF9040-I.s";
INCLUDE "BF9040-O.s";
INCLUDE "BF9040-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF9040Payment
{
#M245B2 CHANGES START HERE     
    MIR-PMT-CRCY-CD = "JP";
#M245B2 CHANGES END HERE       
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF9040Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF9040Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF9040Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF9040Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF9040-P" -> GetInitialHostDataP;
        "BF9040-I" -> DataInputS;
        "BF9040-P" -> PerformHostEditsP;
        "BF9040-O" -> ConfirmS;
        "BF9040-P" -> UpdateHostP;
        # Q18239 changes starts here 
         "Y" -> MIR-CWA-PRCES-CHK-IND;
        # Q18239 changes ends here  
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

