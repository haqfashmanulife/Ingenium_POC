# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1130-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1130-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1130";
        BusinessFunctionName = "Deposit History Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM8120";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CDA-EFF-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Withdrawal Effective Date";
    }

    IN MIR-CDA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCDSA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Withdrawal Sequence Number";
    }

    IN MIR-DPOS-CDA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCDSA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DPOS-EFF-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Deposit Effective Date";
    }

    IN MIR-DPOS-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TCDSA";
        DefaultConstant = "99999";
        SType = "Text";
        Label = "Payout Number";
    }

    IN MIR-DWCHRG-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TDWCD";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sub-Sequence";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TCDSA";
        DefaultConstant = "99999";
        SType = "Text";
        Label = "Withdrawal Payout Number";
    }

    OUT MIR-DPOS-OVRID-EFF-DT
    {
        Length = "10";
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    OUT MIR-DV-DWCHRG-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "Derived";
        SType = "Percent";
        Label = "Surrender Charge Percent";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DWCHRG-AVAIL-AMT
    {
        Length = "15";
        DBTableName = "TDWCD";
        SType = "Currency";
        Label = "Amount Available for Withdrawal";
    }

    OUT MIR-DWCHRG-CHRG-AMT
    {
        Length = "15";
        DBTableName = "TDWCD";
        SType = "Currency";
        Label = "Calculated Surrender Charge";
    }

    OUT MIR-DWCHRG-FREE-AMT
    {
        Length = "15";
        DBTableName = "TDWCD";
        SType = "Currency";
        Label = "Free Amount Applied";
    }

    OUT MIR-DWCHRG-WTHDR-AMT
    {
        Length = "15";
        DBTableName = "TDWCD";
        SType = "Currency";
        Label = "Total Withdrawal Amount";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

}

