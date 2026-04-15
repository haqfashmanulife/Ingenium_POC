# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:35 PM EDT

#*******************************************************************************
#*  Component:   BF1141-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1141-O
{
    ATTRIBUTES
    {
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

    IN MIR-CIA-SRC-DEST-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        SType = "Text";
        Label = "Destination of Surrender Amount";
    }

    IN MIR-CIA-TAXWH-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Bypass the tax withholding process";
    }

    IN MIR-DV-CIA-REASN-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-CIA-REASN-CD";
        SType = "Text";
        Label = "DV_CIA_REASN_CD";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
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

    IN MIR-CIA-LOAD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        Decimals = "0";
        SType = "Currency";
        Label = "Charges";
    }

    IN MIR-CVG-NUM-T[139]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-DV-CFN-APROX-AMT-T[139]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-FIA-OUT-ALLOC-PCT-T[139]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table30";
        SType = "Percent";
        Label = "Percentage Out";
        Index = "1";
    }

    IN MIR-FND-ID-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table30";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table30";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

}

