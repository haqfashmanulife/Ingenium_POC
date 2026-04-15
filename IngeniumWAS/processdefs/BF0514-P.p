# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0514-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0514-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0514";
        BusinessFunctionName = "Monthiversary Fund Selection List";
        BusinessFunctionType = "List";
        MirName = "CCWM0665";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-MTHV-FND-EFF-DT
    {
        Key;
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

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-MTHV-FND-EFF-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TMFSD";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-MTHV-FND-STAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "MTHV-FND-STAT-CD";
        DBTableName = "TMFSL";
        SType = "Text";
        Label = "Selection Status";
        Index = "1";
    }

}

