# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:26 PM EDT

#*******************************************************************************
#*  Component:   BF0634Key-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0634Key-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Psrunit";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-CF-PROV-TAXWH-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Provincial Tax Withheld";
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

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Key;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Cashflow Effective Date";
    }

    INOUT MIR-DV-CF-REASN-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Selection";
        Label = "Transaction Reason";
    }

    INOUT MIR-DV-CF-UNIT-QTY
    {
        Key;
        Mandatory;
        Length = "13";
        SType = "Text";
        Label = "Total Units Available to Surrender";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}

