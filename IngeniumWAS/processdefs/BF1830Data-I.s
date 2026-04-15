# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF1830Data-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PF20    PF 2.0   Frame and Focus attributes removed for Pathfinder 2.0     *
#*                                                                             *
#*******************************************************************************

S-STEP BF1830Data-I
{
    ATTRIBUTES
    {
        Id = "BF1830Data-I";
        Type = "Input";
        FocusField = "MIR-FIA-FND-TRXN-AMT-T[1]";
        FocusFrame = "ContentFrame";
        DelEmptyRows;
    }

    IN TitleBar;

    IN TitleBarSize;

# PF20 - remove Frame and Focus attributes
    IN Title;

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

    IN MIR-DV-CFN-APROX-AMT-T[25]
    {
        FieldGroup = "TABLE25";
        Length = "15";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Signed;
        DisplayOnly;
        Index = "1";
    }

    IN MIR-FND-ID-T[25]
    {
        CodeSource = "EDIT";
        FieldGroup = "TABLE25";
        Length = "40";
        SType = "Text";
        Label = "Fund ID";
        CodeType = "SEGFD";
        DisplayOnly;
        Index = "1";
    }

    INOUT MIR-FIA-FND-TRXN-AMT-T[25]
    {
        FieldGroup = "TABLE25";
        Length = "15";
        SType = "Currency";
        Label = "Net Amount";
        Signed;
        Index = "1";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Activity Effective Date";
        DisplayOnly;
    }

    IN MIR-CVG-NUM
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
        DisplayOnly;
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
        DisplayOnly;
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
        DisplayOnly;
    }

    IN MIR-CIA-REASN-CD
    {
        CodeSource = "DataModel";
        Length = "3";
        SType = "Text";
        Label = "Surrender Reason";
        CodeType = "CIA-REASN-CD";
        DisplayOnly;
    }

    IN MIR-CIA-CLI-TRXN-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Total Admin Charge";
        Signed;
        DisplayOnly;
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
        DisplayOnly;
    }

# PF20 - remove Frame and Focus attributes
    IN OKButton;

}

