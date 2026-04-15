# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF0140-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0140-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0140";
        BusinessFunctionName = "Policy Tax Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0142";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-ACUM-GDLN-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Guideline Annual Premium";
    }

    OUT MIR-ANNV-ACB-OVRID-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "ACB Override Reason";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-FED-TAX-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Tax Withheld on Post-dated payout";
    }

    OUT MIR-FED-TAXWH-ADDL-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal : Additional Taxes Withheld";
    }

    OUT MIR-FED-TAXWH-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Tax Withheld from Most Recent Payout";
    }

    OUT MIR-FED-TAXWH-NYR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Tax Withheld Next Year";
    }

    OUT MIR-FED-TAXWH-PYR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Tax Withheld Prior Year";
    }

    OUT MIR-FED-TAXWH-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Tax Withheld Year to Date";
    }

    OUT MIR-IA-REMN-INV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Remaining Investment in the Contract";
    }

    OUT MIR-IA-TAX-EXCL-PCT
    {
        Length = "4";
        Decimals = "1";
        DBTableName = "TPOLT";
        SType = "Percent";
        Label = "Tax Exclusion Ratio";
    }

    OUT MIR-LOAN-DISP-TAX-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxable Loan Dispositions";
    }

    OUT MIR-LOAN-DISP-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxable Loan Disposition";
    }

    OUT MIR-NTAXBL-PAY-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Nontaxed Portion Life to Date";
    }

    OUT MIR-NTAXBL-PAY-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Nontaxed Portion Year To date";
    }

    OUT MIR-POL-7702-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-7702-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "7702 Tax Regulation";
    }

    OUT MIR-POL-7PAY-ANN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "7-Pay Annual Premium";
    }

    OUT MIR-POL-7PAY-CUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium";
    }

    OUT MIR-POL-ANPAYO-LTD-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accmulated Payments Life to Date";
    }

    OUT MIR-POL-GDLN-APREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Guideline Annual Premiums";
    }

    OUT MIR-POL-GDLN-SPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Guideline Single Premium";
    }

    OUT MIR-POL-MATRL-CHNG-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Material Change Date";
    }

    OUT MIR-POL-MEC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MEC-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Modified Endowment Contract (MEC)";
    }

    OUT MIR-POL-MEC-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Modified Endowment Contract (MEC) Date";
    }

    OUT MIR-POL-SE-GDLN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total SEC Guideline Premium";
    }

    OUT MIR-POL-TAMRA-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAMRA-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Subject to TAMRA";
    }

    OUT MIR-POL-TAX-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Tax restrict applies";
    }

    OUT MIR-PREV-DISP-TAX-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Amount of Life to Date Dispositions Taxed";
    }

    OUT MIR-PREV-LOAN-DISP-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Previous Loan Dispositions";
    }

    OUT MIR-PREV-XEMP-TST-DUR
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Exemption Test Duration";
    }

    OUT MIR-PROV-TAX-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Provincial: Tax Withheld on Post-dated Payout";
    }

    OUT MIR-PROV-TAXWH-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Provincial: Tax Withheld from Most Recent Payout";
    }

    OUT MIR-PROV-TAXWH-NYR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Provincial:Tax Withheld Next Year";
    }

    OUT MIR-PROV-TAXWH-YTD-AMT
    {
        Signed;
        Length = "9";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Provincial: Tax Withheld Year to Date";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-TAX-1035-ACB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Previous Cost Basis on 1035 Exchange";
    }

    OUT MIR-TAX-1035-PD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Total Premiums Received on 1035 Exchange";
    }

    OUT MIR-TAX-ACQ-COST-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Acquisition Costs";
    }

    OUT MIR-TAX-ACRU-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Amount of Accruals Taxed";
    }

    OUT MIR-TAX-ACUM-1-FND-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Paid-up Additions Amount in Accumulating Fund";
    }

    OUT MIR-TAX-ACUM-2-FND-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "At Anniversary - 2 Years Ago";
    }

    OUT MIR-TAX-ACUM-3-FND-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "At Anniversary - 3 Years Ago";
    }

    OUT MIR-TAX-ANNV-ACB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Anniversary Adjusted Cost Basis";
    }

    OUT MIR-TAXBL-GAIN-81-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Policy Gains as of 1981";
    }

    OUT MIR-TAXBL-PAYO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxable Amount of Annuity Payout";
    }

    OUT MIR-TAXBL-PAYO-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxed Portion Life to Date";
    }

    OUT MIR-TAXBL-PAYO-NYR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxable Portion Next Year";
    }

    OUT MIR-TAXBL-PAYO-PYR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxable Portion Last Year";
    }

    OUT MIR-TAXBL-PAYO-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxable Portion Year to Date";
    }

    OUT MIR-TAXBL-PREM-PD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Total Premiums Paid";
    }

    OUT MIR-TAX-DISP-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Total Policy Dispositions";
    }

    OUT MIR-TAX-GAIN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxable Gain Amount";
    }

    OUT MIR-TAX-LOAN-DEDBL-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Deductible Loan Repayments";
    }

    OUT MIR-TAX-LOAN-DOD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Loan Secured Against Dividends on Deposit";
    }

    OUT MIR-TAX-LOAN-INT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Loan Interest Capitalized on Loans";
    }

    OUT MIR-TAX-MORT-GAIN-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Mortality Gains after Annuitization";
    }

    OUT MIR-TAX-MORT-LOS-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Mortality Loss after Annuitization";
    }

    OUT MIR-TAX-NCPI-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Net Cost of Pure Insurance";
    }

    OUT MIR-TAX-PREV-DISP-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Previous Dispositions";
    }

    OUT MIR-TAX-SUPP-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Total Premiums for Supplementary Benefits";
    }

    OUT MIR-TAX-TRNST-ELE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Transitional Element Amount";
    }

    OUT MIR-TAX-XPCT-PMT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Total Expected Premiums";
    }

}

