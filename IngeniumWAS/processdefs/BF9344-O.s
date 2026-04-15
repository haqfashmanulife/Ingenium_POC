# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9344-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL20  01AUG01  New for this release                                      *
#*  01BL20  01AUG01  Policy field is mandatory                                 *
#*  B00306  01AUG01  Corrected lookup for CodeType = "DRW-STAT-CD"             *
#*  B00382  01AUG01  Add new fields on display                                 *
#*  NWLBCA  27AUG09  Add new fields and change length of existing field        *
#*  NWLBCA  27AUG09  on display                                                *
#*  ATF056  03NOV09  Added new fields for header section                       *
#*  MP155A  28JUN11  Added a new field 'Receipt Type' in Billing Activity      *
#*  MP155A  28JUN11  screen.                                                   *
#*  M245B2  CTS      Foreign Currency Formatting                       *
#*  Q60736   CTS   Fix to display Premium currency for Billed amount
#*  M319B1  CTS      CHANGES FOR FXWL PROJECT                                  *
#*  130664  CTS      FIX FOR FFF NOMURA COLLECTIONS                            *
#*  130974  CTS      FIX FOR FFF NOMURA BILLING CHANGES                        *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF9344-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Bainqlist";
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

  OUT index
  {
    SType = "Hidden";
  }

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

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

  INOUT MIR-APPL-CTL-PRCES-DT 
  {
    Key;
    Length = "10";
    SType = "Date";
    Label = "Date";
  }

  INOUT MIR-SEQ-NUM 
  {
    Key;
    Length = "03";
    SType = "Text";
    Label = "Seq. Number";
  }

  IN MIR-APPL-CTL-PRCES-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "System Date";
    Index = "1";
  }

  IN MIR-BILL-TYP-CD-T[100] 
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "BILL-TYP-CD";
    SType = "Text";
    Label = "Bill Method";
    Index = "1";
  }

  IN MIR-BILL-MODE-CD-T[100] 
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "BILL-MODE-CD";
    SType = "Text";
    Label = "Bill Mode";
    Index = "1";
  }

  IN MIR-DRW-STAT-CD-T[100] 
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "DRW-STAT-CD";
    SType = "Text";
    Label = "Status";
    Index = "1";
  }

  IN MIR-PREV-UPDT-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Status Date";
    Index = "1";
  }

  IN MIR-A-RECPT-XPRY-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "A Receipt Expiry Date";
    Index = "1";
  }

  IN MIR-DRW-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Draw Date";
    Index = "1";
  }
  
#M319B1 CHANGES START HERE
  IN MIR-PRE-XCHNG-PREM-AMT-T[100] 
  {
    CurrencyCode="MIR-PREM-CRCY-CD"; 
    DisplayOnly;
    Length = "16";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Premium (Policy Currency)";
    Signed;
  }
  
  IN MIR-CRCY-XCHNG-RT-T[100] 
  {
    DisplayOnly;
    Length = "18";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Number";
    Label = "JPY Conversion Rate";
  }
	
  IN MIR-PRE-XCHNG-RECV-AMT-T[100] 
  {
  #130664 CHANGES STARTS HERE
   # CurrencyCode="MIR-PMT-CRCY-CD";
     CurrencyCode="MIR-TRXN-CRCY-CD-T[]";
  #130664 CHANGES ENDS HERE   
    DisplayOnly;
    Length = "16";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Premium (JPY Conversion)";
    Signed;
  }
	
  IN MIR-CRCY-XCHNG-EFF-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "Conversion Rate Effective Date";
  }
