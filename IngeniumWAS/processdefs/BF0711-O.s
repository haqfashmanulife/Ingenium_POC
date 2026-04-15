# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0711-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0711-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Create";
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

    IN MIR-ANUTNT-1-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "First Annuitant - Birth Date";
    }

    IN MIR-ANUTNT-1-SEX-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        SType = "Text";
        Label = "First Annuitant - Sex";
    }

    IN MIR-ANUTNT-2-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Second Annuitant - Birth Date";
    }

    IN MIR-ANUTNT-2-SEX-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        SType = "Text";
        Label = "Second Annuitant - Sex";
    }

    IN MIR-DV-FILE-RQST-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Quote Save Indicator";
    }

    IN MIR-IA-BTH-DT-USE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-BTH-DT-USE-CD";
        DefaultConstant = "1";
        SType = "Text";
        Label = "Birth Date of Annuitant Used";
    }

    IN MIR-IA-CALC-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-CALC-TYP-CD";
        SType = "Text";
        Label = "Calculation Base";
    }

    IN MIR-IA-COMM-BAND-1-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Commission Amount (1)";
    }

    IN MIR-IA-COMM-BAND-1-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Commission Rate (1)";
    }

    IN MIR-IA-COMM-BAND-2-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Commission Amount (2)";
    }

    IN MIR-IA-COMM-BAND-2-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Commission Rate (2)";
    }

    IN MIR-IA-COMM-BAND-3-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Commission Amount (3)";
    }

    IN MIR-IA-COMM-BAND-3-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Commission Rate (3)";
    }

    IN MIR-IA-COMM-MAX-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Maximum Commission Payable";
    }

    IN MIR-IA-FED-TAXWH-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Tax Withholding Amount";
    }

    IN MIR-IA-GRS-SPREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Gross Single Premium";
    }

    IN MIR-IA-GUAR-MO-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Months";
    }

    IN MIR-IA-GUAR-YR-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Years";
    }

    IN MIR-IA-INCM-1-ADJ-FCT
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "4";
        DefaultConstant = "1";
        SType = "Number";
        Label = "Income Adjustment Factor 1 - Death of First Annuitant";
    }

    IN MIR-IA-INCM-2-ADJ-FCT
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "4";
        DefaultConstant = "1";
        SType = "Number";
        Label = "Income Adjustment Factor 2 - Death of Second Annuitant";
    }

    IN MIR-IA-INCM-ADJ-AMT
    {
        DisplayOnly;
        Signed;
        Length = "12";
        SType = "Currency";
        Label = "Income Adjustment Amount";
    }

    IN MIR-IA-INCM-ADJ-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Income Adjustment Date";
    }

    IN MIR-IA-INCM-MODE-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "IA-INCM-MODE-CD";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Income Mode";
    }

    IN MIR-IA-INCM-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Income Date";
    }

    IN MIR-IA-INT-1-RT-DY-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Interest Rate - Days";
    }

    IN MIR-IA-INT-1-RT-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Interest Rate - Months";
    }

    IN MIR-IA-INT-LEGAL-ID
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest Statutory Scale";
    }

    IN MIR-IA-INT-PREM-ID
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest Premium Scale";
    }

    IN MIR-IA-INT-RT-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PIRTS";
        SType = "Text";
        Label = "Annual Interest Code";
    }

    IN MIR-IA-INT-TAX-ID
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Interest Tax Scale";
    }

    IN MIR-IA-MORT-LEGAL-ID
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Mortality Statutory Scale";
    }

    IN MIR-IA-MORT-PREM-ID
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Mortality Premium Scale";
    }

    IN MIR-IA-MORT-TAX-ID
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Mortality Tax Scale";
    }

    IN MIR-IA-MORT-UVAL-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PUVAL";
        SType = "Text";
        Label = "Annuity Mortality Code";
    }

    IN MIR-IA-PNSN-QUALF-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        DefaultConstant = "N";
        SType = "Text";
        Label = "Pension Qualifier";
    }

    IN MIR-IA-PREM-PMT-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Premium Payment Date";
    }

    IN MIR-IA-QUOT-AGT-NM-TXT
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Agent Name";
    }

    IN MIR-IA-QUOT-BNFT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-BNFT-CD";
        SType = "Text";
        Label = "Beneficiary";
    }

    IN MIR-IA-QUOT-CO-NM-TXT
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Company of Quote";
    }

    IN MIR-IA-QUOT-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date of Quote";
    }

    IN MIR-IA-QUOT-EFF-TIME
    {
        DisplayOnly;
        Length = "8";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Effective Time of Quote";
    }

    IN MIR-IA-QUOT-FND-SRC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-FND-SRC-CD";
        DefaultConstant = "N";
        SType = "Text";
        Label = "Fund Source";
    }

    IN MIR-IA-QUOT-GUAR-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        DefaultConstant = "0";
        SType = "Number";
        Label = "Age Income Guaranteed Paid";
    }

    IN MIR-IA-QUOT-INCM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Ultimate Periodic Income";
    }

    IN MIR-IA-QUOT-INT-1-PCT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate (1)";
    }

    IN MIR-IA-QUOT-INT-2-PCT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate (2)";
    }

    IN MIR-IA-QUOT-JNT-PMT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-JNT-PMT-CD";
        DefaultConstant = "N";
        SType = "Text";
        Label = "Joint Payment Type";
    }

    IN MIR-IA-QUOT-PFEE-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Policy Fee Amount";
    }

    IN MIR-IA-QUOT-REF-TXT
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Quote Number";
    }

    IN MIR-IA-QUOT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-STAT-CD";
        DefaultConstant = "P";
        SType = "Text";
        Label = "Quote Status";
    }

    IN MIR-IA-QUOT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-TYP-CD";
        DefaultConstant = "J";
        SType = "Text";
        Label = "Annuity Type";
    }

    IN MIR-IA-QUOT-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Expiry Date of Quote";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-USER-ID
    {
        DisplayOnly;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-DV-BTH-JP-DT-YR-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "First Annuitant Birth Year in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-MO-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "First Annuitant Birth Month in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-DY-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "First Annuitant Birth Day in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-EMPRR-NM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "First Annuitant Birth Date Emperor Name";
    }

    IN MIR-DV-BTH-JP-DT-YR-TXT-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Second Annuitant Birth Year in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-MO-TXT-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Second Annuitant Birth Month in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-DY-TXT-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Second Annuitant Birth Day in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-EMPRR-NM-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Second Annuitant Birth Date Emperor Name";
    }

    IN MIR-IA-TAX-EXCL-PCT
    {
        DisplayOnly;
        Length = "4";
        Decimals = "1";
        SType = "Percent";
        Label = "Tax Exclusion Ratio";
    }

    IN MIR-IA-TAXBL-INCM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Taxable Income";
    }

    IN MIR-IA-GUAR-TRM-FCT
    {
        DisplayOnly;
        Length = "9";
        Decimals = "5";
        SType = "Number";
        Label = "Term Certain Factor";
    }

    IN MIR-IA-QUOT-CTRY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Country";
    }

    IN MIR-IA-QUOT-DEFR-FCT
    {
        DisplayOnly;
        Length = "9";
        Decimals = "5";
        DefaultConstant = "1";
        SType = "Number";
        Label = "Deferral Factor";
    }

    IN MIR-IA-QUOT-LIFE-FCT
    {
        DisplayOnly;
        Length = "9";
        Decimals = "5";
        SType = "Number";
        Label = "Life Factor";
    }

    IN MIR-IA-QUOT-NPREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Net Premium Amount";
    }

    IN MIR-IA-QUOT-NUM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Quote Number";
    }

    IN MIR-IA-QUOT-TOT-FCT
    {
        DisplayOnly;
        Length = "9";
        Decimals = "5";
        SType = "Number";
        Label = "Total Annuity Factor";
    }

    IN MIR-IA-TOT-COMM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Total Commission Payable";
    }

}

