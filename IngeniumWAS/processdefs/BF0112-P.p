# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF0112-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0112-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0112";
        BusinessFunctionName = "Fund Unit Value Update";
        BusinessFunctionType = "Update";
        MirName = "SCWM0110";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-FNDVL-AMT
    {
        Length = "18";
        Decimals = "9";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-DV-FNDVL-AMT-2
    {
        Length = "18";
        Decimals = "9";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-DV-FNDVL-AMT-3
    {
        Length = "18";
        Decimals = "9";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-DV-FNDVL-AMT-4
    {
        Length = "18";
        Decimals = "9";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-INTG-UNIT-1-QTY
    {
        Length = "18";
        Decimals = "9";
        DBTableName = "TFH";
        SType = "Number";
        Label = "Accumulation Units (Number of Units)";
    }

    INOUT MIR-INTG-UNIT-2-QTY
    {
        Length = "18";
        Decimals = "9";
        DBTableName = "TFH";
        SType = "Number";
        Label = "Initial Units (Number of Units)";
    }

    INOUT MIR-PURCH-PRIC-1-AMT
    {
        Signed;
        Length = "17";
        Decimals = "9";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Buy Price";
    }

    INOUT MIR-PURCH-PRIC-2-AMT
    {
        Length = "17";
        Decimals = "9";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Buy Price";
    }

    INOUT MIR-SELL-PRIC-1-AMT
    {
        Length = "17";
        Decimals = "9";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Sell Price";
    }

    INOUT MIR-SELL-PRIC-2-AMT
    {
        Length = "17";
        Decimals = "9";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Sell Price";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

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

    OUT MIR-FND-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Fund Type";
    }

    OUT MIR-FND-UNIT-TYP-CD
    {
        Length = "1";
        DBTableName = "TFH";
        SType = "Hidden";
        Label = "Unit Type";
    }

}

