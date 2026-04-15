# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1131-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1131-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1131";
        BusinessFunctionName = "Deposit History Detail";
        BusinessFunctionType = "Browsed";
        MirName = "CCWM8120";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CDA-EFF-IDT-NUM
    {
        Key;
        Length = "10";
        DBTableName = "TCDSA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Withdrawal Effective Date";
    }

    INOUT MIR-CDA-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TCDSA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Withdrawal Sequence Number";
    }

    INOUT MIR-DWCHRG-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TDWCD";
        SType = "Text";
        Label = "Sub-Sequence";
    }

    INOUT MIR-POL-PAYO-NUM
    {
        Key;
        Length = "5";
        DBTableName = "TCDSA";
        DefaultConstant = "99999";
        SType = "Text";
        Label = "Withdrawal Payout Number";
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
        Label = "Transaction Effective Date";
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

    OUT MIR-CDA-EFF-IDT-NUM-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Withdrawal Effective Date";
        Index = "1";
    }

    OUT MIR-CDA-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-DWCHRG-AVAIL-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TDWCD";
        SType = "Currency";
        Label = "Amount Available for Withdrawal";
        Index = "1";
    }

    OUT MIR-DWCHRG-CHRG-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TDWCD";
        SType = "Currency";
        Label = "Calculated Surrender Charge";
        Index = "1";
    }

    OUT MIR-DWCHRG-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TDWCD";
        SType = "Text";
        Label = "Sub-Sequence";
        Index = "1";
    }

    OUT MIR-DWCHRG-WTHDR-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TDWCD";
        SType = "Currency";
        Label = "Total Withdrawal Amount";
        Index = "1";
    }

    OUT MIR-POL-PAYO-NUM-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Payout Number";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

