# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0932-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0932-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0932";
        BusinessFunctionName = "Annuity Destination Details Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM4250";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CDAD-ROLOVR-INT-RT-T[10]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table10";
        DBTableName = "TCDSD";
        SType = "Percent";
        Label = "Guaranteed Rollover Rate";
        Index = "1";
    }

    INOUT MIR-CDAD-TRXN-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TCDSD";
        SType = "Currency";
        Label = "Transferred Amount";
        Index = "1";
    }

    INOUT MIR-DEST-CVG-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    INOUT MIR-DPOS-TRM-DY-DUR-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    INOUT MIR-DPOS-TRM-MO-DUR-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Deposit Term - Months";
        Index = "1";
    }

    IN MIR-CDA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSD";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DEST-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DEST-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCDSD";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-DEST-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCDSD";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DEST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-CDA-ROLOVR-LTR-AMT
    {
        Length = "11";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Deposit Amount";
    }

    OUT MIR-CDA-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CDA-STAT-CD";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-CDA-TOT-TRXN-AMT
    {
        Length = "15";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Total Payout Amount";
    }

    OUT MIR-SRC-CF-EFF-DT
    {
        Length = "10";
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Source Deposit Date";
    }

    OUT MIR-SRC-CF-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Source Sequence Number";
    }

}

