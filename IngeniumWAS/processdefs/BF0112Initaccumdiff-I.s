# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:14 PM EDT

#*******************************************************************************
#*  Component:   BF0112Initaccumdiff-I.s                                       *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0112Initaccumdiff-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-INTG-UNIT-1-QTY";
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

    INOUT MIR-DV-FNDVL-AMT
    {
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-DV-FNDVL-AMT-2
    {
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-DV-FNDVL-AMT-3
    {
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-DV-FNDVL-AMT-4
    {
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-INTG-UNIT-1-QTY
    {
        Length = "18";
        Decimals = "9";
        SType = "Number";
        Label = "Accumulation Units (Number of Units)";
    }

    INOUT MIR-INTG-UNIT-2-QTY
    {
        Length = "18";
        Decimals = "9";
        SType = "Number";
        Label = "Initial Units (Number of Units)";
    }

    INOUT MIR-PURCH-PRIC-1-AMT
    {
        Signed;
        Length = "17";
        Decimals = "9";
        SType = "Currency";
        Label = "Buy Price";
    }

    INOUT MIR-PURCH-PRIC-2-AMT
    {
        Length = "17";
        Decimals = "9";
        SType = "Currency";
        Label = "Buy Price";
    }

    INOUT MIR-SELL-PRIC-1-AMT
    {
        Length = "17";
        Decimals = "9";
        SType = "Currency";
        Label = "Sell Price";
    }

    INOUT MIR-SELL-PRIC-2-AMT
    {
        Length = "17";
        Decimals = "9";
        SType = "Currency";
        Label = "Sell Price";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

    IN MIR-FND-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund";
    }

    IN MIR-FNDVL-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Fund Valuation Date";
    }

    IN MIR-FND-NXT-VALN-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Fund Valuation Date";
    }

    OUT MIR-DV-PRCES-OVRID-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Override Indicator";
    }

    OUT MIR-FND-PRIC-STRUCT-CD
    {
        Length = "1";
        DBTableName = "TFH";
        SType = "Hidden";
        Label = "Price Structure";
    }

    OUT MIR-FND-UNIT-TYP-CD
    {
        Length = "1";
        DBTableName = "TFH";
        SType = "Hidden";
        Label = "Unit Type";
    }

}

