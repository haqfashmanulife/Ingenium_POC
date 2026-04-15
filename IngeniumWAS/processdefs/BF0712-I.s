# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0712-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0712-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-IA-QUOT-AGT-NM-TXT";
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

    INOUT MIR-ANUTNT-1-BTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "First Annuitant - Birth Date";
    }

    INOUT MIR-ANUTNT-1-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        SType = "Selection";
        Label = "First Annuitant - Sex";
    }

    INOUT MIR-ANUTNT-2-BTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Second Annuitant - Birth Date";
    }

    INOUT MIR-ANUTNT-2-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        SType = "Selection";
        Label = "Second Annuitant - Sex";
    }

    INOUT MIR-DV-PRT-RQST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-PG-RQST-IND";
        DefaultConstant = "N";
        SType = "Selection";
        Label = "Printout Type";
    }

    INOUT MIR-IA-ANUTNT-DTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Effective Date of Death";
    }

    INOUT MIR-IA-BTH-DT-USE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-BTH-DT-USE-CD";
        SType = "Selection";
        Label = "Birth Date of Annuitant Used";
    }

    INOUT MIR-IA-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-CALC-TYP-CD";
        SType = "Selection";
        Label = "Calculation Base";
    }

    INOUT MIR-IA-COMM-BAND-1-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Commission Amount (1)";
    }

    INOUT MIR-IA-COMM-BAND-1-PCT
    {
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Commission Rate (1)";
    }

    INOUT MIR-IA-COMM-BAND-2-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Commission Amount (2)";
    }

    INOUT MIR-IA-COMM-BAND-2-PCT
    {
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Commission Rate (2)";
    }

    INOUT MIR-IA-COMM-BAND-3-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Commission Amount (3)";
    }

    INOUT MIR-IA-COMM-BAND-3-PCT
    {
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Commission Rate (3)";
    }

    INOUT MIR-IA-COMM-MAX-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Maximum Commission Payable";
    }

    INOUT MIR-IA-DTH-INCM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Death Amount";
    }

    INOUT MIR-IA-FED-TAXWH-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Tax Withholding Amount";
    }

    INOUT MIR-IA-GRS-SPREM-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Gross Single Premium";
    }

    INOUT MIR-IA-GUAR-MO-DUR
    {
        Length = "2";
        SType = "Text";
        Label = "Number of Months";
    }

    INOUT MIR-IA-GUAR-TRM-FCT
    {
        Length = "9";
        Decimals = "5";
        SType = "Number";
        Label = "Term Certain Factor";
    }

    INOUT MIR-IA-GUAR-YR-DUR
    {
        Length = "2";
        SType = "Text";
        Label = "Number of Years";
    }

    INOUT MIR-IA-INCM-1-ADJ-FCT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        SType = "Number";
        Label = "Income Adjustment Factor 1 - Death of First Annuitant";
    }

    INOUT MIR-IA-INCM-2-ADJ-FCT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        SType = "Number";
        Label = "Income Adjustment Factor 2 - Death of Second Annuitant";
    }

    INOUT MIR-IA-INCM-ADJ-AMT
    {
        Signed;
        Length = "12";
        SType = "Currency";
        Label = "Income Adjustment Amount";
    }

    INOUT MIR-IA-INCM-ADJ-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Income Adjustment Date";
    }

    INOUT MIR-IA-INCM-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "IA-INCM-MODE-CD";
        SType = "Selection";
        Label = "Income Mode";
    }

    INOUT MIR-IA-INCM-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Income Date";
    }

    INOUT MIR-IA-INT-1-RT-DY-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Interest Rate - Days";
    }

    INOUT MIR-IA-INT-1-RT-MO-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Interest Rate - Months";
    }

    INOUT MIR-IA-INT-LEGAL-ID
    {
        Length = "1";
        SType = "Text";
        Label = "Interest Statutory Scale";
    }

    INOUT MIR-IA-INT-PREM-ID
    {
        Length = "1";
        SType = "Text";
        Label = "Interest Premium Scale";
    }

    INOUT MIR-IA-INT-RT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PIRTS";
        SType = "Selection";
        Label = "Annual Interest Code";
    }

    INOUT MIR-IA-INT-TAX-ID
    {
        Length = "1";
        SType = "Text";
        Label = "Interest Tax Scale";
    }

    INOUT MIR-IA-MORT-LEGAL-ID
    {
        Length = "1";
        SType = "Text";
        Label = "Mortality Statutory Scale";
    }

    INOUT MIR-IA-MORT-PREM-ID
    {
        Length = "1";
        SType = "Text";
        Label = "Mortality Premium Scale";
    }

    INOUT MIR-IA-MORT-TAX-ID
    {
        Length = "1";
        SType = "Text";
        Label = "Mortality Tax Scale";
    }

    INOUT MIR-IA-MORT-UVAL-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PUVAL";
        SType = "Selection";
        Label = "Annuity Mortality Code";
    }

    INOUT MIR-IA-PNSN-QUALF-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        SType = "Selection";
        Label = "Pension Qualifier";
    }

    INOUT MIR-IA-PREM-PMT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Premium Payment Date";
    }

    INOUT MIR-IA-QUOT-AGT-NM-TXT
    {
        Length = "20";
        SType = "Text";
        Label = "Agent Name";
    }

    INOUT MIR-IA-QUOT-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-BNFT-CD";
        SType = "Selection";
        Label = "Beneficiary";
    }

    INOUT MIR-IA-QUOT-CO-NM-TXT
    {
        Length = "20";
        SType = "Text";
        Label = "Company of Quote";
    }

    INOUT MIR-IA-QUOT-DEFR-FCT
    {
        Length = "9";
        Decimals = "5";
        SType = "Number";
        Label = "Deferral Factor";
    }

    INOUT MIR-IA-QUOT-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Effective Date of Quote";
    }

    INOUT MIR-IA-QUOT-EFF-TIME
    {
        Length = "8";
        SType = "Time";
        Label = "Effective Time of Quote";
    }

    INOUT MIR-IA-QUOT-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-FND-SRC-CD";
        SType = "Selection";
        Label = "Fund Source";
    }

    INOUT MIR-IA-QUOT-GUAR-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age Income Guaranteed Paid";
    }

    INOUT MIR-IA-QUOT-INCM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Ultimate Periodic Income";
    }

    INOUT MIR-IA-QUOT-INT-1-PCT
    {
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate (1)";
    }

    INOUT MIR-IA-QUOT-INT-2-PCT
    {
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate (2)";
    }

    INOUT MIR-IA-QUOT-JNT-DTH-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-JNT-DTH-CD";
        SType = "Selection";
        Label = "Joint Death Status";
    }

    INOUT MIR-IA-QUOT-JNT-PMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-JNT-PMT-CD";
        SType = "Selection";
        Label = "Joint Payment Type";
    }

    INOUT MIR-IA-QUOT-LIFE-FCT
    {
        Length = "9";
        Decimals = "5";
        SType = "Number";
        Label = "Life Factor";
    }

    INOUT MIR-IA-QUOT-NPREM-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Net Premium Amount";
    }

    INOUT MIR-IA-QUOT-PFEE-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Policy Fee Amount";
    }

    INOUT MIR-IA-QUOT-REF-TXT
    {
        Length = "10";
        SType = "Text";
        Label = "Client Quote Number";
    }

    INOUT MIR-IA-QUOT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-STAT-CD";
        SType = "Selection";
        Label = "Quote Status";
    }

    INOUT MIR-IA-QUOT-TOT-FCT
    {
        Length = "9";
        Decimals = "5";
        SType = "Number";
        Label = "Total Annuity Factor";
    }

    INOUT MIR-IA-QUOT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-TYP-CD";
        SType = "Selection";
        Label = "Annuity Type";
    }

    INOUT MIR-IA-QUOT-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Expiry Date of Quote";
    }

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-PREV-QUOT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREV-QUOT-STAT-CD";
        SType = "Selection";
        Label = "Old Quote Status";
    }

    INOUT MIR-QUOT-STAT-CHNG-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Status Changed Date";
    }

    INOUT MIR-REPL-IA-QUOT-NUM
    {
        Length = "6";
        SType = "Text";
        Label = "Replaced / Replacing Quote Number";
    }

    INOUT MIR-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-DV-BTH-JP-DT-YR-TXT
    {
        Length = "2";
        SType = "Text";
        Label = "First Annuitant Birth Year in Emperor Format";
    }

    INOUT MIR-DV-BTH-JP-DT-MO-TXT
    {
        Length = "2";
        SType = "Text";
        Label = "First Annuitant Birth Month in Emperor Format";
    }

    INOUT MIR-DV-BTH-JP-DT-DY-TXT
    {
        Length = "2";
        SType = "Text";
        Label = "First Annuitant Birth Day in Emperor Format";
    }

    INOUT MIR-DV-BTH-JP-DT-EMPRR-NM
    {
        Length = "10";
        SType = "Text";
        Label = "First Annuitant Birth Date Emperor Name";
    }

    INOUT MIR-DV-BTH-JP-DT-YR-TXT-2
    {
        Length = "2";
        SType = "Text";
        Label = "Second Annuitant Birth Year in Emperor Format";
    }

    INOUT MIR-DV-BTH-JP-DT-MO-TXT-2
    {
        Length = "2";
        SType = "Text";
        Label = "Second Annuitant Birth Month in Emperor Format";
    }

    INOUT MIR-DV-BTH-JP-DT-DY-TXT-2
    {
        Length = "2";
        SType = "Text";
        Label = "Second Annuitant Birth Day in Emperor Format";
    }

    INOUT MIR-DV-BTH-JP-DT-EMPRR-NM-2
    {
        Length = "10";
        SType = "Text";
        Label = "Second Annuitant Birth Date Emperor Name";
    }

    INOUT MIR-IA-TAXBL-INCM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Taxable Income";
    }

    INOUT MIR-IA-TAX-EXCL-PCT
    {
        Length = "4";
        Decimals = "1";
        SType = "Percent";
        Label = "Tax Exclusion Ratio";
    }

    IN MIR-IA-QUOT-NUM
    {
        Key;
        DisplayOnly;
        Length = "6";
        DefaultSession = "MIR-IA-QUOT-NUM";
        SType = "Text";
        Label = "Quote Number";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-CVG-ORIG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ORIG";
        SType = "Text";
        Label = "Origin of Funds";
    }

    IN MIR-IA-QUOT-CTRY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
    }

    INOUT MIR-IA-TOT-COMM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Total Commission Payable";
    }

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-STAT-CHNG-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Change Operator Initials";
    }

}

