# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1822-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFPFU2  CLB      Add field for SegFund COI Withdrawal Order                *
#*  PF30    AKATO    PF 3.0 Retrofit 2004AUG10 - Added top comment             * 
#*******************************************************************************

P-STEP BF1822-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1822";
        BusinessFunctionName = "Fund Description Record Update";
        BusinessFunctionType = "Update";
        MirName = "SCWM0120";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FND-CLOS-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Fund - Date Closed";
    }

    INOUT MIR-FND-CRCY-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TFH";
        SType = "Selection";
        Label = "Fund - Currency";
    }

    INOUT MIR-FND-CREAT-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Fund - Date Created";
    }

    INOUT MIR-FND-GLA-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-GLA-CD";
        DBTableName = "TFH";
        SType = "Selection";
        Label = "Gain / Loss - Allocation";
    }

    INOUT MIR-FND-GLA-DUR
    {
        Length = "3";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Gain / Loss - Duration";
    }

    INOUT MIR-FND-MGMT-CHRG-PCT
    {
        Length = "5";
        Decimals = "4";
        DBTableName = "TFH";
        SType = "Percent";
        Label = "Annual Management Fee";
    }

    INOUT MIR-FND-NB-CLOS-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Fund - Date Closed for New Business";
    }

    INOUT MIR-FND-NXT-VALN-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Next Fund Valuation Date";
    }

    INOUT MIR-FND-PREV-SEED-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Seed - Last Transaction Date";
    }

    INOUT MIR-FND-PREV-SPLT-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Last Split Date";
    }

    INOUT MIR-FND-PREV-VALN-DT
    {
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Last Fund Valuation Date";
    }

    INOUT MIR-FND-PRIC-ACCUR-QTY
    {
        Length = "1";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Unit Price";
    }

    INOUT MIR-FND-PRIC-STRUCT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-PRIC-STRUCT-CD";
        DBTableName = "TFH";
        SType = "Selection";
        Label = "Price Structure";
    }

    INOUT MIR-FND-REVRS-GLA-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-REVRS-GLA-CD";
        DBTableName = "TFH";
        SType = "Selection";
        Label = "Gain / Loss - Reversal Allocation";
    }

    INOUT MIR-FND-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-STAT-CD";
        DBTableName = "TFH";
        SType = "Selection";
        Label = "Fund Status";
    }

    INOUT MIR-FND-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        DBTableName = "TFH";
        SType = "Selection";
        Label = "Fund Type";
    }

    INOUT MIR-FND-UNIT-ACCUR-QTY
    {
        Length = "1";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Accuracy - Number of Units";
    }

    INOUT MIR-FND-UNIT-RND-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-UNIT-RND-CD";
        DBTableName = "TFH";
        SType = "Selection";
        Label = "Accuracy - Rounding Method";
    }

    INOUT MIR-FND-UNIT-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-UNIT-TYP-CD";
        DBTableName = "TFH";
        SType = "Selection";
        Label = "Unit Type";
    }

    INOUT MIR-FND-XPCT-GRWTH-AMT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TFH";
        SType = "Percent";
        Label = "Expected Price Growth";
    }

    INOUT MIR-GNRL-VALN-DIR-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GNRL-VALN-DIR-CD";
        DBTableName = "TFH";
        SType = "Selection";
        Label = "General Valuation Direction of Fund";
    }

    INOUT MIR-INTG-SEED-UNIT-QTY
    {
        Length = "16";
        Decimals = "9";
        DBTableName = "TFH";
        SType = "Number";
        Label = "Seed - Number of Units";
    }

    INOUT MIR-INTG-UNIT-1-QTY
    {
        Length = "18";
        Decimals = "7";
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

    INOUT MIR-MAX-VALN-DY-DUR
    {
        Mandatory;
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Valuation Period - Maximum Interval (Days)";
    }

    INOUT MIR-MAX-VALN-MO-DUR
    {
        Mandatory;
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Valuation Period - Maximum Interval (Months)";
    }

    INOUT MIR-MIN-VALN-DY-DUR
    {
        Mandatory;
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Valuation Period - Minimum Interval (Days)";
    }

    INOUT MIR-MIN-VALN-MO-DUR
    {
        Mandatory;
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Valuation Period - Minimum Interval (Months)";
    }

    INOUT MIR-PREV-UNIT-ALLOC-DT
    {
        Length = "9";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Last Unit Allocation Date";
    }

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

    INOUT MIR-COI-FND-ORDR-CD
    {
        Length = "2";
        DBTableName = "TFH";
        SType = "Text";
        Label = "COI Withdrawal Fund Level Order";
    }
}

