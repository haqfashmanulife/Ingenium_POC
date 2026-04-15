# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6965-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF6965-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6965";
        BusinessFunctionName = "Policy Inquiry - Canadian Tax";
        BusinessFunctionType = "Taxca";
        MirName = "CCWM6965";
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
        Label = "Process Date";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    OUT MIR-ACRU-CALC-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACRU-CALC-TIME-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Accrual Calculation Time";
    }

    OUT MIR-DV-CDN-TAX-ACB-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Adjusted Cost Basis Amount";
    }

    OUT MIR-DV-CVG-RSRV-AMT
    {
        Signed;
        Length = "13";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Maximum Tax Reserve on Coverage";
    }

    OUT MIR-DV-DEFR-PREM-AMT
    {
        Signed;
        Length = "11";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Deferred Net Premium";
    }

    OUT MIR-DV-MAX-RSRV-AMT
    {
        Signed;
        Length = "13";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Maximum Tax Reserve on Policy";
    }

    OUT MIR-DV-NET-MAX-TAX-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Accumulation Fund";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-SSTD-RSRV-AMT
    {
        Signed;
        Length = "11";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Substandard Reserve";
    }

    OUT MIR-DV-TAX-LOS-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Taxable Loss on Disposition";
    }

    OUT MIR-GAIN-RPT-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Gain Reporting Time";
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

    OUT MIR-LOAN-INT-DEDBL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Loan interest capitalized in current year is tax deductible";
    }

    OUT MIR-POL-ANPAYO-LTD-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Payments Life to Date";
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

    OUT MIR-POL-PDF-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PDF-RFND-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Deposit Fund Type";
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

    OUT MIR-POL-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TXEMP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Exempt Status";
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

    OUT MIR-TAX-ANNV-ACB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Anniversary Adjusted Cost Basis";
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

    OUT MIR-TAX-RPT-FREQ-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "TAX-RPT-FREQ-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Tax Reporting Frequency";
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

}

