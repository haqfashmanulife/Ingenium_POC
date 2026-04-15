# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0722-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0722-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0722";
        BusinessFunctionName = "Universal Life History";
        BusinessFunctionType = "Update";
        MirName = "CCWM0871";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-AD-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "AD Premium Charges";
    }

    INOUT MIR-CVG-BNFT-CHRG-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Supplementary Benefit Charges";
    }

    INOUT MIR-CVG-CV-ALLOC-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Cash Value Apportioned";
    }

    INOUT MIR-CVG-GUAR-COI-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Guaranteed Cost of Insurance";
    }

    INOUT MIR-CVG-PERI-LOAD-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Periodic Load Charge";
    }

    INOUT MIR-CVG-SETUP-CHRG-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Issue Charges";
    }

    INOUT MIR-CVG-SUM-INS-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    INOUT MIR-CVG-TOT-DED-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Total Deduction";
    }

    INOUT MIR-CVG-WP-PREM-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "WP Charges";
    }

    INOUT MIR-MTHV-CVG-CORDR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Corridor Amount";
    }

    INOUT MIR-MTHV-CVG-CSTAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TUHCO";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-MTHV-CVG-CV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Fund Value";
    }

    INOUT MIR-MTHV-CVG-DRW-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Total Amounts Drawn";
    }

    INOUT MIR-MTHV-CVG-NAR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Net Amount at Risk";
    }

    INOUT MIR-MTHV-ORIG-PRCES-DT
    {
        Length = "9";
        DBTableName = "TUH";
        SType = "Date";
        Label = "Original Date";
    }

    INOUT MIR-MTHV-POL-CSV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Cash Surrender Value";
    }

    INOUT MIR-MTHV-POL-CV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Accumulated Value";
    }

    INOUT MIR-MTHV-POL-DB-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MTHV-POL-DB-OPT-CD";
        DBTableName = "TUH";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    INOUT MIR-MTHV-POL-SHRT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Shortage Amount";
    }

    INOUT MIR-MTHV-PRCES-DT
    {
        Length = "10";
        DBTableName = "TUH";
        SType = "Date";
        Label = "Transaction Date";
    }

    INOUT MIR-MTHV-PRCES-QTY
    {
        Length = "3";
        DBTableName = "TUH";
        SType = "Text";
        Label = "Number of Times Processing Done";
    }

    INOUT MIR-POL-ADJ-CV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Adjusted Value";
    }

    INOUT MIR-POL-DED-WAV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Deductions Waived";
    }

    INOUT MIR-POL-GDLN-DB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Guideline Death Benefit";
    }

    INOUT MIR-POL-SUM-INS-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Sum Insured";
    }

    INOUT MIR-POL-TOT-DED-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Deductions";
    }

    INOUT MIR-SSTD-MORT-CHRG-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Substandard Mortality Charge";
    }

    INOUT MIR-STD-MORT-CHRG-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Mortality Charge";
    }

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

}

