# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9346-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL20  01AUG01  New for this release                                      *
#*  01BL20  01AUG01  Client field is mandatory                                 *
#*  01BL20  01AUG01  Add Seq Num to key lookup                                 *
#*  B00306  01AUG01  Corrected lookup for CodeType = "DRW-STAT-CD"             *
#*  B00382  01AUG01  Add new fields on display                                 *
#*  NWLBCA  27AUG09  Add new fields and change length of existing field        *
#*  NWLBCA  27AUG09  on display                                                *
#*  ATF056  03NOV09  Added new fields for header section                       *
#*  MP155A  28JUN11  Added a new field 'Receipt Type' in Billing Activity      *
#*  MP155A  28JUN11  screen.                                                   *                                 *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M319B1  CTS      CHANGES FOR FXWL PROJECT                                  *
#*  Q89577  23JUN17  Changes for FXWL             			       *
#*  FFF10Q  CTS      CHANGES FOR FFF NOMURA COLLECTIONS                        *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************
 
S-STEP BF9346-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "list";
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

  INOUT MIR-CLI-ID 
  {
    Key;
    Mandatory;
    Length = "10";
    DefaultSession = "MIR-CLI-ID";
    SType = "Text";
    Label = "Client id";
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

  INOUT MIR-POL-ID-BASE
  {
    Key;
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

  IN MIR-CLI-ID-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Client ID";
    Index = "1";
  }

  IN MIR-DV-SRCH-CLI-NM-T[100] 
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Client Name";
  }

  IN MIR-APPL-CTL-PRCES-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Create Date";
    Index = "1";
  }

  IN MIR-SEQ-NUM-T[100] 
  {
    DisplayOnly;
    Length = "03";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Seq. Number";
  }

  IN MIR-POL-ID-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Policy ID";
  }

  IN MIR-DRW-STAT-CD-T[100] 
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "DRW-STAT-CD";
    SType = "Text";
    Label = "Status";
  }

  IN MIR-UNSUCS-REASN-CD-T[100] 
  {
    DisplayOnly;
    Length = "20";
    FieldGroup = "Table1";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "UNSUCS-REASN-CD";
    SType = "Text";
    Label = "Reason";
  }

  IN MIR-BILL-TYP-CD-T[100] 
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "BILL-TYP-CD";
    SType = "Text";
    Label = "Billing Method";
  }

  IN MIR-BILL-MODE-CD-T[100] 
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "BILL-MODE-CD";
    SType = "Text";
    Label = "Billing Mode";
  }

  IN MIR-BNK-ID-T[100] 
  {
    DisplayOnly;
    Length = "04";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Bank";
  }

  IN MIR-BNK-BR-ID-T[100] 
  {
    DisplayOnly;
    Length = "05";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Branch";
  }

  IN MIR-BNK-ACCT-ID-T[100]
  {
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Account";
  }

  IN MIR-PREM-RQST-QTY-T[100]
  {
    DisplayOnly;
    Length = "02";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "# Premiums";
  }

  IN MIR-A-RECPT-XPRY-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "A Receipt Expiry Date";
  }

  IN MIR-DRW-DT-T[100] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "Draw Date";
  }

#M319B1 CHANGES START HERE
  IN MIR-PRE-XCHNG-PREM-AMT-T[100]
  {
    CurrencyCode="MIR-PREM-CRCY-CD";
    DisplayOnly;
    FieldGroup = "Table1";
    Index = "1";
    Length = "16";
    SType = "Currency";
    Label = "Premium (Policy Currency)";
    Signed;
  }
  
  IN MIR-CRCY-XCHNG-RT-T[100] 
  {
    DisplayOnly;
    FieldGroup = "Table1";
    Index = "1";
    Length = "18";
    SType = "Number";
    Label = "JPY Conversion Rate";
  }
	
  IN MIR-PRE-XCHNG-RECV-AMT-T[100] 
  {
   # FFF10Q CHANGES STARTS HERE
   # CurrencyCode="MIR-PMT-CRCY-CD";
     CurrencyCode="MIR-TRXN-CRCY-CD-T[]";
  # FFF10Q CHANGES ENDS HERE   
    DisplayOnly;
    FieldGroup = "Table1";
    Index = "1";
    Length = "16";
    SType = "Currency";
    Label = "Premium (JPY Conversion)";
    Signed;
  }
	
  IN MIR-CRCY-XCHNG-EFF-DT-T[100] 
  {
    DisplayOnly;
    FieldGroup = "Table1";
    Index = "1";
    Length = "10";
    SType = "Date";
    Label = "Conversion Rate Effective Date";
  }
#M319B1 CHANGES END HERE    

  IN MIR-PREM-AMT-T[100] 
  {
#M245B2 CHANGES START HERE   
#Q89577 CHANGES START HERE 
    # CurrencyCode = "MIR-POL-CRCY-CD";
#FFF10Q CHANGES START HERE    
    #CurrencyCode = "MIR-PMT-CRCY-CD";
    CurrencyCode = "MIR-TRXN-CRCY-CD-T[]";
#FFF10Q CHANGES END HERE    
#Q89577 CHANGES END HERE 
#M245B2 CHANGES START HERE     
    DisplayOnly;
    Length = "13";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Total Billed";
  }

  IN MIR-RECV-AMT-T[100] 
  {
#M245B2 CHANGES START HERE    
#FFF10Q CHANGES START HERE
        #CurrencyCode="MIR-PMT-CRCY-CD";
    CurrencyCode = "MIR-TRXN-CRCY-CD-T[]";
#FFF10Q CHANGES END HERE        
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Length = "13";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Total Received";
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
  
#FFF10Q CHANGES START HERE   
  #INOUT MIR-PMT-CRCY-CD
  
  #   {
  #     Length = "2";
  #     SType = "Hidden";
  #     Label = "Currency";
  # }
#FFF10Q CHANGES START HERE  
   IN MIR-TRXN-CRCY-CD-T[100]
  
       {
         Length = "2";
         FieldGroup = "Table1";         
         SType = "Hidden";
         Label = "Transaction Currency Code";
         Index = "1";
     }
#FFF10Q CHANGES END HERE   
#M245B2 CHANGES END HERE     

#M319B1 CHANGES START HERE
  INOUT MIR-PREM-CRCY-CD
     {
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
   }
#M319B1 CHANGES END HERE
}
