# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF1822-I.s                                                    *
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

S-STEP BF1822-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-FND-CRCY-CD";
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

    INOUT MIR-FND-CLOS-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Fund - Date Closed";
    }

    INOUT MIR-FND-CRCY-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Fund - Currency";
    }

    INOUT MIR-FND-CREAT-DT
    {
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Fund - Date Created";
    }

    INOUT MIR-FND-GLA-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-GLA-CD";
        SType = "Selection";
        Label = "Gain / Loss - Allocation";
    }

    INOUT MIR-FND-GLA-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Gain / Loss - Duration";
    }

    INOUT MIR-FND-MGMT-CHRG-PCT
    {
        Length = "5";
        Decimals = "4";
        SType = "Percent";
        Label = "Annual Management Fee";
    }

    INOUT MIR-FND-NB-CLOS-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Fund - Date Closed for New Business";
    }

    IN MIR-FND-NXT-VALN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Fund Valuation Date";
    }

    INOUT MIR-FND-PREV-SEED-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Seed - Last Transaction Date";
    }

    IN MIR-FND-PREV-SPLT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Split Date";
    }

    IN MIR-FND-PREV-VALN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Fund Valuation Date";
    }

    INOUT MIR-FND-PRIC-ACCUR-QTY
    {
        Length = "1";
        SType = "Text";
        Label = "Unit Price";
    }

    INOUT MIR-FND-PRIC-STRUCT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-PRIC-STRUCT-CD";
        SType = "Selection";
        Label = "Price Structure";
    }

    INOUT MIR-FND-REVRS-GLA-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-REVRS-GLA-CD";
        SType = "Selection";
        Label = "Gain / Loss - Reversal Allocation";
    }

    IN MIR-FND-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-STAT-CD";
        SType = "Text";
        Label = "Fund Status";
    }

    INOUT MIR-FND-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        SType = "Selection";
        Label = "Fund Type";
    }

    INOUT MIR-FND-UNIT-ACCUR-QTY
    {
        Length = "1";
        SType = "Text";
        Label = "Accuracy - Number of Units";
    }

    INOUT MIR-FND-UNIT-RND-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-UNIT-RND-CD";
        SType = "Selection";
        Label = "Accuracy - Rounding Method";
    }

    INOUT MIR-FND-UNIT-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-UNIT-TYP-CD";
        SType = "Selection";
        Label = "Unit Type";
    }

    INOUT MIR-FND-XPCT-GRWTH-AMT
    {
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Expected Price Growth";
    }

    INOUT MIR-GNRL-VALN-DIR-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GNRL-VALN-DIR-CD";
        SType = "Selection";
        Label = "General Valuation Direction of Fund";
    }

    INOUT MIR-INTG-SEED-UNIT-QTY
    {
        Length = "16";
        Decimals = "9";
        SType = "Number";
        Label = "Seed - Number of Units";
    }

    IN MIR-INTG-UNIT-1-QTY
    {
        DisplayOnly;
        Length = "18";
        Decimals = "7";
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

    INOUT MIR-MAX-VALN-DY-DUR
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Valuation Period - Maximum Interval (Days)";
    }

    INOUT MIR-MAX-VALN-MO-DUR
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Valuation Period - Maximum Interval (Months)";
    }

    INOUT MIR-MIN-VALN-DY-DUR
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Valuation Period - Minimum Interval (Days)";
    }

    INOUT MIR-MIN-VALN-MO-DUR
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Valuation Period - Minimum Interval (Months)";
    }

    IN MIR-PREV-UNIT-ALLOC-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Last Unit Allocation Date";
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

    INOUT MIR-COI-FND-ORDR-CD
    {
        Length = "2";
        SType = "Text";
        Label = "COI Withdrawal Fund Level Order";
    }
}

