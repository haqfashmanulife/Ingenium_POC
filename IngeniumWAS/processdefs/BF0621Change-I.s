# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:25 PM EDT

#*******************************************************************************
#*  Component:   BF0621Change-I.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00065  KRW      Add Operation Category                                    *
#*  P00891  YC       Add Journal Date with no limitation   30MAY2003           *
#*                                                                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF0621Change-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Payment";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CF-FND-TRXN-AMT";
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

    INOUT MIR-AGT-1-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
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
        Label = "Deposit Term - Days";
    }

    INOUT MIR-CF-DPOS-TRM-MO-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    INOUT MIR-CF-FND-TRXN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Deposit Amount";
    }

    INOUT MIR-CF-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate / Unit Cost";
    }

    INOUT MIR-COMM-RT-TBAC-1-ID-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Commission Rates Payable";
        Index = "1";
    }

    INOUT MIR-OVRID-1-ID-T[3]
    {
        Length = "2";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Override Situation";
        Index = "1";
    }

    INOUT MIR-OPER-CAT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Selection";
        Label = "Operation Category";
    }

    INOUT MIR-ROLOVR-CF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "GIA - Rollover Date";
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

    IN MIR-DPOS-OVRID-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    IN MIR-CF-REG-FND-SRC-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Text";
        Label = "Source of Deposit";
    }

    IN MIR-DV-CF-CLI-TRXN-AMT
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE       
        Key;
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Gross Amount";
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

    IN MIR-DV-CF-REASN-CD
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Text";
        Label = "Transaction Reason";
    }

    IN MIR-DV-CF-TAX-YR
    {
        Key;
        DisplayOnly;
        Length = "4";
        DefaultConstant = "0000";
        SType = "Year";
        Label = "Tax Year";
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

    IN MIR-CF-7702-DECR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "U.S. Policies - Cash Flow 7702 Decrease Date";
    }

    IN MIR-CF-ACUM-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "14";
        SType = "Currency";
        Label = "Previous Interest Earned";
    }

    IN MIR-CF-CLI-TRXN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Gross Amount";
    }

    IN MIR-CF-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
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
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE       
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Current Amount";
    }

    IN MIR-CF-INT-PAYO-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Interest Payout Date";
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
        Label = "Transaction Reason";
    }

    IN MIR-CF-REVRS-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Reverse Date";
    }

    IN MIR-CF-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence number";
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
        Label = "Taxable Gain";
    }

    IN MIR-CF-TAX-YR
    {
        DisplayOnly;
        Length = "4";
        DefaultConstant = "0000";
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
        Label = "GIA - Deposit Family Sequence Number";
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

#  P00891 YC      30MAY2003  Add 8 lines for Adding Journal Date
    IN MIR-JRNL-DT 
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
    }
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
}

