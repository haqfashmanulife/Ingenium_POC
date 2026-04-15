# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0592Select.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  02NB64  WBP      Allow bypass of Input Screen (DisplayInput)               *
#*  P00583  WBP      Save Name and Sex for redisplay on an Error.              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0590-I.s";
INCLUDE "BF0590-P.p";
INCLUDE "BF0592-I.s";
INCLUDE "BF0592-O.s";
INCLUDE "BF0592-P.p";

PROCESS BF0592Select
{
    Title = STRINGTABLE.IDS_TITLE_BF0592Select;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH BF0590-P;


    STEP BF0590-I
    {
        USES S-STEP "BF0590-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0590-P
    {
        USES P-STEP "BF0590-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0590-I;


    STEP BF0592-I
    {
        USES S-STEP "BF0592-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    Save-Cli-Sex-Cd[1] = MIR-CLI-SEX-CD-T[1];
    Save-Cli-Sex-Cd[2] = MIR-CLI-SEX-CD-T[2];
    Save-Cli-Sex-Cd[3] = MIR-CLI-SEX-CD-T[3];
    Save-Cli-Sex-Cd[4] = MIR-CLI-SEX-CD-T[4];
    Save-Cli-Sex-Cd[5] = MIR-CLI-SEX-CD-T[5];
    Save-Cli-Sex-Cd[6] = MIR-CLI-SEX-CD-T[6];
    Save-Cli-Sex-Cd[7] = MIR-CLI-SEX-CD-T[7];
    Save-Cli-Sex-Cd[8] = MIR-CLI-SEX-CD-T[8];
    Save-Cli-Sex-Cd[9] = MIR-CLI-SEX-CD-T[9];
    Save-Cli-Sex-Cd[10] = MIR-CLI-SEX-CD-T[10];
    Save-Cli-Sex-Cd[11] = MIR-CLI-SEX-CD-T[11];
    Save-Insrd-Cli-Nm[1] = MIR-DV-INSRD-CLI-NM-T[1];
    Save-Insrd-Cli-Nm[2] = MIR-DV-INSRD-CLI-NM-T[2];
    Save-Insrd-Cli-Nm[3] = MIR-DV-INSRD-CLI-NM-T[3];
    Save-Insrd-Cli-Nm[4] = MIR-DV-INSRD-CLI-NM-T[4];
    Save-Insrd-Cli-Nm[5] = MIR-DV-INSRD-CLI-NM-T[5];
    Save-Insrd-Cli-Nm[6] = MIR-DV-INSRD-CLI-NM-T[6];
    Save-Insrd-Cli-Nm[7] = MIR-DV-INSRD-CLI-NM-T[7];
    Save-Insrd-Cli-Nm[8] = MIR-DV-INSRD-CLI-NM-T[8];
    Save-Insrd-Cli-Nm[9] = MIR-DV-INSRD-CLI-NM-T[9];
    Save-Insrd-Cli-Nm[10] = MIR-DV-INSRD-CLI-NM-T[10];
    Save-Insrd-Cli-Nm[11] = MIR-DV-INSRD-CLI-NM-T[11];

    STEP BF0592-P
    {
        USES P-STEP "BF0592-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        MIR-CLI-SEX-CD-T[1] = Save-Cli-Sex-Cd[1];
        MIR-CLI-SEX-CD-T[2] = Save-Cli-Sex-Cd[2];
        MIR-CLI-SEX-CD-T[3] = Save-Cli-Sex-Cd[3];
        MIR-CLI-SEX-CD-T[4] = Save-Cli-Sex-Cd[4];
        MIR-CLI-SEX-CD-T[5] = Save-Cli-Sex-Cd[5];
        MIR-CLI-SEX-CD-T[6] = Save-Cli-Sex-Cd[6];
        MIR-CLI-SEX-CD-T[7] = Save-Cli-Sex-Cd[7];
        MIR-CLI-SEX-CD-T[8] = Save-Cli-Sex-Cd[8];
        MIR-CLI-SEX-CD-T[9] = Save-Cli-Sex-Cd[9];
        MIR-CLI-SEX-CD-T[10] = Save-Cli-Sex-Cd[10];
        MIR-CLI-SEX-CD-T[11] = Save-Cli-Sex-Cd[11];
        MIR-DV-INSRD-CLI-NM-T[1] = Save-Insrd-Cli-Nm[1];
        MIR-DV-INSRD-CLI-NM-T[2] = Save-Insrd-Cli-Nm[2];
        MIR-DV-INSRD-CLI-NM-T[3] = Save-Insrd-Cli-Nm[3];
        MIR-DV-INSRD-CLI-NM-T[4] = Save-Insrd-Cli-Nm[4];
        MIR-DV-INSRD-CLI-NM-T[5] = Save-Insrd-Cli-Nm[5];
        MIR-DV-INSRD-CLI-NM-T[6] = Save-Insrd-Cli-Nm[6];
        MIR-DV-INSRD-CLI-NM-T[7] = Save-Insrd-Cli-Nm[7];
        MIR-DV-INSRD-CLI-NM-T[8] = Save-Insrd-Cli-Nm[8];
        MIR-DV-INSRD-CLI-NM-T[9] = Save-Insrd-Cli-Nm[9];
        MIR-DV-INSRD-CLI-NM-T[10] = Save-Insrd-Cli-Nm[10];
        MIR-DV-INSRD-CLI-NM-T[11] = Save-Insrd-Cli-Nm[11];

        BRANCH BF0592-I;

    }

    ButtonBar = "ButtonBarOK";

    STEP BF0592-O
    {
        USES S-STEP "BF0592-O";
    }

}

