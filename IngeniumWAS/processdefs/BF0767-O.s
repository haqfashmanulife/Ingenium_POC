# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:29 PM EDT

#*******************************************************************************
#*  Component:   BF0767-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0767-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Taxd";
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

    IN MIR-POL-TRXN-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-TRXN-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-POL-TRXN-TASK-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        DefaultConstant = "9999";
        SType = "Text";
        Label = "Task Number";
    }

    IN MIR-POL-TRXN-TIME
    {
        Key;
        DisplayOnly;
        Length = "7";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Text";
        Label = "Time";
    }

    IN MIR-CLI-ADDR-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
    }

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    IN MIR-DOD-CRNT-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Dividends on Deposit Interest";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-T5-ACRU-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Accrual Amount";
    }

    IN MIR-DV-T5-CDN-INCM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Other Income From Canadian Sources (Box H)";
    }

    IN MIR-DV-T5-CDN-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Eligible Interest from Canadian Sources (Box D)";
    }

    IN MIR-DV-T5-GAIN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Gain Amount";
    }

    IN MIR-DV-T5-LOAN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Loan Disposition Amount";
    }

    IN MIR-DV-TAXBL-DSTRB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dispositions Taxed";
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
        Label = "Taxable Loan Disposition";
    }

    IN MIR-PDF-INT-CLR-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Premium Deposit Fund Interest";
    }

    IN MIR-POL-ANPAYO-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Accumulated Payments Life to Date";
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

    IN MIR-TAX-ACQ-COST-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Acquisition Costs";
    }

    IN MIR-TAX-ACRU-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Accruals Taxed";
    }

    IN MIR-TAXBL-GAIN-81-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Policy Gains as of 1981";
    }

    IN MIR-TAXBL-PREM-PD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premiums Paid";
    }

    IN MIR-TAX-DISP-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Policy Dispositions";
    }

    IN MIR-TAX-GAIN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Gain Amount";
    }

    IN MIR-TAX-LOAN-DEDBL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Deductible Loan Repayments";
    }

    IN MIR-TAX-LOAN-DOD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Secured Against Dividends on Deposit";
    }

    IN MIR-TAX-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Loan Interest Capitalized on Loans";
    }

    IN MIR-TAX-MORT-GAIN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Mortality Gains after Annuitization";
    }

    IN MIR-TAX-MORT-LOS-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Mortality Loss after Annuitization";
    }

    IN MIR-TAX-NCPI-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Net Cost of Pure Insurance";
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

    IN MIR-TAX-TRNST-ELE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Transitional Element Amount";
    }

}

