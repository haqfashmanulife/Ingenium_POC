# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:24 PM EDT

#*******************************************************************************
#*  Component:   BF0636-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00495  DPK      Removed fields from Key Details,Confirm Details & Change  *
#*                   Details                                                   *
#*  P00891  YC       Add Journal Date with no limitation   30MAY2003           *
#*  PR0001  ROC      20% MVA Free Withdrawal                                   *
#*  U11151  CLB      Change definition of MIR-DV-CF-REP-DT (Jrnl Dt) to INOUT  *
#*                   and add DefaultSession.                                   *
#*  MP4FB1  H.L      add pay out method, ho acceptance date and bank,name,addres *
#*  U40012  BP       Add Bank Name and Branch Name                             *
#*  MP5002  CTS      ADD FlexFund Surrender Charge Type                        *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *  
#*  M142F2  CTS      ADDED FIELDS FOR SURVIVOR BENIFIT                         *
#*  CSCR03  CTS      CHANGES FOR NOMURA FOREIGN HOLIDAY REMITTANCE DATE        *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

P-STEP BF0636-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0636";
        BusinessFunctionName = "Annuity Partial Surrender Amount";
        BusinessFunctionType = "Psramt";
        MirName = "CCWM0761";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CF-SURR-CHRG-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-CF-CLI-TRXN-AMT
    {
        Key;
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Gross Amount";
    }

    INOUT MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCFLW";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-CF-REASN-CD
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

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";
    }
     
#  ISLADM Changes Start here     
#    INOUT MIR-HO-FORM-ACPT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        DefaultSession = "LSIR-PRCES-DT";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    INOUT MIR-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";        
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here 
#  M142F2 Changes Starts here       
    INOUT MIR-DV-WTHDR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-WTHDR-TYP-CD";
        SType = "Text";
        Label = "Withdrawal Reason";
    }
    
    INOUT MIR-DV-SRVBEN-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-SRVBEN-TYP-CD";
        SType = "Text";
        Label = "Type of Survivorship Benefit Requested";
    }
  #  M142F2 Changes end here  

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

    OUT MIR-CF-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TCFLW";
        SType = "Percent";
        Label = "Interest Rate / Unit Cost";
    }

    OUT MIR-CF-LOAN-IMPRD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Impaired Amount";
    }

    OUT MIR-CF-MKTVAL-ADJ-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Market Value Adjustment";
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

    OUT MIR-FREE-WTHDR-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Free Withdrawal Date";
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

    OUT MIR-UNIT-PRIC-ESTB-IND
    {
        Length = "1";
        DBTableName = "TCFLW";
        SType = "Indicator";
        Label = "Equity - Unit cost on the effective transaction date has been established";
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

    # IN MIR-DV-CF-REP-DT
    INOUT MIR-DV-CF-REP-DT
    {
    # DisplayOnly;
      Length = "10";
      DefaultSession = "LSIR-PRCES-DT";
      SType = "Date";
      Label = "Journal Date";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-PAYE-CLI-FRST-NM
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CLI-LAST-NM
    {
       Length = "25";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    INOUT MIR-PAYE-CO-NM
    {
       Length = "50";
       SType = "Text";
       Label = "Company Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD
    {
       Length = "8";
       SType = "Text";
       Label = "Address Code";
    }

    INOUT MIR-CLI-PSTL-CD
    {
       Length = "9";
       SType = "Text";
       Label = "Postal Code";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }

    INOUT MIR-DV-CLI-ADDR
    {
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }

    OUT MIR-BNK-NM        
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM     
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Branch Name";
    }
# CSCR03 CHANGES START HERE
    OUT MIR-REMIT-DT
    { 
      Length = "10";
      DBTableName = "TFBNK";
      SType = "Date";
      Label = "Remittance Date"; 
    }
# CSCR03 CHANGES END HERE             
# MP5002    
    INOUT MIR-SURR-CHRG-TYP-CD     
    {
          Length = "40";
          CodeSource = "EDIT";
          CodeType = "MVAL";
          DBTableName = "TPOL";
          SType = "Text";
          Label = "FlexFund Surrender Charge Type"; 
    }
#27549A - Changes Start here
    INOUT MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    } 
#27549A- Changes ends here
}
