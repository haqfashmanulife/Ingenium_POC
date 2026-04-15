# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0222Disb.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

INCLUDE "BF0222-I.s";
INCLUDE "BF0222-O.s";
INCLUDE "BF0222-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0222Disb
{
#M245B2 CHANGES START HERE     
    MIR-PMT-CRCY-CD-T[1] = "JP";
    MIR-PMT-CRCY-CD-T[2] = "JP";
    MIR-PMT-CRCY-CD-T[3] = "JP";
    MIR-PMT-CRCY-CD-T[4] = "JP";
    MIR-PMT-CRCY-CD-T[5] = "JP";
    MIR-PMT-CRCY-CD-T[6] = "JP";
    MIR-PMT-CRCY-CD-T[7] = "JP";    
    
#M245B2 CHANGES END HERE   
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Setup default Account Description

        STRINGTABLE.IDS_TITLE_BF0220DisbursementDescription -> MIR-DV-ACCT-DESC-TXT-T[1];

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0222Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0222Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0222Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0222Phase3 -> Phase3Title;

        # DISB starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0222-P" -> GetInitialHostDataP;
        "BF0222-I" -> DataInputS;
        "BF0222-P" -> PerformHostEditsP;
        "BF0222-O" -> ConfirmS;
        "BF0222-P" -> UpdateHostP;
        "259950" -> MIR-ACCT-BASE-ID-T[1];
        "F" -> MIR-DV-TRNXT-PAYO-MTHD-CD;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

