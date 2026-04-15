# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0720-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MP0010  PM       Add two fields - Cnvr P Amt and Non Renewal Cnvr P Amt    *                         *
#*                                                                             *
#*******************************************************************************

S-STEP BF0720-O
{
    ATTRIBUTES
    {
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

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-MTHV-EFF-DT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Text";
        Label = "Monthiversary Processing Date";
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

    IN MIR-CVG-AD-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "AD Premium Charges";
    }

    IN MIR-CVG-BNFT-CHRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Supplementary Benefit Charges";
    }

    IN MIR-CVG-CV-ALLOC-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Value Apportioned";
    }

    IN MIR-CVG-GUAR-COI-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Guaranteed Cost of Insurance";
    }

    IN MIR-CVG-PERI-LOAD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Periodic Load Charge";
    }

    IN MIR-CVG-SETUP-CHRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Issue Charges";
    }

    IN MIR-CVG-SUM-INS-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    IN MIR-CVG-TOT-DED-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Deduction";
    }

    IN MIR-CVG-WP-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "WP Charges";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-MTHV-CVG-CORDR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Corridor Amount";
    }

    IN MIR-MTHV-CVG-CSTAT-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-MTHV-CVG-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Fund Value";
    }

    IN MIR-MTHV-CVG-DRW-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Amounts Drawn";
    }

    IN MIR-MTHV-CVG-NAR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Amount at Risk";
    }

    IN MIR-MTHV-FND-SELCT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "MTHV-FND-SELCT-CD";
        SType = "Text";
        Label = "Monthiversary Deduction Allocation Method";
    }

    IN MIR-MTHV-ORIG-PRCES-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Original Date";
    }

    IN MIR-MTHV-POL-CSV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Cash Surrender Value";
    }

    IN MIR-MTHV-POL-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Accumulated Value";
    }

    IN MIR-MTHV-POL-DB-OPT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MTHV-POL-DB-OPT-CD";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    IN MIR-MTHV-POL-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Shortage Amount";
    }

    IN MIR-MTHV-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Transaction Date";
    }

    IN MIR-MTHV-PRCES-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Number of Times Processing Done";
    }

    IN MIR-POL-ADJ-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Value";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-DED-WAV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Deductions Waived";
    }

    IN MIR-POL-GDLN-DB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Guideline Death Benefit";
    }

    IN MIR-POL-SUM-INS-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Sum Insured";
    }

    IN MIR-POL-TOT-DED-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Deductions";
    }

    IN MIR-SSTD-MORT-CHRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Substandard Mortality Charge";
    }

    IN MIR-STD-MORT-CHRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Mortality Charge";
    }

    IN MIR-CNVR-P-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Conversion P Amount";
    }

    IN MIR-NO-RENW-CNVR-P-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Non Renewal Conversion P Amount";
    }

}

