# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1132-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1132-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1132";
        BusinessFunctionName = "Deposit History Summary";
        BusinessFunctionType = "Summaryd";
        MirName = "CCWM8120";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CDA-EFF-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Deposit Effective Date";
    }

    INOUT MIR-CDA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCDSA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-PAYO-NUM
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

    OUT MIR-CDA-DPOS-AVAIL-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Deposit Amount Remaining";
        Index = "1";
    }

    OUT MIR-CDA-EFF-IDT-NUM-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Deposit Effective Date";
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

    OUT MIR-CDA-STAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CDA-STAT-CD";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-CDA-TOT-TRXN-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Total Deposit";
        Index = "1";
    }

    OUT MIR-DPOS-OVRID-EFF-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Override Payment Effective Date";
        Index = "1";
    }

    OUT MIR-DV-DPOS-WTHDR-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount Removed";
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

