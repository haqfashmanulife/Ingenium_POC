# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0934-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0934-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0934";
        BusinessFunctionName = "Annuity Destination Details List";
        BusinessFunctionType = "List";
        MirName = "CCWM4250";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CDA-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCDSD";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DEST-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DEST-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCDSD";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-DEST-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCDSD";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-DEST-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-CDA-EFF-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Payout Date";
        Index = "1";
    }

    OUT MIR-CDA-SEQ-NUM-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CDA-STAT-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "CDA-STAT-CD";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-SRC-CF-EFF-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Source Deposit Date";
        Index = "1";
    }

    OUT MIR-SRC-CF-SEQ-NUM-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Source Sequence Number";
        Index = "1";
    }

}

