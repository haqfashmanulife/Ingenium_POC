# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0741-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0741-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0741";
        BusinessFunctionName = "Policy Tax Exemption Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0901";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-TXEMP-TST-ANNV-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TEX";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Exemption Test Date";
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
        Length = "1";
        DBTableName = "TEX";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CVG-SUM-INS-AMT-T[12]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    OUT MIR-DV-FND-PUA-AMT-T[12]
    {
        Length = "17";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Paid-up Additions Amount (Accumulating Fund)";
        Index = "1";
    }

    OUT MIR-DV-FND-SUM-INS-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Sum Insured Amount (Accumulating Fund)";
        Index = "1";
    }

    OUT MIR-DV-MISC-HDG-TXT-T[12]
    {
        Length = "79";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Key Is";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-DUR-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policy Duration";
        Index = "1";
    }

    OUT MIR-PUA-LTD-FACE-AMT-T[12]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Paid-up Additions";
        Index = "1";
    }

}

