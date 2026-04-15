# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6975-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Change MIR-CVG-NUM to control display of more than 20 cvgs*
#*                                                                             *
#*******************************************************************************

P-STEP BF6975-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6975";
        BusinessFunctionName = "Policy Inquiry - Universal Life History";
        BusinessFunctionType = "Ulhist";
        MirName = "CCWM6975";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

#01AD25 - Add in the coverage number
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
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CVG-AD-PREM-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "AD Premium Charges";
        Index = "1";
    }

    OUT MIR-CVG-BNFT-CHRG-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Supplementary Benefit Charges";
        Index = "1";
    }

    OUT MIR-CVG-CV-ALLOC-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Cash Value Apportioned";
        Index = "1";
    }

    OUT MIR-CVG-GUAR-COI-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Guaranteed Cost of Insurance";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-PERI-LOAD-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Periodic Load Charge";
        Index = "1";
    }

    OUT MIR-CVG-SETUP-CHRG-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Issue Charges";
        Index = "1";
    }

    OUT MIR-CVG-SUM-INS-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    OUT MIR-CVG-TOT-DED-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Total Deduction";
        Index = "1";
    }

    OUT MIR-CVG-WP-PREM-AMT-T[20]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "WP Charges";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-MTHV-CVG-CSTAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TUHCO";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-MTHV-CVG-CV-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Fund Value";
        Index = "1";
    }

    OUT MIR-MTHV-CVG-DRW-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Total Amounts Drawn";
        Index = "1";
    }

    OUT MIR-MTHV-CVG-LOAD-AMT-T[20]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Monthiversary Load Amount";
        Index = "1";
    }

    OUT MIR-MTHV-CVG-NAR-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Net Amount at Risk";
        Index = "1";
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
        Length = "10";
        DBTableName = "TUH";
        SType = "Date";
        Label = "Original Date";
    }

    OUT MIR-MTHV-POL-CSV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Cash Surrender Value";
    }

    OUT MIR-MTHV-POL-CV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Accumulated Value";
    }

    OUT MIR-MTHV-POL-DB-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "MTHV-POL-DB-OPT-CD";
        DBTableName = "TUH";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    OUT MIR-MTHV-POL-SHRT-AMT
    {
        Signed;
        Length = "17";
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
        Length = "4";
        DBTableName = "TUH";
        SType = "Text";
        Label = "Number of Times Processing Done";
    }

    OUT MIR-POL-ADJ-CV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Adjusted Value";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-DED-WAV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Deductions Waived";
    }

    OUT MIR-POL-GDLN-DB-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Guideline Death Benefit";
    }

    OUT MIR-POL-SUM-INS-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Sum Insured";
    }

    OUT MIR-POL-TOT-DED-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Total Deductions";
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

    OUT MIR-SE-XSLD-RETRN-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "TUH";
        SType = "Currency";
        Label = "Excess Sales Load Returned";
    }

    OUT MIR-SSTD-MORT-CHRG-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Substandard Mortality Charge";
        Index = "1";
    }

    OUT MIR-STD-MORT-CHRG-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TUHCO";
        SType = "Currency";
        Label = "Mortality Charge";
        Index = "1";
    }

}

