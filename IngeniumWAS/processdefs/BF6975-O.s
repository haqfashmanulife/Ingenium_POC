# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6975-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Change MIR-CVG-NUM to control display of more than 20 cvgs*
#*                   Focusfield is the more button...                          *
#*                                                                             *
#*******************************************************************************

S-STEP BF6975-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Ulhist";
        Type = "Output";
        DelEmptyRows;
        FocusField = "moreButton";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

#01AD25 - Allow changes to the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-CVG-AD-PREM-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "AD Premium Charges";
        Index = "1";
    }

    IN MIR-CVG-BNFT-CHRG-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Supplementary Benefit Charges";
        Index = "1";
    }

    IN MIR-CVG-CV-ALLOC-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Cash Value Apportioned";
        Index = "1";
    }

    IN MIR-CVG-GUAR-COI-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Guaranteed Cost of Insurance";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-PERI-LOAD-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Periodic Load Charge";
        Index = "1";
    }

    IN MIR-CVG-SETUP-CHRG-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Issue Charges";
        Index = "1";
    }

    IN MIR-CVG-SUM-INS-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    IN MIR-CVG-TOT-DED-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Total Deduction";
        Index = "1";
    }

    IN MIR-CVG-WP-PREM-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "WP Charges";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-MTHV-CVG-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-MTHV-CVG-CV-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Fund Value";
        Index = "1";
    }

    IN MIR-MTHV-CVG-DRW-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Total Amounts Drawn";
        Index = "1";
    }

    IN MIR-MTHV-CVG-LOAD-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Monthiversary Load Amount";
        Index = "1";
    }

    IN MIR-MTHV-CVG-NAR-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Net Amount at Risk";
        Index = "1";
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
        Length = "10";
        SType = "Date";
        Label = "Original Date";
    }

    IN MIR-MTHV-POL-CSV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Cash Surrender Value";
    }

    IN MIR-MTHV-POL-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Accumulated Value";
    }

    IN MIR-MTHV-POL-DB-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "MTHV-POL-DB-OPT-CD";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    IN MIR-MTHV-POL-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
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
        Length = "4";
        SType = "Text";
        Label = "Number of Times Processing Done";
    }

    IN MIR-POL-ADJ-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Adjusted Value";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-DED-WAV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Deductions Waived";
    }

    IN MIR-POL-GDLN-DB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Guideline Death Benefit";
    }

    IN MIR-POL-SUM-INS-AMT
    {
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Total Sum Insured";
    }

    IN MIR-POL-TOT-DED-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Deductions";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-SE-XSLD-RETRN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Excess Sales Load Returned";
    }

    IN MIR-SSTD-MORT-CHRG-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Substandard Mortality Charge";
        Index = "1";
    }

    IN MIR-STD-MORT-CHRG-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Mortality Charge";
        Index = "1";
    }

}

