# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF1820-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFPFU2  CLB      Add field for SegFund COI Withdrawal Order                *
#*  PF30    AKATO    PF 3.0 Retrofit 2004AUG10  - remove fields LSIR-RETURN-CD *
#*                   MIR-RETRN-CD                                              *
#*******************************************************************************

S-STEP BF1820-O
{
    ATTRIBUTES
    {
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

    IN MIR-FND-CLOS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Fund - Date Closed";
    }

    IN MIR-FND-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Fund - Currency";
    }

    IN MIR-FND-CREAT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Fund - Date Created";
    }

    IN MIR-FND-GLA-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-GLA-CD";
        SType = "Text";
        Label = "Gain / Loss - Allocation";
    }

    IN MIR-FND-GLA-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Gain / Loss - Duration";
    }

    IN MIR-FND-MGMT-CHRG-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "4";
        SType = "Percent";
        Label = "Annual Management Fee";
    }

    IN MIR-FND-NB-CLOS-DT
    {
        DisplayOnly;
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

    IN MIR-FND-PREV-SEED-DT
    {
        DisplayOnly;
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

    IN MIR-FND-PRIC-ACCUR-QTY
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Unit Price";
    }

    IN MIR-FND-PRIC-STRUCT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-PRIC-STRUCT-CD";
        SType = "Text";
        Label = "Price Structure";
    }

    IN MIR-FND-REVRS-GLA-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-REVRS-GLA-CD";
        SType = "Text";
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

    IN MIR-FND-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        SType = "Text";
        Label = "Fund Type";
    }

    IN MIR-FND-UNIT-ACCUR-QTY
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Accuracy - Number of Units";
    }

    IN MIR-FND-UNIT-RND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-UNIT-RND-CD";
        SType = "Text";
        Label = "Accuracy - Rounding Method";
    }

    IN MIR-FND-UNIT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FND-UNIT-TYP-CD";
        SType = "Text";
        Label = "Unit Type";
    }

    IN MIR-FND-XPCT-GRWTH-AMT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Expected Price Growth";
    }

    IN MIR-GNRL-VALN-DIR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GNRL-VALN-DIR-CD";
        SType = "Text";
        Label = "General Valuation Direction of Fund";
    }

    IN MIR-INTG-SEED-UNIT-QTY
    {
        DisplayOnly;
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

    IN MIR-MAX-VALN-DY-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Valuation Period - Maximum Interval (Days)";
    }

    IN MIR-MAX-VALN-MO-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Valuation Period - Maximum Interval (Months)";
    }

    IN MIR-MIN-VALN-DY-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Valuation Period - Minimum Interval (Days)";
    }

    IN MIR-MIN-VALN-MO-DUR
    {
        DisplayOnly;
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

    IN MIR-COI-FND-ORDR-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "COI Withdrawal Fund Level Order";
    }
}

