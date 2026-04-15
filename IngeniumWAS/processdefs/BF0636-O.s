# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:26 PM EDT

#*********************************************************************************
#*  Component:   BF0636-O.s                                                      *
#*  Description:                                                                 *
#*                                                                               *
#*********************************************************************************
#*  Chg#    Release  Description                                                 *
#*                                                                               *
#*  014590  6.0      New for release 6.0                                         *
#*  017150  612J     Remove Currency Decimals = "2"                              *
#*  B00495  DPK      Remove Key detail fields                                    *
#*  P00891  YC       Add Journal Date with no limitation   30MAY2003             *
#*  PR0001           20% MVA Free Withdrawal                                     *
#*  MP4FB1  H.L      add pay out method, ho acceptance date and bank,name,addres *
#*  U40012  BP       Added Bank Name and Bank Branch Name                        *
#*  MP5002  CTS      ADD FlexFund Surrender Charge Type                          *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                           *  
#*  M142F2  CTS      ADDED FIELDS FOR SURVIVOR BENIFIT                           * 
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                        *
#*********************************************************************************

S-STEP BF0636-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Psramt";
    Type = "Output";
    DelEmptyRows;
    FocusField = "OKButton";
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
    SType="Hidden";
  }

  IN MIR-CF-SURR-CHRG-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "15";
    SType = "Currency";
    Label = "Surrender Charge";
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

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";
    }
     
#  ISLADM Changes Start here     
#    IN MIR-HO-FORM-ACPT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        DefaultSession = "LSIR-PRCES-DT";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    IN MIR-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";        
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here
 # M142F2 Changes starts here 

    IN MIR-DV-WTHDR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-WTHDR-TYP-CD";
        SType = "Text";
        Label = "Withdrawal Reason";
    }
    
    
    IN MIR-DV-SRVBEN-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-SRVBEN-TYP-CD";
        SType = "Text";
        Label = "Type of Survivorship Benefit Requested";
    }
  # M142F2 Changes End here    
  IN MIR-AGT-1-ID-T[3] 
  {
    DisplayOnly;
    Length = "6";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Text";
    Label = "Agent ID";
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

  IN MIR-CFAGT-SHR-1-PCT-T[3] 
  {
    DisplayOnly;
    Length = "5";
    Decimals = "2";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Percent";
    Label = "Share of Commissions";
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
    Index = "1";
    SType = "Currency";
    Label = "Commissionable Premium Payable";
  }

  IN MIR-CF-DPOS-TRM-DY-DUR 
  {
    DisplayOnly;
    Length = "3";
    SType = "Text";
    Label = "Deposit Term - Days";
  }

  IN MIR-CF-DPOS-TRM-MO-DUR 
  {
    DisplayOnly;
    Length = "3";
    SType = "Text";
    Label = "Deposit Term - Months";
  }

  IN MIR-CF-EFF-DT 
  {
    DisplayOnly;
    Length = "10";
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
    Label = "Transaction Reason";
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

  IN MIR-COMM-RT-TBAC-1-ID-T[3] 
  {
    DisplayOnly;
    Length = "5";
    FieldGroup = "Table3";
    Index = "1";
    SType = "Text";
    Label = "Commission Rates Payable";
  }

  IN MIR-CONN-CF-SEQ-NUM 
  {
    DisplayOnly;
    Length = "3";
    SType = "Text";
    Label = "Connected Sequence";
  }

  IN MIR-FREE-WTHDR-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Last Free Withdrawal Date";
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
    Index = "1";
    SType = "Text";
    Label = "Override Situation";
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
    Label = "GIA - Rollover Date";
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
    IN MIR-DV-CF-REP-DT
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
    }
     
    IN MIR-BNK-ID
    {
      DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID
    {
      DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-BNK-ACCT-ID
    {
      DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM
    {
      DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
      DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-PAYE-CLI-FRST-NM 
    {
      DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    IN MIR-PAYE-CLI-LAST-NM 
    {
      DisplayOnly;
       Length = "25";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    IN MIR-PAYE-CO-NM 
    {
      DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Company Name";
    }

    IN MIR-CLI-ADDR-LOC-CD 
    {
      DisplayOnly;
       Length = "8";
       SType = "Text";
       Label = "Address Code";
    }

    IN MIR-CLI-PSTL-CD 
    {
      DisplayOnly;
       Length = "9";
       SType = "Text";
       Label = "Postal Code";
    }

    IN MIR-CLI-ADDR-ADDL-TXT
    {
      DisplayOnly;
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }

    IN MIR-DV-CLI-ADDR 
    {
      DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }

    IN MIR-BNK-NM 
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Name";
    }

    IN MIR-BNK-BR-NM
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Branch Name";
    }
#MP5002    
    IN MIR-SURR-CHRG-TYP-CD
    {
      DisplayOnly;
      Length = "1";
      CodeSource = "EDIT";
      CodeType = "MVAL";      
      SType = "Text";
      Label = "FlexFund Surrender Charge Type";
    }
#27549A - Changes Start here
    
    IN MIR-ATO-NOT-APPL-IND
    {
       DisplayOnly;
       Length = "1";
       SType = "Indicator";
       Label = "ATO not applicable";
     }
#27549A- Changes ends here     
    
    
}
