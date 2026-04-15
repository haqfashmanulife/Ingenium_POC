# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF0113-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0113-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0113";
        BusinessFunctionName = "Fund Unit Value Delete";
        BusinessFunctionType = "Delete";
        MirName = "SCWM0110";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-FND-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFV";
        SType = "Selection";
        Label = "Fund";
    }

    IN MIR-FNDVL-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFV";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Fund Valuation Date";
    }

    OUT MIR-FND-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Fund Type";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
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

    OUT MIR-FNDVL-EFF-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TFV";
        SType = "Date";
        Label = "Fund Valuation Date";
        Index = "1";
    }

    OUT MIR-PURCH-PRIC-1-AMT-T[10]
    {
        Signed;
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table10";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Buy Price";
        Index = "1";
    }

    OUT MIR-PURCH-PRIC-2-AMT-T[10]
    {
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table10";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Buy Price";
        Index = "1";
    }

    OUT MIR-SELL-PRIC-1-AMT-T[10]
    {
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table10";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Sell Price";
        Index = "1";
    }

    OUT MIR-SELL-PRIC-2-AMT-T[10]
    {
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table10";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Sell Price";
        Index = "1";
    }

}

