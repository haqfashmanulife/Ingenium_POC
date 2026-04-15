# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0752-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0752-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0752";
        BusinessFunctionName = "Policy Tax Exemption Record Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0902";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-TXEMP-TST-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TEX";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    INOUT MIR-TXEMP-TST-ANNV-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TEX";
        SType = "Date";
        Label = "Exemption Test Date";
        Index = "1";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TEX";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TEX";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Mandatory;
        Length = "1";
        DBTableName = "TEX";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-TXEMP-TST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TEX";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Coverage Sequence Number";
    }

}

