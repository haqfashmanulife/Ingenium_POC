# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0711-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0711-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0711";
        BusinessFunctionName = "Immediate Annuity Quote Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0851";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ANUTNT-1-BTH-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "First Annuitant - Birth Date";
    }

    INOUT MIR-ANUTNT-1-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        DBTableName = "TQT";
        SType = "Selection";
        Label = "First Annuitant - Sex";
    }

    INOUT MIR-ANUTNT-2-BTH-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Second Annuitant - Birth Date";
    }

    INOUT MIR-ANUTNT-2-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        DBTableName = "TQT";
        SType = "Selection";
        Label = "Second Annuitant - Sex";
    }

    INOUT MIR-DV-FILE-RQST-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Quote Save Indicator";
    }

    INOUT MIR-IA-BTH-DT-USE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-BTH-DT-USE-CD";
        DBTableName = "TQT";
        DefaultConstant = "1";
        SType = "Selection";
        Label = "Birth Date of Annuitant Used";
    }

    INOUT MIR-IA-CALC-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-CALC-TYP-CD";
        DBTableName = "TQT";
        SType = "Selection";
        Label = "Calculation Base";
    }

    INOUT MIR-IA-COMM-BAND-1-AMT
    {
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Commission Amount (1)";
    }

    INOUT MIR-IA-COMM-BAND-1-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Commission Rate (1)";
    }

    INOUT MIR-IA-COMM-BAND-2-AMT
    {
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Commission Amount (2)";
    }

    INOUT MIR-IA-COMM-BAND-2-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Commission Rate (2)";
    }

    INOUT MIR-IA-COMM-BAND-3-AMT
    {
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Commission Amount (3)";
    }

    INOUT MIR-IA-COMM-BAND-3-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Commission Rate (3)";
    }

    INOUT MIR-IA-COMM-MAX-AMT
    {
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Maximum Commission Payable";
    }

    INOUT MIR-IA-FED-TAXWH-AMT
    {
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Tax Withholding Amount";
    }

    INOUT MIR-IA-GRS-SPREM-AMT
    {
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Gross Single Premium";
    }

    INOUT MIR-IA-GUAR-MO-DUR
    {
        Length = "2";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Number of Months";
    }

    INOUT MIR-IA-GUAR-YR-DUR
    {
        Length = "2";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Number of Years";
    }

    INOUT MIR-IA-INCM-1-ADJ-FCT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        DBTableName = "TQT";
        DefaultConstant = "1";
        SType = "Number";
        Label = "Income Adjustment Factor 1 - Death of First Annuitant";
    }

    INOUT MIR-IA-INCM-2-ADJ-FCT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        DBTableName = "TQT";
        DefaultConstant = "1";
        SType = "Number";
        Label = "Income Adjustment Factor 2 - Death of Second Annuitant";
    }

    INOUT MIR-IA-INCM-ADJ-AMT
    {
        Signed;
        Length = "12";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Income Adjustment Amount";
    }

    INOUT MIR-IA-INCM-ADJ-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Income Adjustment Date";
    }

    INOUT MIR-IA-INCM-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "IA-INCM-MODE-CD";
        DBTableName = "TQT";
        DefaultConstant = "01";
        SType = "Selection";
        Label = "Income Mode";
    }

    INOUT MIR-IA-INCM-STRT-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Income Date";
    }

    INOUT MIR-IA-INT-1-RT-DY-DUR
    {
        Length = "3";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Rate - Days";
    }

    INOUT MIR-IA-INT-1-RT-MO-DUR
    {
        Length = "3";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Rate - Months";
    }

    INOUT MIR-IA-INT-LEGAL-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Statutory Scale";
    }

    INOUT MIR-IA-INT-PREM-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Premium Scale";
    }

    INOUT MIR-IA-INT-RT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PIRTS";
        DBTableName = "TQT";
        SType = "Selection";
        Label = "Annual Interest Code";
    }

    INOUT MIR-IA-INT-TAX-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Interest Tax Scale";
    }

    INOUT MIR-IA-MORT-LEGAL-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Mortality Statutory Scale";
    }

    INOUT MIR-IA-MORT-PREM-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Mortality Premium Scale";
    }

    INOUT MIR-IA-MORT-TAX-ID
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Mortality Tax Scale";
    }

    INOUT MIR-IA-MORT-UVAL-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PUVAL";
        DBTableName = "TQT";
        SType = "Selection";
        Label = "Annuity Mortality Code";
    }

    INOUT MIR-IA-PNSN-QUALF-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        DBTableName = "TQT";
        DefaultConstant = "N";
        SType = "Selection";
        Label = "Pension Qualifier";
    }

    INOUT MIR-IA-PREM-PMT-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Premium Payment Date";
    }

    INOUT MIR-IA-QUOT-AGT-NM-TXT
    {
        Mandatory;
        Length = "20";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Agent Name";
    }

    INOUT MIR-IA-QUOT-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-BNFT-CD";
        DBTableName = "TQT";
        SType = "Selection";
        Label = "Beneficiary";
    }

    INOUT MIR-IA-QUOT-CO-NM-TXT
    {
        Length = "20";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Company of Quote";
    }

    INOUT MIR-IA-QUOT-EFF-DT
    {
        Length = "10";
        DBTableName = "TQT";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date of Quote";
    }

    INOUT MIR-IA-QUOT-EFF-TIME
    {
        Length = "8";
        DBTableName = "TQT";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Effective Time of Quote";
    }

    INOUT MIR-IA-QUOT-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-FND-SRC-CD";
        DBTableName = "TQT";
        DefaultConstant = "N";
        SType = "Selection";
        Label = "Fund Source";
    }

    INOUT MIR-IA-QUOT-GUAR-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TQT";
        DefaultConstant = "0";
        SType = "Number";
        Label = "Age Income Guaranteed Paid";
    }

    INOUT MIR-IA-QUOT-INCM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Ultimate Periodic Income";
    }

    INOUT MIR-IA-QUOT-INT-1-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Interest Rate (1)";
    }

    INOUT MIR-IA-QUOT-INT-2-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Interest Rate (2)";
    }

    INOUT MIR-IA-QUOT-JNT-PMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-JNT-PMT-CD";
        DBTableName = "TQT";
        DefaultConstant = "N";
        SType = "Selection";
        Label = "Joint Payment Type";
    }

    INOUT MIR-IA-QUOT-PFEE-AMT
    {
        Length = "11";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Policy Fee Amount";
    }

    INOUT MIR-IA-QUOT-REF-TXT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Client Quote Number";
    }

    INOUT MIR-IA-QUOT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-STAT-CD";
        DBTableName = "TQT";
        DefaultConstant = "P";
        SType = "Selection";
        Label = "Quote Status";
    }

    INOUT MIR-IA-QUOT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-TYP-CD";
        DBTableName = "TQT";
        DefaultConstant = "J";
        SType = "Selection";
        Label = "Annuity Type";
    }

    INOUT MIR-IA-QUOT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Expiry Date of Quote";
    }

    INOUT MIR-PLAN-ID
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TQT";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "TQT";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-IA-TAX-EXCL-PCT
    {
        Length = "4";
        Decimals = "1";
        DBTableName = "TQT";
        SType = "Percent";
        Label = "Tax Exclusion Ratio";
    }

    INOUT MIR-IA-TAXBL-INCM-AMT
    {
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Taxable Income";
    }

    OUT MIR-IA-GUAR-TRM-FCT
    {
        Length = "9";
        Decimals = "5";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Term Certain Factor";
    }

    OUT MIR-IA-QUOT-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TQT";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Country";
    }

    OUT MIR-IA-QUOT-DEFR-FCT
    {
        Length = "9";
        Decimals = "5";
        DBTableName = "TQT";
        DefaultConstant = "1";
        SType = "Number";
        Label = "Deferral Factor";
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

    OUT MIR-IA-QUOT-NUM
    {
        Length = "6";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Quote Number";
    }

    OUT MIR-IA-QUOT-TOT-FCT
    {
        Length = "9";
        Decimals = "5";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Total Annuity Factor";
    }

    OUT MIR-IA-TOT-COMM-AMT
    {
        Length = "13";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Total Commission Payable";
    }

}

