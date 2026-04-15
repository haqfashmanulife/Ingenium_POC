# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1831Data-I.s                                                *
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

S-STEP BF1831Data-I
{
    ATTRIBUTES
    {
        Id = "BF1831Data-I";
        Type = "Input";
        FocusField = "MIR-DV-OUT-ALLOC-PCT-T[1]";
        FocusFrame = "ContentFrame";
        DelEmptyRows;
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

    IN MIR-DV-CFN-APROX-AMT-T[25]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    IN MIR-FND-ID-T[25]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table25";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    INOUT MIR-DV-OUT-ALLOC-PCT-T[25]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Percent";
        Label = "Percentage to Allocate";
        Index = "1";
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

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

