# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:26 PM EDT

#*******************************************************************************
#*  Component:   BF0642-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0642-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Trxnrev";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN MIR-CF-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
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

    IN MIR-DV-CF-CLI-TRXN-AMT
    {
        Key;
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Reversal Amount";
    }

    IN MIR-DV-CF-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
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

    IN MIR-SUPRES-CNFRM-IND
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-AGT-1-ID-T[3]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    IN MIR-CF-7702-DECR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "TC-Date";
    }

    IN MIR-CF-ACUM-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "14";
        SType = "Currency";
        Label = "Previous Interest Earned";
    }

    IN MIR-CFAGT-SHR-1-PCT-T[3]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Share of Commissions";
        Index = "1";
    }

    IN MIR-CF-CLI-TRXN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Gross Amount";
    }

    IN MIR-CF-CPREM-1-AMT-T[3]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commissionable Premium Payable";
        Index = "1";
    }

    IN MIR-CF-DPOS-TRM-DY-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Term - Days";
    }

    IN MIR-CF-DPOS-TRM-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Term - Months";
    }

    IN MIR-CF-EQTY-GLA-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Equity Products - Gain / loss accounting complete";
    }

    IN MIR-CF-FND-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Current Amount";
    }

    IN MIR-CF-FND-TRXN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Deposit Amount";
    }

    IN MIR-CF-INT-PAYO-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Interest Payout Date";
    }

    IN MIR-CF-INT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate / Unit Cost";
    }

    IN MIR-CF-LOAN-IMPRD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Impaired Amount";
    }

    IN MIR-CF-MKTVAL-ADJ-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    IN MIR-CF-ORIG-LF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Original Deposit Date";
    }

    IN MIR-CF-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Transaction Date";
    }

    IN MIR-CF-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Text";
        Label = "Reason";
    }

    IN MIR-CF-REG-FND-SRC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Text";
        Label = "Source of Deposit";
    }

    IN MIR-CF-REVRS-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Reverse Date";
    }

    IN MIR-CF-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        SType = "Text";
        Label = "Cash Flow Status";
    }

    IN MIR-CF-SURR-CHRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    IN MIR-CF-TAX-GAIN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Gain Amount";
    }

    IN MIR-CF-TAX-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Tax Year";
    }

    IN MIR-CF-TOT-SURR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Total";
    }

    IN MIR-CF-TRXN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        SType = "Text";
        Label = "Transaction Type";
    }

    IN MIR-CF-UNIT-QTY
    {
        DisplayOnly;
        Length = "13";
        SType = "Text";
        Label = "Equity Products - Units Purchased";
    }

    IN MIR-CLUST-CF-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Family Sequence Number";
    }

    IN MIR-COMM-RT-TBAC-1-ID-T[3]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Commission Rates Payable";
        Index = "1";
    }

    IN MIR-CONN-CF-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Connected Sequence";
    }

    IN MIR-DEST-CDA-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Destination Sequence Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-INT-TO-NXT-CF-AMT
    {
        DisplayOnly;
        Signed;
        Length = "14";
        SType = "Currency";
        Label = "Current Interest Earned";
    }

    IN MIR-LOAN-IMPRD-INT-RT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Impaired Interest Rate";
    }

    IN MIR-NXT-CF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Cash Flow - Date";
    }

    IN MIR-NXT-CF-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Next Cash Flow - Sequence Number";
    }

    IN MIR-NXT-LF-CF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "LIFO - FIFO Date";
    }

    IN MIR-NXT-LF-CF-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "LIFO - FIFO Sequence Number";
    }

    IN MIR-OVRID-1-ID-T[3]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Override Situation";
        Index = "1";
    }

    IN MIR-PAYO-CLUST-CF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Deposit Family Date";
    }

    IN MIR-PREV-CF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Previous Cash Flow - Date";
    }

    IN MIR-PREV-CF-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Previous Cash Flow - Sequence Number";
    }

    IN MIR-ROLOVR-CF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Rollover Date";
    }

    IN MIR-SRC-CDA-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Source Sequence Number";
    }

    IN MIR-SRC-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Source Coverage Number";
    }

    IN MIR-UNIT-PRIC-ESTB-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Equity - Unit cost on the effective transaction date has been established";
    }

    IN MIR-XFER-CF-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Interest Payout Sequence Number";
    }

    IN MIR-XFER-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Interest Payout Coverage Number";
    }

}

