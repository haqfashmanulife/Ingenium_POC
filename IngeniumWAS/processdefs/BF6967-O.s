# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6967-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF6967-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Taxus";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process date";
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

    IN MIR-CFN-ACB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Cost Basis Value";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-IA-REMN-INV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Remaining Investment in the Contract";
    }

    IN MIR-LOAN-DISP-TAX-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Taxable Loan Dispositions";
    }

    IN MIR-LOAN-DISP-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "YTD Loan Disposition";
    }

    IN MIR-LXPCT-CALC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "LXPCT-CALC-CD";
        SType = "Text";
        Label = "Life Expectancy Calculation Basis";
    }

    IN MIR-LXPCT-RECALC-IND
    {
        DisplayOnly;
        Length = "40";
        SType = "Indicator";
        Label = "Recalculate life expectancy";
    }

    IN MIR-NTAXBL-PAY-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Nontaxed Portion Life to Date";
    }

    IN MIR-POL-7702-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-7702-CD";
        SType = "Text";
        Label = "7702 Tax Regulations";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }

    IN MIR-POL-MEC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MEC-CD";
        SType = "Text";
        Label = "Modified Endowment Contract (MEC)";
    }

    IN MIR-POL-MEC-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Modified Endowment Contract (MEC) Date";
    }

    IN MIR-POL-PDF-RFND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PDF-RFND-CD";
        SType = "Text";
        Label = "Premium Deposit Fund Type";
    }

    IN MIR-POL-PNSN-QUALF-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        SType = "Text";
        Label = "Pension Qualified Indicator";
    }

    IN MIR-POL-TAX-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        SType = "Text";
        Label = "Policy Type";
    }

    IN MIR-PREV-DISP-TAX-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Life to Date Dispositions Taxed";
    }

    IN MIR-PREV-LOAN-DISP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Previous Loan Dispositions";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-SE-GDLN-APREM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Calculate SEC premiums";
    }

    IN MIR-TAX-1035-ACB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Previous Cost Basis on 1035 Exchange";
    }

    IN MIR-TAX-1035-PD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premiums Received on 1035 Exchange";
    }

    IN MIR-TAXBL-PREM-PD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premiums Paid";
    }

    IN MIR-TAXBL-PREM-PD-AMT-2
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Original Investment";
    }

    IN MIR-TAX-DISP-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Policy Dispositions";
    }

    IN MIR-TAX-LOAN-DOD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Secured Against Dividends on Deposit";
    }

    IN MIR-TAX-PREV-DISP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Previous Dispositions";
    }

    IN MIR-TAX-SUPP-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Premiums for Supplementary Benefits";
    }

}

