# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0720-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MP0010  PM       Add two fields - Cnvr P Amt and Non Renewal Cnvr P Amt    *                          *
#*                                                                             *
#*******************************************************************************

P-STEP BF0720-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0720";
        BusinessFunctionName = "Universal Life History";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0871";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TUHCO";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-MTHV-EFF-DT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TUH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Text";
        Label = "Monthiversary Processing Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TUH";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TUH";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CVG-AD-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "AD Premium Charges";
    }

    OUT MIR-CVG-BNFT-CHRG-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Supplementary Benefit Charges";
    }

    OUT MIR-CVG-CV-ALLOC-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Cash Value Apportioned";
    }

    OUT MIR-CVG-GUAR-COI-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Guaranteed Cost of Insurance";
    }

    OUT MIR-CVG-PERI-LOAD-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Periodic Load Charge";
    }

    OUT MIR-CVG-SETUP-CHRG-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Issue Charges";
    }

    OUT MIR-CVG-SUM-INS-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    OUT MIR-CVG-TOT-DED-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Total Deduction";
    }

    OUT MIR-CVG-WP-PREM-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "WP Charges";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-MTHV-CVG-CORDR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Corridor Amount";
    }

    OUT MIR-MTHV-CVG-CSTAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TUHCO";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-MTHV-CVG-CV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Fund Value";
    }

    OUT MIR-MTHV-CVG-DRW-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Total Amounts Drawn";
    }

    OUT MIR-MTHV-CVG-NAR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Net Amount at Risk";
    }

    OUT MIR-MTHV-FND-SELCT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "MTHV-FND-SELCT-CD";
        DBTableName = "TUH";
        SType = "Text";
        Label = "Monthiversary Deduction Allocation Method";
    }

    OUT MIR-MTHV-ORIG-PRCES-DT
    {
        Length = "9";
        DBTableName = "TUH";
        SType = "Date";
        Label = "Original Date";
    }

    OUT MIR-MTHV-POL-CSV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Cash Surrender Value";
    }

    OUT MIR-MTHV-POL-CV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Accumulated Value";
    }

    OUT MIR-MTHV-POL-DB-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MTHV-POL-DB-OPT-CD";
        DBTableName = "TUH";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    OUT MIR-MTHV-POL-SHRT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Shortage Amount";
    }

    OUT MIR-MTHV-PRCES-DT
    {
        Length = "10";
        DBTableName = "TUH";
        SType = "Date";
        Label = "Transaction Date";
    }

    OUT MIR-MTHV-PRCES-QTY
    {
        Length = "3";
        DBTableName = "TUH";
        SType = "Text";
        Label = "Number of Times Processing Done";
    }

    OUT MIR-POL-ADJ-CV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Adjusted Value";
    }

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-DED-WAV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Deductions Waived";
    }

    OUT MIR-POL-GDLN-DB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Guideline Death Benefit";
    }

    OUT MIR-POL-SUM-INS-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Sum Insured";
    }

    OUT MIR-POL-TOT-DED-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Deductions";
    }

    OUT MIR-SSTD-MORT-CHRG-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Substandard Mortality Charge";
    }

    OUT MIR-STD-MORT-CHRG-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Mortality Charge";
    }

    OUT MIR-CNVR-P-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Conversion P Amount";
    }

    OUT MIR-NO-RENW-CNVR-P-AMT 
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Non Renewal Conversion P Amount";
    }

}

