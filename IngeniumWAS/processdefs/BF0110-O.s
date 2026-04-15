# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT

#*******************************************************************************
#*  Component:   BF0110-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0110-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-DV-FNDVL-AMT
    {
        DisplayOnly;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Fund Value";
    }

    IN MIR-DV-FNDVL-AMT-2
    {
        DisplayOnly;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Fund Value";
    }

    IN MIR-DV-FNDVL-AMT-3
    {
        DisplayOnly;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Fund Value";
    }

    IN MIR-DV-FNDVL-AMT-4
    {
        DisplayOnly;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Fund Value";
    }

    IN MIR-FND-PRIC-STRUCT-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Price Structure";
    }

    IN MIR-FND-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        SType = "Text";
        Label = "Fund Type";
    }

    IN MIR-FND-UNIT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Unit Type";
    }

    IN MIR-INTG-UNIT-1-QTY
    {
        DisplayOnly;
        Length = "18";
        Decimals = "9";
        SType = "Number";
        Label = "Accumulation Units (Number of Units)";
    }

    IN MIR-INTG-UNIT-2-QTY
    {
        DisplayOnly;
        Length = "18";
        Decimals = "9";
        SType = "Number";
        Label = "Initial Units (Number of Units)";
    }

    IN MIR-PURCH-PRIC-1-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        Decimals = "9";
        SType = "Currency";
        Label = "Buy Price";
    }

    IN MIR-PURCH-PRIC-2-AMT
    {
        DisplayOnly;
        Length = "17";
        Decimals = "9";
        SType = "Currency";
        Label = "Buy Price";
    }

    IN MIR-SELL-PRIC-1-AMT
    {
        DisplayOnly;
        Length = "17";
        Decimals = "9";
        SType = "Currency";
        Label = "Sell Price";
    }

    IN MIR-SELL-PRIC-2-AMT
    {
        DisplayOnly;
        Length = "17";
        Decimals = "9";
        SType = "Currency";
        Label = "Sell Price";
    }

}

