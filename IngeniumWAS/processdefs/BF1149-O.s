# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:35 PM EDT

#*******************************************************************************
#*  Component:   BF1149-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1149-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Pctpct";
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

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPRES-CNFRM-IND";
        SType = "Text";
        Label = "Confirmation";
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

    IN MIR-DV-CFN-APROX-AMT-T[139]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    IN MIR-DV-FROM-FND-AMT-T[139]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "From amount";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-FND-DESC-TXT-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        KeyColumn;
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }

    IN MIR-DV-TO-FND-AMT-T[139]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "To amount";
        Index = "1";
    }

    IN MIR-FIA-IN-ALLOC-PCT-T[139]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table139";
        SType = "Percent";
        Label = "Percentage out";
        Index = "1";
    }

    IN MIR-FIA-OUT-ALLOC-PCT-T[139]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table139";
        SType = "Percent";
        Label = "Fund out";
        Index = "1";
    }

}

