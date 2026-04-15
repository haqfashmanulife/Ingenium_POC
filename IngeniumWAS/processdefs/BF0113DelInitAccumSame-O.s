# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:15 PM EDT

#*******************************************************************************
#*  Component:   BF0113DelInitAccumSame-O.s                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0113DelInitAccumSame-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Delete";
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

    IN MIR-FND-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        SType = "Text";
        Label = "Fund Type";
    }

    IN MIR-FND-PRIC-STRUCT-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Price Structure";
    }

    IN MIR-FND-UNIT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Unit Type";
    }

    IN MIR-FNDVL-EFF-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        KeyColumn;
        SType = "Date";
        Label = "Fund Valuation Date";
        Index = "1";
    }

    IN MIR-PURCH-PRIC-1-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Buy Price";
        Index = "1";
    }

    IN MIR-PURCH-PRIC-2-AMT-T[10]
    {
        DisplayOnly;
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Buy Price";
        Index = "1";
    }

}

