# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1292Misrcpt.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1292-I.s";
INCLUDE "BF1292-O.s";
INCLUDE "BF1292-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1292Misrcpt
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1292Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1292Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1292Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1292Phase3 -> Phase3Title;

        # MREC starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1292-P" -> GetInitialHostDataP;
        "BF1292-I" -> DataInputS;
        "BF1292-P" -> PerformHostEditsP;
        "BF1292-O" -> ConfirmS;
        "BF1292-P" -> UpdateHostP;
        "102100" -> MIR-DV-BNK-ACCT-BASE-ID-T[1];
        "106100" -> MIR-DV-BNK-ACCT-BASE-ID-T[2];
        "102900" -> MIR-DV-BNK-ACCT-BASE-ID-T[3];
        "BANK-CA" -> MIR-DV-BNK-ACCT-DESC-TXT-T[1];
        "BANK-US" -> MIR-DV-BNK-ACCT-DESC-TXT-T[2];
        "BANK-MP" -> MIR-DV-BNK-ACCT-DESC-TXT-T[3];
        "BANK-4" -> MIR-DV-BNK-ACCT-DESC-TXT-T[4];
        "ACCT 1" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[1];
        "ACCT 2" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[2];
        "ACCT 3" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[3];
        "ACCT 4" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[4];
        "ACCT 5" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[5];
        "ACCT 6" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[6];
        "ACCT 7" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[7];
        "ACCT 8" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[8];
        "ACCT 9" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[9];
        "ACCT 10" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[10];
        "ACCT 11" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[11];
        "ACCT 12" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[12];
        "ACCT 13" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[13];
        "ACCT 14" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[14];
        "ACCT 15" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[15];
        "ACCT 16" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[16];
        "ACCT 17" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[17];
        "ACCT 18" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[18];
        "ACCT 19" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[19];
        "ACCT 20" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[20];
        "ACCT 21" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[21];
        "ACCT 22" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[22];
        "ACCT 23" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[23];
        "ACCT 24" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[24];
        "ACCT 25" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[25];
        "ACCT 26" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[26];
        "ACCT 27" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[27];
        "ACCT 28" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[28];
        "ACCT 29" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[29];
        "ACCT 30" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[30];
        "ACCT 31" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[31];
        "ACCT 32" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[32];
        "ACCT 33" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[33];
        "ACCT 34" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[34];
        "ACCT 35" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[35];
        "ACCT 36" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[36];
        "ACCT 37" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[37];
        "ACCT 38" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[38];
        "ACCT 39" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[39];
        "ACCT 40" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[40];
        "ACCT 41" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[41];
        "ACCT 42" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[42];
        "ACCT 43" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[43];
        "ACCT 44" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[44];
        "ACCT 45" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[45];
        "ACCT 46" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[46];
        "ACCT 47" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[47];
        "ACCT 48" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[48];
        "ACCT 49" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[49];
        "ACCT 50" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[50];
        "ACCT 51" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[51];
        "ACCT 52" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[52];
        "ACCT 53" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[53];
        "ACCT 54" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[54];
        "ACCT 55" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[55];
        "ACCT 56" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[56];
        "ACCT 57" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[57];
        "ACCT 58" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[58];
        "ACCT 59" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[59];
        "ACCT 60" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[60];
        "ACCT 61" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[61];
        "ACCT 62" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[62];
        "ACCT 63" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[63];
        "ACCT 64" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[64];
        "ACCT 65" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[65];
        "ACCT 66" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[66];
        "ACCT 67" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[67];
        "ACCT 68" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[68];
        "ACCT 69" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[69];
        "ACCT 70" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[70];
        "ACCT 71" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[71];
        "ACCT 72" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[72];
        "ACCT 73" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[73];
        "ACCT 74" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[74];
        "ACCT 75" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[75];
        "ACCT 76" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[76];
        "ACCT 77" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[77];
        "ACCT 78" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[78];
        "ACCT 79" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[79];
        "ACCT 80" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[80];
        "ACCT 81" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[81];
        "ACCT 82" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[82];
        "ACCT 83" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[83];
        "ACCT 84" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[84];
        "ACCT 85" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[85];
        "ACCT 86" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[86];
        "ACCT 87" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[87];
        "ACCT 88" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[88];
        "ACCT 89" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[89];
        "ACCT 90" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[90];
        "ACCT 91" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[91];
        "ACCT 92" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[92];
        "ACCT 93" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[93];
        "ACCT 94" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[94];
        "ACCT 95" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[95];
        "ACCT 96" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[96];
        "ACCT 97" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[97];
        "ACCT 98" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[98];
        "ACCT 99" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[99];
        "ACCT 100" -> MIR-DV-SCRN-ACCT-DESC-TXT-T[100];
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

