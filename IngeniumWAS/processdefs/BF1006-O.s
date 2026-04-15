# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1006-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1006-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Cnrdtl";
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

    IN MIR-DV-CDN-TAX-ACB-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Total Adjusted Cost Basis Amount";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-TXEMP-PYR-QTY-T[6]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Year Exemption Test Last Performed";
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

    IN MIR-GAIN-RPT-TIME-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        SType = "Text";
        Label = "Gain Reporting Time";
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

    IN MIR-POL-TAX-TYP-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        SType = "Text";
        Label = "Policy Type";
        Index = "1";
    }

    IN MIR-POL-TXEMP-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-TXEMP-CD";
        SType = "Text";
        Label = "Policy Exempt Status";
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

    IN MIR-TAX-ANNV-ACB-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Anniversary Adjusted Cost Basis";
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

    IN MIR-TAX-RPT-FREQ-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "TAX-RPT-FREQ-CD";
        SType = "Text";
        Label = "Tax Reporting Frequency";
        Index = "1";
    }

}