#M319B1 CHANGES END HERE    

  IN MIR-BNK-ID-T[100] 
  {
    DisplayOnly;
    Length = "04";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Bank";
    Index = "1";
  }

  IN MIR-BNK-BR-ID-T[100] 
  {
    DisplayOnly;
    Length = "05";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Branch";
    Index = "1";
  }

  IN MIR-BNK-ACCT-ID-T[100]
  {
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Account";
    Index = "1";
  }

  IN MIR-CLI-ID-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Payor ID";
    Index = "1";
  }

  IN MIR-DV-SRCH-CLI-NM-T[100] 
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Name";
    Index = "1";
  }

  IN MIR-PREM-AMT-T[100] 
  {
#M245B2 CHANGES START HERE    
# Q60736 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
#130664 CHANGES START HERE    
    #CurrencyCode = "MIR-PMT-CRCY-CD";
    CurrencyCode = "MIR-TRXN-CRCY-CD-T[]";
#130664 CHANGES END HERE        
 # Q60736 CHANGES END HERE
#M245B2 CHANGES END HERE 
    DisplayOnly;
#130974 CHANGES START HERE
#   Length = "13";
    Length = "15";
#130974 CHANGES END HERE
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Total Billed";
    Index = "1";
  }

  IN MIR-RECV-AMT-T[100] 
  {
#M245B2 CHANGES START HERE    
#130664 CHANGES START HERE
        #CurrencyCode="MIR-PMT-CRCY-CD";
    CurrencyCode = "MIR-TRXN-CRCY-CD-T[]";
#130664 CHANGES END HERE        
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Length = "13";
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Total Received";
    Index = "1";
  }

  IN MIR-SEQ-NUM-T[100] 
  {
    DisplayOnly;
    Length = "03";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Seq. Number";
    Index = "1";
  }
  
  IN MIR-UNSUCS-REASN-CD-T[100]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "UNSUCS-REASN-CD";
    SType = "Text";
    Label = "Unsuccessful Reason Code";
    Index = "1";
  }

  IN MIR-FND-SRC-CD-T[100]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "FND-SRC-CD";
    SType = "Text";
    Label = "Source of Funds";
    Index = "1";
  }

  IN MIR-PREM-RQST-QTY-T[100]
  {
    DisplayOnly;
    Length = "02";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Number of Payments Requested";
    Index = "1";
  }

  IN MIR-PREM-COLCT-QTY-T[100]
  {
    DisplayOnly;
# Changes for NWLBCA starts here
#    Length = "02";
    Length = "03";
# Changes for NWLBCA ends here	
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Number of Payments Collected";
    Index = "1";
  }
  
  IN MIR-PAYRL-SIZ-CD-T[100]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "PAYRL-SIZ-CD";
    SType = "Text";
#UYS133 CHANGES START
#    Label = "Payroll Size";
    Label = "PD group size";
#UYS133 CHANGES END
    Index = "1";
  }

  IN MIR-RECV-DT-T[100]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Payment Received Date";
    Index = "1";
  }

# Changes for NWLBCA starts here
  IN MIR-TRAD-JRNL-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "TD Journal Date";
  }

  IN MIR-TRAD-SO-JRNL-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "TD SO Journal Date";
  }

  IN MIR-TRAD-RECV-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "TD Received Date";
  }
  
  IN MIR-PREM-DUE-MO-NUM-T[100] 
  {
    DisplayOnly;
    Length = "07";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Premium Due Month";
  }

# Changes for NWLBCA ends here
# Changes for ATF056 starts here

  IN MIR-PLAN-ID
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Plan";
  }
  
  IN MIR-POL-ISS-EFF-DT
  {
    DisplayOnly;
    Length = "10";
    DBTableName = "TPOL";
    SType = "Date";
    Label = "Policy Issue date";
  }
  
  IN MIR-POL-PD-TO-DT-NUM
  {
    DisplayOnly;
    Length = "10";
    DBTableName = "TPOL";
    SType = "Text";
    Label = "Policy Paid to Date";
  }
  
  IN MIR-TRAD-PD-TO-DT-NUM
  {
    DisplayOnly;
    Length = "10";
    DBTableName = "TPOL";
    SType = "Text";
    Label = "Trad Paid to Date";
  }
  
  IN MIR-ACT-PD-TO-MON
  {
    DisplayOnly;
    Length = "07";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Actual Paid to Month";
  }
  
  IN MIR-PD-TO-MON
  {
    DisplayOnly;
    Length = "07";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Paid to Month";
  }
  
  IN MIR-ACT-PD-DUR
  {
    DisplayOnly;
    Length = "06";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Actual Paid Duration";
  }
  
  IN MIR-PD-DUR
  {
    DisplayOnly;
    Length = "06";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Paid Duration";
  }
# Changes for ATF056 end here  

# Changes for MP155A starts here 
  IN MIR-RECPT-TYP-CD-T[100]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "RECPT-TYP-CD";
    DBTableName = "TBAC";
    SType = "Text";
    Label = "Receipt Type";
    Index = "1";
  }
# Changes for MP155A ends here    

#M245B2 CHANGES START HERE  
  IN MIR-POL-CRCY-CD
  {
    
    Length = "2"; 
    SType = "Hidden";
    Label = "Currency";
  }
#M245B2 CHANGES START HERE    

#M245B2 CHANGES START HERE
#130664 CHANGES START HERE       
  #INOUT MIR-PMT-CRCY-CD
  # {
  #   Length = "2";
  #  SType = "Text";
  #  Label = "Currency";
  # }
   IN MIR-TRXN-CRCY-CD-T[100]
  
       {
         Length = "2";
         FieldGroup = "Table1";         
         SType = "Hidden";
         Label = "Transaction Currency Code";
         Index = "1";
     }
#130664 CHANGES END HERE   
#M245B2 CHANGES END HERE     

#M319B1 CHANGES START HERE    
  INOUT MIR-PREM-CRCY-CD
   {
     Length = "2";
     SType = "Text";
     Label = "Currency";
   }
#M319B1 CHANGES END HERE
}
