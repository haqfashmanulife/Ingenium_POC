# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:26 PM EDT

#*******************************************************************************
#*  Component:   BF0641-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0641-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Change";
        Type = "Input";
        FocusField = "MIR-AGT-1-ID-T[1]";
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

    INOUT MIR-AGT-1-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    INOUT MIR-CF-ACUM-INT-AMT
    {
        Signed;
        Length = "14";
        SType = "Currency";
        Label = "Previous Interest Earned";
    }

    INOUT MIR-CFAGT-SHR-1-PCT-T[3]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Share of Commissions";
        Index = "1";
    }

    INOUT MIR-CF-CPREM-1-AMT-T[3]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commissionable Premium Payable";
        Index = "1";
    }

    INOUT MIR-CF-DPOS-TRM-DY-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Term - Days";
    }

    INOUT MIR-CF-DPOS-TRM-MO-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Term - Months";
    }

    INOUT MIR-CF-EQTY-GLA-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Equity Products - Gain / loss accounting complete";
    }

    INOUT MIR-CF-FND-TRXN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Deposit Amount";
    }

    INOUT MIR-CF-INT-PAYO-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Next Interest Payout Date";
    }

    INOUT MIR-CF-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate / Unit Cost";
    }

    INOUT MIR-CF-LOAN-IMPRD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Impaired Amount";
    }

    INOUT MIR-CF-MKTVAL-ADJ-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    INOUT MIR-CF-ORIG-LF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Original Deposit Date";
    }

    INOUT MIR-CF-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Transaction Date";
    }

    INOUT MIR-CF-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Selection";
        Label = "Reason";
    }

    INOUT MIR-CF-REG-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Selection";
        Label = "Source of Deposit";
    }

    INOUT MIR-CF-REVRS-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Reverse Date";
    }

    INOUT MIR-CF-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        SType = "Selection";
        Label = "Cash Flow Status";
    }

    INOUT MIR-CF-SURR-CHRG-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    INOUT MIR-CF-TAX-GAIN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Gain Amount";
    }

    INOUT MIR-CF-TAX-YR
    {
        Length = "4";
        SType = "Year";
        Label = "Tax Year";
    }

    INOUT MIR-CF-TOT-SURR-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Total";
    }

    INOUT MIR-CF-TRXN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        SType = "Selection";
        Label = "Transaction Type";
    }

    INOUT MIR-CF-UNIT-QTY
    {
        Length = "13";
        SType = "Text";
        Label = "Equity Products - Units Purchased";
    }

    INOUT MIR-CLUST-CF-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Family Sequence Number";
    }

    INOUT MIR-COMM-RT-TBAC-1-ID-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Commission Rates Payable";
        Index = "1";
    }

    INOUT MIR-CONN-CF-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Connected Sequence";
    }

    INOUT MIR-DEST-CDA-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Destination Sequence Number";
    }

    INOUT MIR-INT-TO-NXT-CF-AMT
    {
        Signed;
        Length = "14";
        SType = "Currency";
        Label = "Current Interest Earned";
    }

    INOUT MIR-LOAN-IMPRD-INT-RT
    {
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Impaired Interest Rate";
    }

    INOUT MIR-NXT-CF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Next Cash Flow - Date";
    }

    INOUT MIR-NXT-CF-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Next Cash Flow - Sequence Number";
    }

    INOUT MIR-NXT-LF-CF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "LIFO - FIFO Date";
    }

    INOUT MIR-NXT-LF-CF-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "LIFO - FIFO Sequence Number";
    }

    INOUT MIR-OVRID-1-ID-T[3]
    {
        Length = "2";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Override Situation";
        Index = "1";
    }

    INOUT MIR-PAYO-CLUST-CF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Deposit Family Date";
    }

    INOUT MIR-PREV-CF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Previous Cash Flow - Date";
    }

    INOUT MIR-PREV-CF-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Previous Cash Flow - Sequence Number";
    }

    INOUT MIR-ROLOVR-CF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Rollover Date";
    }

    INOUT MIR-SRC-CDA-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Source Sequence Number";
    }

    INOUT MIR-SRC-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Source Coverage Number";
    }

    INOUT MIR-UNIT-PRIC-ESTB-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Equity - Unit cost on the effective transaction date has been established";
    }

    INOUT MIR-XFER-CF-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Interest Payout Sequence Number";
    }

    INOUT MIR-XFER-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Interest Payout Coverage Number";
    }

    INOUT MIR-CF-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Key;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress Confirm";
    }

}

