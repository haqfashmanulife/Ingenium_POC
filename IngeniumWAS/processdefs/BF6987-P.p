# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF6987-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF6987-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6987";
        BusinessFunctionName = "Policy Inquiry - Special Deposit Values";
        BusinessFunctionType = "Valusdp";
        MirName = "CCWM6987";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-PRCES-DT
    {
        Length = "10";
        DBTableName = "Drieved";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-CF-EFF-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CF-SEQ-NUM
    {
        Mandatory;
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
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

    OUT MIR-CF-CLI-TRXN-AMT-T[100]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table100";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    OUT MIR-CF-EFF-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-CF-FND-BAL-AMT-T[100]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table100";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Current Amount";
        Index = "1";
    }

    OUT MIR-CF-FND-TRXN-AMT-T[100]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table100";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Net Deposit Amount";
        Index = "1";
    }

    OUT MIR-CF-INT-PCT-T[100]
    {
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table100";
        DBTableName = "TCFLW";
        SType = "Percent";
        Label = "Interest Rate / Unit Cost";
        Index = "1";
    }

    OUT MIR-CF-MKTVAL-ADJ-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    OUT MIR-CF-REASN-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Reason";
        Index = "1";
    }

    OUT MIR-CF-SEQ-NUM-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CF-STAT-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Cash Flow Status";
        Index = "1";
    }

    OUT MIR-CF-TRXN-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";
    }

    OUT MIR-CVG-WTHDR-ORDR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Withdrawal Order";
    }

    OUT MIR-DV-CF-DPOS-BAL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    OUT MIR-DV-CF-DPOS-CSV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    OUT MIR-DV-MTHV-ADJ-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Monthiversary Charge";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-SURR-CHRG-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    OUT MIR-LOAN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Total Policy Loan";
    }

    OUT MIR-NXT-CF-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Next Cash Flow - Date";
        Index = "1";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan";
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
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-ROLOVR-CF-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "GIA - Rollover Date";
        Index = "1";
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

}

