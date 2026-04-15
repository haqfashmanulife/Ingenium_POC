# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1012-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1012-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1012";
        BusinessFunctionName = "Client Inquiry - Registered Tax Detail";
        BusinessFunctionType = "Crgdtl";
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

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-SPOUS-CNTRB-1-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Spousal Total (J-F)";
        Index = "1";
    }

    OUT MIR-DV-SPOUS-CNTRB-2-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Spousal Total (M-D)";
        Index = "1";
    }

    OUT MIR-DV-SPOUS-RECPT-1-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Spousal Recpt (J-F)";
        Index = "1";
    }

    OUT MIR-DV-SPOUS-RECPT-2-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Spousal Recpt (M-D)";
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

    OUT MIR-REG-CNTRB-1-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Annuitant Total (J-F)";
        Index = "1";
    }

    OUT MIR-REG-CNTRB-2-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Annuitant Total (M-D)";
        Index = "1";
    }

    OUT MIR-REG-RECPT-1-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Annuitant Recpt (J-F)";
        Index = "1";
    }

    OUT MIR-REG-RECPT-2-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Annuitant Recpt (M-D)";
        Index = "1";
    }

    OUT MIR-REL-TYP-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        DBTableName = "TRL";
        SType = "Text";
        Label = "Relationship Type";
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

}

