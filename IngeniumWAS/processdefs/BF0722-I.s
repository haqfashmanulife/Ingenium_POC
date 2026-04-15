# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0722-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0722-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-SUM-INS-AMT";
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

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
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

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    INOUT MIR-CVG-AD-PREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "AD Premium Charges";
    }

    INOUT MIR-CVG-BNFT-CHRG-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Supplementary Benefit Charges";
    }

    INOUT MIR-CVG-CV-ALLOC-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Value Apportioned";
    }

    INOUT MIR-CVG-GUAR-COI-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Guaranteed Cost of Insurance";
    }

    INOUT MIR-CVG-PERI-LOAD-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Periodic Load Charge";
    }

    INOUT MIR-CVG-SETUP-CHRG-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Issue Charges";
    }

    INOUT MIR-CVG-SUM-INS-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    INOUT MIR-CVG-TOT-DED-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Deduction";
    }

    INOUT MIR-CVG-WP-PREM-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "WP Charges";
    }

    INOUT MIR-MTHV-CVG-CORDR-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Corridor Amount";
    }

    INOUT MIR-MTHV-CVG-CSTAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-MTHV-CVG-CV-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-MTHV-CVG-DRW-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Amounts Drawn";
    }

    INOUT MIR-MTHV-CVG-NAR-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Amount at Risk";
    }

    INOUT MIR-MTHV-ORIG-PRCES-DT
    {
        Length = "9";
        SType = "Date";
        Label = "Original Date";
    }

    INOUT MIR-MTHV-POL-CSV-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Cash Surrender Value";
    }

    INOUT MIR-MTHV-POL-CV-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Accumulated Value";
    }

    INOUT MIR-MTHV-POL-DB-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MTHV-POL-DB-OPT-CD";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    INOUT MIR-MTHV-POL-SHRT-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Shortage Amount";
    }

    INOUT MIR-MTHV-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Transaction Date";
    }

    INOUT MIR-MTHV-PRCES-QTY
    {
        Length = "3";
        SType = "Text";
        Label = "Number of Times Processing Done";
    }

    INOUT MIR-POL-ADJ-CV-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Value";
    }

    INOUT MIR-POL-DED-WAV-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Deductions Waived";
    }

    INOUT MIR-POL-GDLN-DB-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Guideline Death Benefit";
    }

    INOUT MIR-POL-SUM-INS-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Sum Insured";
    }

    INOUT MIR-POL-TOT-DED-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Deductions";
    }

    INOUT MIR-SSTD-MORT-CHRG-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Substandard Mortality Charge";
    }

    INOUT MIR-STD-MORT-CHRG-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Mortality Charge";
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

}

