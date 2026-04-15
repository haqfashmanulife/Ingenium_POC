# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:24 PM EDT

#*******************************************************************************
#*  Component:   BF0633-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0633-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0633";
        BusinessFunctionName = "Annuity Surrender Partial Coverage";
        BusinessFunctionType = "Psrcvg";
        MirName = "CCWM0761";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CF-FED-TAXWH-AMT
    {
        Length = "13";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    INOUT MIR-CF-FED-TAXWH-AMT-T[25]
    {
        Length = "13";
        FieldGroup = "Table25";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Federal Tax Withheld";
        Index = "1";
    }

    INOUT MIR-CF-PROV-TAXWH-AMT
    {
        Length = "13";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Provincial Tax Withheld";
    }

    INOUT MIR-CF-SURR-CHRG-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Surrender Charge";
        Index = "1";
    }

    INOUT MIR-CF-TOT-SURR-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Surrender Total";
        Index = "1";
    }

    INOUT MIR-CVG-NUM-T[25]
    {
        Length = "2";
        FieldGroup = "Table25";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-DV-REDC-FACE-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Override automatic face reduction";
    }

    INOUT MIR-DV-TAX-OVRID-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Tax Override";
    }

    INOUT MIR-DV-TAX-OVRID-IND-T[25]
    {
        Length = "1";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Tax Override";
        Index = "1";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-DV-CF-CLI-TRXN-AMT
    {
        Key;
        Mandatory;
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Gross Amount";
    }

    IN MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCFLW";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Cashflow Effective Date";
    }

    IN MIR-DV-CF-REASN-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        DBTableName = "TCFLW";
        SType = "Selection";
        Label = "Transaction Reason";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CF-MKTVAL-ADJ-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Market Value Adjustment";
        Index = "1";
    }

    OUT MIR-DV-DISPLAY-CD-T[25]
    {
        Length = "3";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "DV-DISPLAY-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Processing Results";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-CSV-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Surrender Value";
        Index = "1";
    }

}

