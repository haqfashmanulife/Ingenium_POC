# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:49 PM EDT

#*******************************************************************************
#*  Component:   BF1730-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1730-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Contr";
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

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CFN-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-CVG-CDN-GAIN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Realized Capital Gains (Canadian)";
    }

    IN MIR-CVG-ELIG-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Investment Income Deduction - Eligible Dividend Income";
    }

    IN MIR-CVG-ELIG-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Investment Income Deduction - Eligible Interest Income";
    }

    IN MIR-CVG-FRGN-GAIN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Realized Capital Gains (Foreign)";
    }

    IN MIR-CVG-INELG-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Ineligible dividend Income - Investment Income Deduction";
    }

    IN MIR-CVG-INELG-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Ineligible Interest Income - Investment Income Deduction";
    }

    IN MIR-CVG-OTHR-INCM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Other Income";
    }

    IN MIR-CVG-T5-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Pending Interest Amount";
    }

    IN MIR-DV-CDN-TAX-ACB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Adjusted Cost Basis Amount";
    }

    IN MIR-EARLST-CIA-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Activity Dates - Earliest Record";
    }

    IN MIR-FRST-PRCES-CIA-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Activity Dates - First Record";
    }

    IN MIR-LATST-CIA-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Record";
    }

    IN MIR-LATST-DPOS-CIA-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Deposit";
    }

    IN MIR-LATST-PSUR-CIA-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Partial Surrender";
    }

    IN MIR-PREV-T3-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last T3 Date";
    }

    IN MIR-RPT-PEND-CIA-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Report Pending Activity Date";
    }

    IN MIR-VALU-PEND-CIA-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Fund Units Pending Activity Date";
    }

}

