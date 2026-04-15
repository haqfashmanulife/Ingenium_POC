# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0212Cnfwksht.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0212-I.s";
INCLUDE "BF0212-P.p";

PROCESS BF0212Cnfwksht
{
    Title = STRINGTABLE.IDS_TITLE_BF0212Cnfwksht;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF0212-I
    {
        USES S-STEP "BF0212-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0212-P
    {
        USES P-STEP "BF0212-P";
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[1];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[2];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[3];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[4];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[5];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[6];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[7];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[8];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[9];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[10];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[12];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[13];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[14];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[15];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[16];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[17];
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0212-I;


    STEP BF0212-I2
    {
        USES S-STEP "BF0212-I";
        " " -> MIR-CLI-ID;
        " " -> MIR-TRNXT-DOC-CPY-QTY;
        " " -> MIR-DOC-ID;
        " " -> MIR-TRNXT-LANG-CD;
        " " -> MIR-TRNXT-RPT-DSTRB-CD;
        " " -> MIR-UWG-WRKSHT-NUM;
    }

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH BF0212-P;
}

