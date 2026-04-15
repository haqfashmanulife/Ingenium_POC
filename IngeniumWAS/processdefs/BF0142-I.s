# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:16 PM EDT

#*******************************************************************************
#*  Component:   BF0142-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0142-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-TAXBL-PAYO-AMT";
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

    INOUT MIR-ACUM-GDLN-PREM-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Guideline Annual Premium";
    }

    INOUT MIR-ANNV-ACB-OVRID-CD
    {
        Length = "1";
        SType = "Text";
        Label = "ACB Override Reason";
    }

    INOUT MIR-FED-TAX-SUSP-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Federal: Tax Withheld on Post-dated payout";
    }

    INOUT MIR-FED-TAXWH-ADDL-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Federal : Additional Taxes Withheld";
    }

    INOUT MIR-FED-TAXWH-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Federal: Tax Withheld from Most Recent Payout";
    }

    INOUT MIR-FED-TAXWH-NYR-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Federal: Tax Withheld Next Year";
    }

    INOUT MIR-FED-TAXWH-PYR-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Tax Withheld Prior Year";
    }

    INOUT MIR-FED-TAXWH-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Federal: Tax Withheld Year to Date";
    }

    INOUT MIR-IA-REMN-INV-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Remaining Investment in the Contract";
    }

    INOUT MIR-IA-TAX-EXCL-PCT
    {
        Length = "4";
        Decimals = "1";
        SType = "Percent";
        Label = "Tax Exclusion Ratio";
    }

    INOUT MIR-LOAN-DISP-TAX-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Taxable Loan Dispositions";
    }

    INOUT MIR-LOAN-DISP-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Loan Disposition";
    }

    INOUT MIR-NTAXBL-PAY-LTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Nontaxed Portion Life to Date";
    }

    INOUT MIR-NTAXBL-PAY-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Nontaxed Portion Year To date";
    }

    INOUT MIR-POL-7702-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-7702-CD";
        SType = "Selection";
        Label = "7702 Tax Regulation";
    }

    INOUT MIR-POL-7PAY-ANN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "7-Pay Annual Premium";
    }

    INOUT MIR-POL-7PAY-CUM-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium";
    }

    INOUT MIR-POL-ANPAYO-LTD-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Accmulated Payments Life to Date";
    }

    INOUT MIR-POL-GDLN-APREM-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Guideline Annual Premiums";
    }

    INOUT MIR-POL-GDLN-SPREM-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Total Guideline Single Premium";
    }

    INOUT MIR-POL-MATRL-CHNG-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Material Change Date";
    }

    INOUT MIR-POL-MEC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MEC-CD";
        SType = "Selection";
        Label = "Modified Endowment Contract (MEC)";
    }

    INOUT MIR-POL-MEC-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Modified Endowment Contract (MEC) Date";
    }

    INOUT MIR-POL-SE-GDLN-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total SEC Guideline Premium";
    }

    INOUT MIR-POL-TAMRA-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAMRA-CD";
        SType = "Selection";
        Label = "Subject to TAMRA";
    }

    INOUT MIR-POL-TAX-RESTR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Tax restrict applies";
    }

    INOUT MIR-PREV-DISP-TAX-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Life to Date Dispositions Taxed";
    }

    INOUT MIR-PREV-LOAN-DISP-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Previous Loan Dispositions";
    }

    INOUT MIR-PREV-XEMP-TST-DUR
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Exemption Test Duration";
    }

    INOUT MIR-PROV-TAX-SUSP-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Provincial: Tax Withheld on Post-dated Payout";
    }

    INOUT MIR-PROV-TAXWH-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Provincial: Tax Withheld from Most Recent Payout";
    }

    INOUT MIR-PROV-TAXWH-NYR-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Provincial:Tax Withheld Next Year";
    }

    INOUT MIR-PROV-TAXWH-YTD-AMT
    {
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

    INOUT MIR-TAX-1035-ACB-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Previous Cost Basis on 1035 Exchange";
    }

    INOUT MIR-TAX-1035-PD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premiums Received on 1035 Exchange";
    }

    INOUT MIR-TAX-ACQ-COST-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Acquisition Costs";
    }

    INOUT MIR-TAX-ACRU-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Accruals Taxed";
    }

    INOUT MIR-TAX-ACUM-1-FND-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Paid-up Additions Amount in Accumulating Fund";
    }

    INOUT MIR-TAX-ACUM-2-FND-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "At Anniversary - 2 Years Ago";
    }

    INOUT MIR-TAX-ACUM-3-FND-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "At Anniversary - 3 Years Ago";
    }

    INOUT MIR-TAX-ANNV-ACB-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Anniversary Adjusted Cost Basis";
    }

    INOUT MIR-TAXBL-GAIN-81-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Policy Gains as of 1981";
    }

    INOUT MIR-TAXBL-PAYO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Taxable Amount of Annuity Payout";
    }

    INOUT MIR-TAXBL-PAYO-LTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxed Portion Life to Date";
    }

    INOUT MIR-TAXBL-PAYO-NYR-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Portion Next Year";
    }

    INOUT MIR-TAXBL-PAYO-PYR-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Portion Last Year";
    }

    INOUT MIR-TAXBL-PAYO-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Portion Year to Date";
    }

    INOUT MIR-TAXBL-PREM-PD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premiums Paid";
    }

    INOUT MIR-TAX-DISP-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Policy Dispositions";
    }

    INOUT MIR-TAX-GAIN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Taxable Gain Amount";
    }

    INOUT MIR-TAX-LOAN-DEDBL-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Deductible Loan Repayments";
    }

    INOUT MIR-TAX-LOAN-DOD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Secured Against Dividends on Deposit";
    }

    INOUT MIR-TAX-LOAN-INT-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Loan Interest Capitalized on Loans";
    }

    INOUT MIR-TAX-MORT-GAIN-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Mortality Gains after Annuitization";
    }

    INOUT MIR-TAX-MORT-LOS-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Mortality Loss after Annuitization";
    }

    INOUT MIR-TAX-NCPI-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Net Cost of Pure Insurance";
    }

    INOUT MIR-TAX-PREV-DISP-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Previous Dispositions";
    }

    INOUT MIR-TAX-SUPP-PREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Premiums for Supplementary Benefits";
    }

    INOUT MIR-TAX-TRNST-ELE-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Transitional Element Amount";
    }

    INOUT MIR-TAX-XPCT-PMT-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Expected Premiums";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

