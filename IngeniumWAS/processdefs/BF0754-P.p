# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0754-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0754-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0754";
        BusinessFunctionName = "Policy Tax Exemption Record List";
        BusinessFunctionType = "List";
        MirName = "CCWM0902";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TEX";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TEX";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TEX";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-TXEMP-TST-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TEX";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Coverage Sequence Number";
    }

    OUT MIR-CVG-NUM-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TEX";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-TXEMP-TST-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TEX";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    OUT MIR-TXEMP-TST-ANNV-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TEX";
        SType = "Date";
        Label = "Exemption Test Date";
        Index = "1";
    }

    OUT MIR-TXEMP-TST-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TEX";
        SType = "Text";
        Label = "Coverage Sequence Number";
        Index = "1";
    }

}

