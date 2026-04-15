# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:16 PM EDT

#*******************************************************************************
#*  Component:   BF0140-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0140-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-ACUM-GDLN-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Guideline Annual Premium";
    }

    IN MIR-ANNV-ACB-OVRID-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "ACB Override Reason";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-FED-TAX-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Federal: Tax Withheld on Post-dated payout";
    }

    IN MIR-FED-TAXWH-ADDL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Federal : Additional Taxes Withheld";
    }

    IN MIR-FED-TAXWH-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Federal: Tax Withheld from Most Recent Payout";
    }

    IN MIR-FED-TAXWH-NYR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Federal: Tax Withheld Next Year";
    }

    IN MIR-FED-TAXWH-PYR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Tax Withheld Prior Year";
    }

    IN MIR-FED-TAXWH-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Federal: Tax Withheld Year to Date";
    }

    IN MIR-IA-REMN-INV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Remaining Investment in the Contract";
    }

    IN MIR-IA-TAX-EXCL-PCT
    {
        DisplayOnly;
        Length = "4";
        Decimals = "1";
        SType = "Percent";
        Label = "Tax Exclusion Ratio";
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

    IN MIR-NTAXBL-PAY-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Nontaxed Portion Life to Date";
    }

    IN MIR-NTAXBL-PAY-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Nontaxed Portion Year To date";
    }

    IN MIR-POL-7702-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-7702-CD";
        SType = "Text";
        Label = "7702 Tax Regulation";
    }

    IN MIR-POL-7PAY-ANN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "7-Pay Annual Premium";
    }

    IN MIR-POL-7PAY-CUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium";
    }

    IN MIR-POL-ANPAYO-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Accmulated Payments Life to Date";
    }

    IN MIR-POL-GDLN-APREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Guideline Annual Premiums";
    }

    IN MIR-POL-GDLN-SPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Guideline Single Premium";
    }

    IN MIR-POL-MATRL-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Material Change Date";
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

    IN MIR-POL-SE-GDLN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total SEC Guideline Premium";
    }

    IN MIR-POL-TAMRA-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAMRA-CD";
        SType = "Text";
        Label = "Subject to TAMRA";
    }

    IN MIR-POL-TAX-RESTR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Tax restrict applies";
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

    IN MIR-PREV-XEMP-TST-DUR
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Exemption Test Duration";
    }

    IN MIR-PROV-TAX-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Provincial: Tax Withheld on Post-dated Payout";
    }

    IN MIR-PROV-TAXWH-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Provincial: Tax Withheld from Most Recent Payout";
    }

    IN MIR-PROV-TAXWH-NYR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Provincial:Tax Withheld Next Year";
    }

    IN MIR-PROV-TAXWH-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        SType = "Currency";
        Label = "Provincial: Tax Withheld Year to Date";
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

    IN MIR-TAX-ACUM-1-FND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Paid-up Additions Amount in Accumulating Fund";
    }

    IN MIR-TAX-ACUM-2-FND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "At Anniversary - 2 Years Ago";
    }

    IN MIR-TAX-ACUM-3-FND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "At Anniversary - 3 Years Ago";
    }

    IN MIR-TAX-ANNV-ACB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Anniversary Adjusted Cost Basis";
    }

    IN MIR-TAXBL-GAIN-81-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Policy Gains as of 1981";
    }

    IN MIR-TAXBL-PAYO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Taxable Amount of Annuity Payout";
    }

    IN MIR-TAXBL-PAYO-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxed Portion Life to Date";
    }

    IN MIR-TAXBL-PAYO-NYR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Portion Next Year";
    }

    IN MIR-TAXBL-PAYO-PYR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Portion Last Year";
    }

    IN MIR-TAXBL-PAYO-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Portion Year to Date";
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

    IN MIR-TAX-XPCT-PMT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Expected Premiums";
    }

}

