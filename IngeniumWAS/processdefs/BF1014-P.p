# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1014-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1014-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1014";
        BusinessFunctionName = "Client Inquiry - US Tax Detail";
        BusinessFunctionType = "Ustdtl";
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

    OUT MIR-DV-CLI-INT-YTD-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "MIR-DV-CLI-INT-YTD-AMT-T";
        Index = "1";
    }

    OUT MIR-DV-DSTRB-YTD-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "MIR-DV-DSTRB-YTD-AMT-T";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-CRNT-YR-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Contributions This Year";
        Index = "1";
    }

    OUT MIR-DV-POL-PREV-YR-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Contributions Last Year";
        Index = "1";
    }

    OUT MIR-DV-TAXBL-DSTRB-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Dispositions Taxed";
        Index = "1";
    }

    OUT MIR-DV-US-TAXWH-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "MIR-DV-US-TAXWH-AMT-T";
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

    OUT MIR-POL-PNSN-QUALF-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Pension Qualified Indicator";
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

}

