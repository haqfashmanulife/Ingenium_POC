# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:26 PM EDT

#*******************************************************************************
#*  Component:   BF0633Change-I.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0633Change-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Psramt";
        Type = "Input";
        FocusField = "MIR-CF-SURR-CHRG-AMT-T[1]";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CF-FED-TAXWH-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    INOUT MIR-CF-FED-TAXWH-AMT-T[25]
    {
        Length = "13";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Federal Tax Withheld";
        Index = "1";
    }

    INOUT MIR-CF-PROV-TAXWH-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Provincial Tax Withheld";
    }

    INOUT MIR-CF-SURR-CHRG-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Surrender Charge";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[25]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table25";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-DV-REDC-FACE-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Override automatic face reduction";
    }

    INOUT MIR-DV-TAX-OVRID-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Tax Override";
    }

    INOUT MIR-DV-TAX-OVRID-IND-T[25]
    {
        Length = "1";
        FieldGroup = "Table25";
        SType = "Indicator";
        Label = "Tax Override";
        Index = "1";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-DV-CF-CLI-TRXN-AMT
    {
        Key;
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Gross Amount";
    }

    IN MIR-DV-CF-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Cashflow Effective Date";
    }

    IN MIR-DV-CF-REASN-CD
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Text";
        Label = "Transaction Reason";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CF-MKTVAL-ADJ-AMT-T[25]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Market Value Adjustment";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-CSV-AMT-T[25]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Cash Surrender Value";
        Index = "1";
    }

    IN MIR-CF-TOT-SURR-AMT-T[25]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Surrender Total";
        Index = "1";
    }

}

