# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0710-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0710-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0710";
        BusinessFunctionName = "Immediate Annuity Quote Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0851";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-IA-QUOT-NUM
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TQT";
        DefaultSession = "MIR-IA-QUOT-NUM";
        SType = "Text";
        Label = "Quote Number";
    }

    OUT MIR-ANUTNT-1-BTH-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "First Annuitant - Birth Date";
    }

    OUT MIR-ANUTNT-1-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "First Annuitant - Sex";
    }

    OUT MIR-ANUTNT-2-BTH-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Second Annuitant - Birth Date";
    }

    OUT MIR-ANUTNT-2-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Second Annuitant - Sex";
    }

    OUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-CVG-ORIG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ORIG";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Origin of Funds";
    }

    OUT MIR-IA-ANUTNT-DTH-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Effective Date of Death";
    }

    OUT MIR-IA-BTH-DT-USE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-BTH-DT-USE-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Birth Date of Annuitant Used";
    }

    OUT MIR-IA-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-CALC-TYP-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Calculation Base";
    }

    OUT MIR-IA-COMM-BAND-1-AMT
    {
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Commission Amount (1)";
    }

    OUT MIR-IA-COMM-BAND-1-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Commission Rate (1)";
    }

    OUT MIR-IA-COMM-BAND-2-AMT
    {
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Commission Amount (2)";
    }

    OUT MIR-IA-COMM-BAND-2-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Commission Rate (2)";
    }

    OUT MIR-IA-COMM-BAND-3-AMT
    {
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Commission Amount (3)";
    }

    OUT MIR-IA-COMM-BAND-3-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Commission Rate (3)";
    }

    OUT MIR-IA-COMM-MAX-AMT
    {
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Maximum Commission Payable";
    }

    OUT MIR-IA-DTH-INCM-AMT
    {
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Death Amount";
    }

    OUT MIR-IA-FED-TAXWH-AMT
    {
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Tax Withholding Amount";
    }

    OUT MIR-IA-GRS-SPREM-AMT
    {
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Gross Single Premium";
    }

    OUT MIR-IA-GUAR-MO-DUR
    {
        Length = "2";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Number of Months";
    }

    OUT MIR-IA-GUAR-TRM-FCT
    {
        Length = "9";
        Decimals = "5";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Term Certain Factor";
    }

    OUT MIR-IA-GUAR-YR-DUR
    {
        Length = "2";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Number of Years";
    }

    OUT MIR-IA-INCM-1-ADJ-FCT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Income Adjustment Factor 1 - Death of First Annuitant";
    }

    OUT MIR-IA-INCM-2-ADJ-FCT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Income Adjustment Factor 2 - Death of Second Annuitant";
    }

    OUT MIR-IA-INCM-ADJ-AMT
    {
        Signed;
        Length = "12";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Income Adjustment Amount";
    }

    OUT MIR-IA-INCM-ADJ-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Income Adjustment Date";
    }

    OUT MIR-IA-INCM-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "IA-INCM-MODE-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Income Mode";
    }

    OUT MIR-IA-INCM-STRT-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Income Date";
    }

    OUT MIR-IA-INT-1-RT-DY-DUR
    {
        Length = "3";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Rate - Days";
    }

    OUT MIR-IA-INT-1-RT-MO-DUR
    {
        Length = "3";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Rate - Months";
    }

    OUT MIR-IA-INT-LEGAL-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Statutory Scale";
    }

    OUT MIR-IA-INT-PREM-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Premium Scale";
    }

    OUT MIR-IA-INT-RT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PIRTS";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Annual Interest Code";
    }

    OUT MIR-IA-INT-TAX-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Tax Scale";
    }

    OUT MIR-IA-MORT-LEGAL-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Mortality Statutory Scale";
    }

    OUT MIR-IA-MORT-PREM-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Mortality Premium Scale";
    }

    OUT MIR-IA-MORT-TAX-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Mortality Tax Scale";
    }

    OUT MIR-IA-MORT-UVAL-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PUVAL";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Annuity Mortality Code";
    }

    OUT MIR-IA-PNSN-QUALF-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Pension Qualifier";
    }

    OUT MIR-IA-PREM-PMT-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Premium Payment Date";
    }

    OUT MIR-IA-QUOT-AGT-NM-TXT
    {
        Length = "20";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Agent Name";
    }

    OUT MIR-IA-QUOT-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-BNFT-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Beneficiary";
    }

    OUT MIR-IA-QUOT-CO-NM-TXT
    {
        Length = "20";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Company of Quote";
    }

    OUT MIR-IA-QUOT-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Country";
    }

    OUT MIR-IA-QUOT-DEFR-FCT
    {
        Length = "9";
        Decimals = "5";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Deferral Factor";
    }

    OUT MIR-IA-QUOT-EFF-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Effective Date of Quote";
    }

    OUT MIR-IA-QUOT-EFF-TIME
    {
        Length = "8";
        DBTableName = "TQT";
        SType = "Time";
        Label = "Effective Time of Quote";
    }

    OUT MIR-IA-QUOT-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-FND-SRC-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Fund Source";
    }

    OUT MIR-IA-QUOT-GUAR-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Age Income Guaranteed Paid";
    }

    OUT MIR-IA-QUOT-INCM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Ultimate Periodic Income";
    }

    OUT MIR-IA-QUOT-INT-1-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Interest Rate (1)";
    }

    OUT MIR-IA-QUOT-INT-2-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Interest Rate (2)";
    }

    OUT MIR-IA-QUOT-JNT-DTH-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-JNT-DTH-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Joint Death Status";
    }

    OUT MIR-IA-QUOT-JNT-PMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-JNT-PMT-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Joint Payment Type";
    }

    OUT MIR-IA-QUOT-LIFE-FCT
    {
        Length = "9";
        Decimals = "5";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Life Factor";
    }

    OUT MIR-IA-QUOT-NPREM-AMT
    {
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Net Premium Amount";
    }

    OUT MIR-IA-QUOT-PFEE-AMT
    {
        Length = "11";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Policy Fee Amount";
    }

    OUT MIR-IA-QUOT-REF-TXT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Client Quote Number";
    }

    OUT MIR-IA-QUOT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-STAT-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Quote Status";
    }

    OUT MIR-IA-QUOT-TOT-FCT
    {
        Length = "9";
        Decimals = "5";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Total Annuity Factor";
    }

    OUT MIR-IA-QUOT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-TYP-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Annuity Type";
    }

    OUT MIR-IA-QUOT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Expiry Date of Quote";
    }

    OUT MIR-IA-TAXBL-INCM-AMT
    {
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Taxable Income";
    }

    OUT MIR-IA-TAX-EXCL-PCT
    {
        Length = "4";
        Decimals = "1";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Tax Exclusion Ratio";
    }

    OUT MIR-IA-TOT-COMM-AMT
    {
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Total Commission Payable";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Plan";
    }

    OUT MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Policy Id";
    }

    OUT MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-PREV-QUOT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREV-QUOT-STAT-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Old Quote Status";
    }

    OUT MIR-QUOT-STAT-CHNG-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Status Changed Date";
    }

    OUT MIR-REPL-IA-QUOT-NUM
    {
        Length = "6";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Replaced / Replacing Quote Number";
    }

    OUT MIR-STAT-CHNG-USER-ID
    {
        Length = "8";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Change Operator Initials";
    }

    OUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "TQT";
        SType = "Text";
        Label = "User ID";
    }

}

