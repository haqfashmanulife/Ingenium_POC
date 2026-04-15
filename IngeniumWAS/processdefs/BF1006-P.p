# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF1006-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1006-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1006";
        BusinessFunctionName = "Client Inquiry - Non Registered Details";
        BusinessFunctionType = "Cnrdtl";
        MirName = "CCWM5050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    OUT MIR-DV-CDN-TAX-ACB-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Adjusted Cost Basis Amount";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-TXEMP-PYR-QTY-T[6]
    {
        Length = "4";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Year Exemption Test Last Performed";
        Index = "1";
    }

    OUT MIR-FED-TAXWH-YTD-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Tax Withheld Year to Date";
        Index = "1";
    }

    OUT MIR-GAIN-RPT-TIME-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Gain Reporting Time";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[6]
    {
        Length = "9";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-ISS-EFF-DT-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
        Index = "1";
    }

    OUT MIR-POL-SPND-IND-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    OUT MIR-POL-TAX-TYP-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Type";
        Index = "1";
    }

    OUT MIR-POL-TXEMP-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-TXEMP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Exempt Status";
        Index = "1";
    }

    OUT MIR-PROV-TAXWH-YTD-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Provincial: Tax Withheld Year to Date";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    OUT MIR-TAX-ANNV-ACB-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Anniversary Adjusted Cost Basis";
        Index = "1";
    }

    OUT MIR-TAX-GAIN-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxable Gain Amount";
        Index = "1";
    }

    OUT MIR-TAX-RPT-FREQ-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "TAX-RPT-FREQ-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Tax Reporting Frequency";
        Index = "1";
    }

}

