# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF1820-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFPFU2  CLB      Add field for SegFund COI Withdrawal Order                *
#*  PF30    AKATO    PF 3.0 Retrofit 2004AUG10  - Added top comment            * 
#*******************************************************************************

P-STEP BF1820-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1820";
        BusinessFunctionName = "Fund Description Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "SCWM0120";
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
        DBTableName = "TFR";
        SType = "Selection";
        Label = "Fund";
    }

    OUT MIR-FND-CLOS-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Fund - Date Closed";
    }

    OUT MIR-FND-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Fund - Currency";
    }

    OUT MIR-FND-CREAT-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Fund - Date Created";
    }

    OUT MIR-FND-GLA-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-GLA-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Gain / Loss - Allocation";
    }

    OUT MIR-FND-GLA-DUR
    {
        Length = "3";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Gain / Loss - Duration";
    }

    OUT MIR-FND-MGMT-CHRG-PCT
    {
        Length = "5";
        Decimals = "4";
        DBTableName = "TFH";
        SType = "Percent";
        Label = "Annual Management Fee";
    }

    OUT MIR-FND-NB-CLOS-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Fund - Date Closed for New Business";
    }

    OUT MIR-FND-NXT-VALN-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Next Fund Valuation Date";
    }

    OUT MIR-FND-PREV-SEED-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Seed - Last Transaction Date";
    }

    OUT MIR-FND-PREV-SPLT-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Last Split Date";
    }

    OUT MIR-FND-PREV-VALN-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Last Fund Valuation Date";
    }

    OUT MIR-FND-PRIC-ACCUR-QTY
    {
        Length = "1";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Unit Price";
    }

    OUT MIR-FND-PRIC-STRUCT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-PRIC-STRUCT-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Price Structure";
    }

    OUT MIR-FND-REVRS-GLA-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-REVRS-GLA-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Gain / Loss - Reversal Allocation";
    }

    OUT MIR-FND-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-STAT-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Fund Status";
    }

    OUT MIR-FND-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Fund Type";
    }

    OUT MIR-FND-UNIT-ACCUR-QTY
    {
        Length = "1";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Accuracy - Number of Units";
    }

    OUT MIR-FND-UNIT-RND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-UNIT-RND-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Accuracy - Rounding Method";
    }

    OUT MIR-FND-UNIT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-UNIT-TYP-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Unit Type";
    }

    OUT MIR-FND-XPCT-GRWTH-AMT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TFH";
        SType = "Percent";
        Label = "Expected Price Growth";
    }

    OUT MIR-GNRL-VALN-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GNRL-VALN-DIR-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "General Valuation Direction of Fund";
    }

    OUT MIR-INTG-SEED-UNIT-QTY
    {
        Length = "16";
        Decimals = "9";
        DBTableName = "TFH";
        SType = "Number";
        Label = "Seed - Number of Units";
    }

    OUT MIR-INTG-UNIT-1-QTY
    {
        Length = "18";
        Decimals = "7";
        DBTableName = "TFH";
        SType = "Number";
        Label = "Accumulation Units (Number of Units)";
    }

    OUT MIR-INTG-UNIT-2-QTY
    {
        Length = "18";
        Decimals = "9";
        DBTableName = "TFH";
        SType = "Number";
        Label = "Initial Units (Number of Units)";
    }

    OUT MIR-MAX-VALN-DY-DUR
    {
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Valuation Period - Maximum Interval (Days)";
    }

    OUT MIR-MAX-VALN-MO-DUR
    {
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Valuation Period - Maximum Interval (Months)";
    }

    OUT MIR-MIN-VALN-DY-DUR
    {
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Valuation Period - Minimum Interval (Days)";
    }

    OUT MIR-MIN-VALN-MO-DUR
    {
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Valuation Period - Minimum Interval (Months)";
    }

    OUT MIR-PREV-UNIT-ALLOC-DT
    {
        Length = "9";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Last Unit Allocation Date";
    }

    OUT MIR-COI-FND-ORDR-CD
    {
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "COI Withdrawal Fund Level Order";
    }
}

