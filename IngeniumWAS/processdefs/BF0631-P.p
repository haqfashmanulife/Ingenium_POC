# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:24 PM EDT

#*******************************************************************************
#*  Component:   BF0631-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0631-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0631";
        BusinessFunctionName = "Annuity Full Surrender GIA";
        BusinessFunctionType = "Fsrgia";
        MirName = "CCWM0761";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CF-FED-TAXWH-AMT
    {
        Length = "13";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    INOUT MIR-CF-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TCFLW";
        SType = "Percent";
        Label = "Interest Rate / Unit Cost";
    }

    INOUT MIR-CF-MKTVAL-ADJ-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    INOUT MIR-CF-PROV-TAXWH-AMT
    {
        Length = "13";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Provincial Tax Withheld";
    }

    INOUT MIR-CF-SURR-CHRG-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    INOUT MIR-DV-REDC-FACE-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Override automatic face reduction";
    }

    INOUT MIR-DV-TAX-OVRID-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Tax Override";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CF-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCFLW";
        DefaultConstant = "001";
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

    IN MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCFLW";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Cashflow Effective Date";
    }

    IN MIR-DV-CF-REASN-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        DBTableName = "TCFLW";
        SType = "Selection";
        Label = "Transaction Reason";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

    IN MIR-DV-SURR-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "GIA Surrender Effective Date";
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

    OUT MIR-AGT-1-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        DBTableName = "TCFAG";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    OUT MIR-CF-7702-DECR-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "U.S. Policies - Cash Flow 7702 Decrease Date";
    }

    OUT MIR-CF-ACUM-INT-AMT
    {
        Signed;
        Length = "14";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Previous Interest Earned";
    }

    OUT MIR-CFAGT-SHR-1-PCT-T[3]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        DBTableName = "TCFAG";
        SType = "Percent";
        Label = "Share of Commissions";
        Index = "1";
    }

    OUT MIR-CF-CLI-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Gross Amount";
    }

    OUT MIR-CF-CPREM-1-AMT-T[3]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Commissionable Premium Payable";
        Index = "1";
    }

    OUT MIR-CF-DPOS-TRM-DY-DUR
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    OUT MIR-CF-DPOS-TRM-MO-DUR
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    OUT MIR-CF-EFF-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-CF-EQTY-GLA-IND
    {
        Length = "1";
        DBTableName = "TCFLW";
        SType = "Indicator";
        Label = "Equity Products - Gain / loss accounting complete";
    }

    OUT MIR-CF-FND-BAL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Current Amount";
    }

    OUT MIR-CF-FND-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Net Deposit Amount";
    }

    OUT MIR-CF-INT-PAYO-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Next Interest Payout Date";
    }

    OUT MIR-CF-LOAN-IMPRD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Impaired Amount";
    }

    OUT MIR-CF-ORIG-LF-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Original Deposit Date";
    }

    OUT MIR-CF-PRCES-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Transaction Date";
    }

    OUT MIR-CF-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Reason";
    }

    OUT MIR-CF-REG-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Source of Deposit";
    }

    OUT MIR-CF-REVRS-PRCES-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Reverse Date";
    }

    OUT MIR-CF-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Cash Flow Status";
    }

    OUT MIR-CF-TAX-GAIN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Taxable Gain";
    }

    OUT MIR-CF-TAX-YR
    {
        Length = "4";
        DBTableName = "TCFLW";
        SType = "Year";
        Label = "Tax Year";
    }

    OUT MIR-CF-TOT-SURR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Surrender Total";
    }

    OUT MIR-CF-TRXN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Type";
    }

    OUT MIR-CF-UNIT-QTY
    {
        Length = "13";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Equity Products - Units Purchased";
    }

    OUT MIR-CLUST-CF-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "GIA - Deposit Family Sequence Number";
    }

    OUT MIR-COMM-RT-TBAC-1-ID-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        DBTableName = "TCFAG";
        SType = "Text";
        Label = "Commission Rates Payable";
        Index = "1";
    }

    OUT MIR-CONN-CF-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Connected Sequence";
    }

    OUT MIR-DEST-CDA-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Destination Sequence Number";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-INT-TO-NXT-CF-AMT
    {
        Signed;
        Length = "14";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Current Interest Earned";
    }

    OUT MIR-LOAN-IMPRD-INT-RT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TCFLW";
        SType = "Percent";
        Label = "Impaired Interest Rate";
    }

    OUT MIR-NXT-CF-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Next Cash Flow - Date";
    }

    OUT MIR-NXT-CF-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Next Cash Flow - Sequence Number";
    }

    OUT MIR-NXT-LF-CF-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "LIFO - FIFO Date";
    }

    OUT MIR-NXT-LF-CF-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "LIFO - FIFO Sequence Number";
    }

    OUT MIR-OVRID-1-ID-T[3]
    {
        Length = "2";
        FieldGroup = "Table3";
        DBTableName = "TCFAG";
        SType = "Text";
        Label = "Override Situation";
        Index = "1";
    }

    OUT MIR-PAYO-CLUST-CF-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Deposit Family Date";
    }

    OUT MIR-PREV-CF-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Previous Cash Flow - Date";
    }

    OUT MIR-PREV-CF-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Previous Cash Flow - Sequence Number";
    }

    OUT MIR-ROLOVR-CF-DT
    {
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "GIA - Rollover Date";
    }

    OUT MIR-SRC-CDA-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Source Sequence Number";
    }

    OUT MIR-SRC-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Source Coverage Number";
    }

    OUT MIR-XFER-CF-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Interest Payout Sequence Number";
    }

    OUT MIR-XFER-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Interest Payout Coverage Number";
    }

}

