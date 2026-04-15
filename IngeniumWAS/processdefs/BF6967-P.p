# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6967-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF6967-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6967";
        BusinessFunctionName = "Policy Inquiry - US Tax";
        BusinessFunctionType = "Taxus";
        MirName = "CCWM6967";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process date";
    }

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

    OUT MIR-CFN-ACB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFS";
        SType = "Currency";
        Label = "Adjusted Cost Basis Value";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-IA-REMN-INV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Remaining Investment in the Contract";
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
        Label = "YTD Loan Disposition";
    }

    OUT MIR-LXPCT-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "LXPCT-CALC-CD";
        DBTableName = "TPOLT";
        SType = "Text";
        Label = "Life Expectancy Calculation Basis";
    }

    OUT MIR-LXPCT-RECALC-IND
    {
        Length = "40";
        DBTableName = "TPOLT";
        SType = "Indicator";
        Label = "Recalculate life expectancy";
    }

    OUT MIR-NTAXBL-PAY-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Nontaxed Portion Life to Date";
    }

    OUT MIR-POL-7702-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-7702-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "7702 Tax Regulations";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
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

    OUT MIR-POL-PDF-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PDF-RFND-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Deposit Fund Type";
    }

    OUT MIR-POL-PNSN-QUALF-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Pension Qualified Indicator";
    }

    OUT MIR-POL-TAX-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Type";
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

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-SE-GDLN-APREM-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Calculate SEC premiums";
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

    OUT MIR-TAXBL-PREM-PD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Total Premiums Paid";
    }

    OUT MIR-TAXBL-PREM-PD-AMT-2
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Original Investment";
    }

    OUT MIR-TAX-DISP-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Total Policy Dispositions";
    }

    OUT MIR-TAX-LOAN-DOD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Loan Secured Against Dividends on Deposit";
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

}

