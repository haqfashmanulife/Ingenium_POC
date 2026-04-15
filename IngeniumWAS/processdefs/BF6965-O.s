# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6965-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF6965-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Taxca";
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
        Label = "Process Date";
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

    IN MIR-ACRU-CALC-TIME-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACRU-CALC-TIME-CD";
        SType = "Text";
        Label = "Accrual Calculation Time";
    }

    IN MIR-DV-CDN-TAX-ACB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Adjusted Cost Basis Amount";
    }

    IN MIR-DV-CVG-RSRV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum Tax Reserve on Coverage";
    }

    IN MIR-DV-DEFR-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Deferred Net Premium";
    }

    IN MIR-DV-MAX-RSRV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum Tax Reserve on Policy";
    }

    IN MIR-DV-NET-MAX-TAX-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accumulation Fund";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-SSTD-RSRV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Substandard Reserve";
    }

    IN MIR-DV-TAX-LOS-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Loss on Disposition";
    }

    IN MIR-GAIN-RPT-TIME-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        SType = "Text";
        Label = "Gain Reporting Time";
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

    IN MIR-LOAN-INT-DEDBL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Loan interest capitalized in current year is tax deductible";
    }

    IN MIR-POL-ANPAYO-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Accumulated Payments Life to Date";
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

    IN MIR-POL-PDF-RFND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PDF-RFND-CD";
        SType = "Text";
        Label = "Premium Deposit Fund Type";
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

    IN MIR-POL-TXEMP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TXEMP-CD";
        SType = "Text";
        Label = "Policy Exempt Status";
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

    IN MIR-TAX-ANNV-ACB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Anniversary Adjusted Cost Basis";
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

    IN MIR-TAX-RPT-FREQ-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "TAX-RPT-FREQ-CD";
        SType = "Text";
        Label = "Tax Reporting Frequency";
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

