# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1291Cshrevs.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1291-I.s";
INCLUDE "BF1291-O.s";
INCLUDE "BF1291-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1291Cshrevs
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1291Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1291Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1291Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1291Phase3 -> Phase3Title;

        # RCPT starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1291-P" -> GetInitialHostDataP;
        "BF1291-I" -> DataInputS;
        "BF1291-P" -> PerformHostEditsP;
        "BF1291-O" -> ConfirmS;
        "BF1291-P" -> UpdateHostP;
        "102100" -> MIR-DV-BNK-ACCT-BASE-ID-T[1];
        "106100" -> MIR-DV-BNK-ACCT-BASE-ID-T[2];
        "102900" -> MIR-DV-BNK-ACCT-BASE-ID-T[3];
        "102200" -> MIR-ACCT-BASE-ID-T[1];
        "102300" -> MIR-ACCT-BASE-ID-T[2];
        "102400" -> MIR-ACCT-BASE-ID-T[3];
        "762000" -> MIR-ACCT-BASE-ID-T[4];
        "762100" -> MIR-ACCT-BASE-ID-T[5];
        "162400" -> MIR-ACCT-BASE-ID-T[6];
        "762500" -> MIR-ACCT-BASE-ID-T[7];
        "171100" -> MIR-ACCT-BASE-ID-T[8];
        "241000" -> MIR-ACCT-BASE-ID-T[9];
        "241100" -> MIR-ACCT-BASE-ID-T[10];
        "241200" -> MIR-ACCT-BASE-ID-T[11];
        "BANK-CA" -> MIR-DV-BNK-ACCT-DESC-TXT-T[1];
        "BANK-US" -> MIR-DV-BNK-ACCT-DESC-TXT-T[2];
        "BANK-MP" -> MIR-DV-BNK-ACCT-DESC-TXT-T[3];
        "BANK-4" -> MIR-DV-BNK-ACCT-DESC-TXT-T[4];
        "SAL CASH CLEAR" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[1];
        "IMD CASH CLEAR" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[2];
        "SMD CASH CLEAR" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[3];
        "BOND INTEREST" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[4];
        "MORT INTEREST" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[5];
        "STOCKS" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[6];
        "DIVIDENDS" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[7];
        "DUE RE BROKERS" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[8];
        "SMD SUSPENSE" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[9];
        "APPL SUSP LIFE" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[10];
        "APPL SUSP A+R" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[11];
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

