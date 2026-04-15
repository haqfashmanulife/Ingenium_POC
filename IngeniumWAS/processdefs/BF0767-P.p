# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0767-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0767-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0767";
        BusinessFunctionName = "Policy Tax Detail History";
        BusinessFunctionType = "Taxd";
        MirName = "CCWM0931";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-TRXN-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-POL-TRXN-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        Mandatory;
        MixedCase;
        Length = "3";
        DBTableName = "THI";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-TRXN-TASK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "THI";
        DefaultConstant = "9999";
        SType = "Text";
        Label = "Task Number";
    }

    INOUT MIR-POL-TRXN-TIME
    {
        Key;
        Mandatory;
        Length = "7";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Text";
        Label = "Time";
    }

    OUT MIR-CLI-ADDR-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
    }

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    OUT MIR-DOD-CRNT-INT-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends on Deposit Interest";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-T5-ACRU-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Accrual Amount";
    }

    OUT MIR-DV-T5-CDN-INCM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Other Income From Canadian Sources (Box H)";
    }

    OUT MIR-DV-T5-CDN-INT-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Eligible Interest from Canadian Sources (Box D)";
    }

    OUT MIR-DV-T5-GAIN-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Gain Amount";
    }

    OUT MIR-DV-T5-LOAN-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Loan Disposition Amount";
    }

    OUT MIR-DV-TAXBL-DSTRB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Dispositions Taxed";
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

    OUT MIR-PDF-INT-CLR-AMT
    {
        Length = "11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Deposit Fund Interest";
    }

    OUT MIR-POL-ANPAYO-LTD-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Payments Life to Date";
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

    OUT MIR-TAXBL-GAIN-81-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Policy Gains as of 1981";
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

}

