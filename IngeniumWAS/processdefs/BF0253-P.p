# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0253-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0253-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0253";
        BusinessFunctionName = "Policy Values Projections Calculate";
        BusinessFunctionType = "Calculate";
        MirName = "CCWM0196";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-GUAR-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Interest Guaranteed Period - Interest Rate";
    }

    INOUT MIR-DV-LMPSM-AMT
    {
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Lump Sum Amount Added";
    }

    INOUT MIR-INIT-DPOS-INT-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate for Initial Deposit";
    }

    INOUT MIR-PLAN-PERI-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Planned Premium";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Premium Mode";
    }

    INOUT MIR-POL-DB-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    INOUT MIR-POL-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TPOL";
        SType = "Hidden";
        Label = "Type of Insurance of the Base Coverage";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    INOUT MIR-UL-INIT-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Intended Initial Premium";
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

    OUT MIR-DV-CLI-AGE-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Age";
        Index = "1";
    }

    OUT MIR-DV-CRNT-FNDVL-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Cash Value";
        Index = "1";
    }

    OUT MIR-DV-CRNT-PREM-XPRY-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Expiry Date of Current Premium";
    }

    OUT MIR-DV-CRNT-SURR-VALU-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Surrender Value";
        Index = "1";
    }

    OUT MIR-DV-CRNT-XPRY-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Expiry Date of No Further Current Premium";
    }

    OUT MIR-DV-GUAR-FNDVL-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Guaranteed Cash Value";
        Index = "1";
    }

    OUT MIR-DV-GUAR-PREM-XPRY-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Expiry Date of Guaranteed Premium";
    }

    OUT MIR-DV-GUAR-SURR-VALU-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Guaranteed Surrender Value";
        Index = "1";
    }

    OUT MIR-DV-GUAR-XPRY-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Expiry Date of No Further Guaranteed Premium";
    }

    OUT MIR-DV-POL-CRNT-DB-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Death Benefit";
        Index = "1";
    }

    OUT MIR-DV-POL-GUAR-DB-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Guaranteed Death Benefit";
        Index = "1";
    }

    OUT MIR-DV-POL-TRADL-APREM-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Traditional Annual Premium";
        Index = "1";
    }

    OUT MIR-DV-POL-TRADL-CV-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Traditional Cash Value";
        Index = "1";
    }

    OUT MIR-DV-POL-YR-CTR-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policy Year Counter";
        Index = "1";
    }

}

