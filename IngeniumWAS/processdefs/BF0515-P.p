# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0515-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  017673  612J     Change Amount/Percent decimals to 2                       *
#*                                                                             *
#*******************************************************************************

P-STEP BF0515-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0515";
        BusinessFunctionName = "Monthiversary Fund Selection Copy";
        BusinessFunctionType = "Copy";
        MirName = "CCWM0665";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-MTHV-FND-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TMFSD";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        Decimals = "0";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TMFSD";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-MTHV-FND-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MTHV-FND-STAT-CD";
        DBTableName = "TMFSL";
        SType = "Text";
        Label = "Selection Status";
    }

    INOUT MIR-MTHV-FND-WTHDR-AMT-T[20]
    {
        Length = "17";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "TMFSD";
        SType = "Number";
        Label = "Withdrawal Amount/Percent";
        Index = "1";
    }

    INOUT MIR-MTHV-FND-WTHDR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "MTHV-FND-WTHDR-CD";
        DBTableName = "TMFSD";
        SType = "Text";
        Label = "Withdrawal Method";
        Index = "1";
    }

    INOUT MIR-MTHV-FND-WTHDR-NUM-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TMFSD";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

}

