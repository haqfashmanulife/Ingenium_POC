# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:15 PM EDT

#*******************************************************************************
#*  Component:   BF0114LstAccumSame-O.s                                        *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0114LstAccumSame-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-FND-ID";
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

    INOUT MIR-FND-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Selection";
        Label = "Fund";
    }

    INOUT MIR-FNDVL-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Fund Valuation Date";
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

    IN MIR-FNDVL-EFF-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Fund Valuation Date";
        Action = "SelectItem";
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

}

