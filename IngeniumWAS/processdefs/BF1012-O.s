# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1012-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1012-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Crgdtl";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-SPOUS-CNTRB-1-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Spousal Total (J-F)";
        Index = "1";
    }

    IN MIR-DV-SPOUS-CNTRB-2-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Spousal Total (M-D)";
        Index = "1";
    }

    IN MIR-DV-SPOUS-RECPT-1-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Spousal Recpt (J-F)";
        Index = "1";
    }

    IN MIR-DV-SPOUS-RECPT-2-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Spousal Recpt (M-D)";
        Index = "1";
    }

    IN MIR-FED-TAXWH-YTD-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Federal: Tax Withheld Year to Date";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[6]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-ISS-EFF-DT-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Policy Issue Date";
        Index = "1";
    }

    IN MIR-POL-SPND-IND-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    IN MIR-PROV-TAXWH-YTD-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Provincial: Tax Withheld Year to Date";
        Index = "1";
    }

    IN MIR-REG-CNTRB-1-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Annuitant Total (J-F)";
        Index = "1";
    }

    IN MIR-REG-CNTRB-2-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Annuitant Total (M-D)";
        Index = "1";
    }

    IN MIR-REG-RECPT-1-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Annuitant Recpt (J-F)";
        Index = "1";
    }

    IN MIR-REG-RECPT-2-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Annuitant Recpt (M-D)";
        Index = "1";
    }

    IN MIR-REL-TYP-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        SType = "Text";
        Label = "Relationship Type";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-TAX-GAIN-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Taxable Gain Amount";
        Index = "1";
    }

}

