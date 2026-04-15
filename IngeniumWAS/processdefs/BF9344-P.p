# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#***********************************************************************
#*  Component:   BF9344-P.p                                            *
#*  Description:                                                       *
#*                                                                     *
#***********************************************************************
#*  Chg#    Release  Description                                       *
#*                                                                     * 
#*  01BL20  01AUG01  Initial creation.                                 * 
#*  01BL20  01AUG01  Policy field is mandatory                         * 
#*  B00306  01AUG01  Corrected lookup for CodeType = "DRW-STAT-CD"     *
#*  B00382  01AUG01  Add new fields on display                         *
#*  NWLBCA  27AUG09  Add new fields and change length of existing field*
#*  NWLBCA  27AUG09  on display                                        *
#*  ATF056  03NOV09  Added new fields for header section               *
#*  MP155A  28JUN11  Added a new field 'Receipt Type' in Billing       *
#*  MP155A  28JUN11  Activity screen.                                  *                                          
#*  M245B2  CTS      Foreign Currency Formatting                       *
#*  M319B1  CTS      CHANGES FOR FXWL PROJECT                          *
#*  130664  CTS      FIX DONE FOR FFF NOMURA COLLECTIONS               *
#*  130974  CTS      FIX FOR FFF NOMURA BILLING CHANGES                *
#*  UYS133  CTS      Addition of PD group size field                   *
#***********************************************************************
 
P-STEP BF9344-P
{
    
    ATTRIBUTES
    {
        BusinessFunctionId = "9344";
        BusinessFunctionName = "Billing Activity Table List by Policy";
        BusinessFunctionType = "Bainqlist";
        MirName = "CCWM9344";
    }
    
    OUT LSIR-RETURN-CD {}

    OUT MIR-RETRN-CD {}


    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TBAC";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TBAC";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
  
    INOUT MIR-APPL-CTL-PRCES-DT                  
    {
        Key;
        Length = "10";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Date";
    }

    INOUT MIR-SEQ-NUM
    {
        Key;
        Length = "03";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Seq. Number";
    }

    OUT MIR-APPL-CTL-PRCES-DT-T[100]                
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "System Date";
        Index = "1";
    }

    OUT MIR-BILL-TYP-CD-T[100]                 
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "BILL-TYP-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Bill Method";
        Index = "1";
    }

    OUT MIR-BILL-MODE-CD-T[100]                
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "BILL-MODE-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Bill Mode";
        Index = "1";
    }

    OUT MIR-DRW-STAT-CD-T[100]                
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "DRW-STAT-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-PREV-UPDT-DT-T[100]            
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Status Date";
        Index = "1";
    }

    OUT MIR-A-RECPT-XPRY-DT-T[100]            
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "A Receipt Expiry Date";
        Index = "1";
    }

    OUT MIR-DRW-DT-T[100]            
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Draw Date";
        Index = "1";
    }
    
#M319B1 CHANGES START HERE
    OUT MIR-PRE-XCHNG-PREM-AMT-T[100] 
    {
        DBTableName = "TBAC";
        FieldGroup = "Table1";
        Index = "1";
        Length = "16";
        SType = "Currency";
        Label = "Premium (Policy Currency)";
        Signed;
    }
    
    OUT MIR-CRCY-XCHNG-RT-T[100] 
    {
        DBTableName = "TBAC";
        FieldGroup = "Table1";
        Index = "1";
        Length = "18";
        SType = "Number";
        Label = "JPY Conversion Rate";
        Signed;
    }
	
    OUT MIR-PRE-XCHNG-RECV-AMT-T[100] 
    {
        DBTableName = "TBAC";
        FieldGroup = "Table1";
        Length = "16";
        SType = "Currency";
        Label = "Premium (JPY Conversion)";
        Signed;
    }
	
    OUT MIR-CRCY-XCHNG-EFF-DT-T[100] 
    {
        DBTableName = "TBAC";
        FieldGroup = "Table1";
        Length = "10";
        SType = "Date";
        Label = "Conversion Rate Effective Date";
    }
#M319B1 CHANGES END HERE        

    OUT MIR-BNK-ID-T[100]                      
    {
        Length = "04";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Bank";
        Index = "1";
    }

    OUT MIR-BNK-BR-ID-T[100]                      
    {
        Length = "05";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Branch";
        Index = "1";
    }

    OUT MIR-BNK-ACCT-ID-T[100]
    {
        Length = "17";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Account";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Payor ID";
        Index = "1";
    }

    OUT MIR-DV-SRCH-CLI-NM-T[100]
    {
        Length = "30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Name";
        Index = "1";
    }

    OUT MIR-PREM-AMT-T[100]                    
    {
#130974 CHANGES START HERE
#       Length = "13";
        Length = "15";
#130974 CHANGES END HERE
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Currency";
        Label = "Total Billed";
        Index = "1";
    }

    OUT MIR-RECV-AMT-T[100]                    
    {
        Length = "13";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Currency";
        Label = "Total Received";
        Index = "1";
    }

    OUT MIR-SEQ-NUM-T[100]
    {
        Length = "03";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Seq. Number";
        Index = "1";
    }
    
    OUT MIR-UNSUCS-REASN-CD-T[100]
    {
        Length = "01";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "UNSUCS-REASN-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Unsuccessful Reason Code";
        Index = "1";
    }

    OUT MIR-FND-SRC-CD-T[100]
    {
        Length = "01";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "FND-SRC-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Source of Funds";
        Index = "1";
    }

    OUT MIR-PREM-RQST-QTY-T[100]
    {
        Length = "02";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Number of Payments Requested";
        Index = "1";
    }

    OUT MIR-PREM-COLCT-QTY-T[100]
    {
# Changes for NWLBCA starts here
#        Length = "02";
        Length = "03";
# Changes for NWLBCA ends here	
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Number of Payments Collected";
        Index = "1";
    }
    OUT MIR-PAYRL-SIZ-CD-T[100]
    {
        Length = "01";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "PAYRL-SIZ-CD";
        DBTableName = "TBAC";
        SType = "Text";
#UYS133 CHANGES START
#        Label = "Payroll Size";
        Label = "PD group size";
#UYS133 CHANGES END
        Index = "1";
    }

    OUT MIR-RECV-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Payment Received Date";
        Index = "1";
    }

# Changes for NWLBCA starts here    
    OUT MIR-TRAD-JRNL-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "TD Journal Date";
        Index = "1";
    }

    OUT MIR-TRAD-SO-JRNL-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "TD SO Journal Date";
        Index = "1";
    }

    OUT MIR-TRAD-RECV-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "TD Received Date";
        Index = "1";
    }
    
    OUT MIR-PREM-DUE-MO-NUM-T[100]
    {
        Length = "07";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "TD Premium Due Month";
        Index = "1";
    }

# Changes for NWLBCA ends here 
# Changes for ATF056 starts here

  OUT MIR-PLAN-ID
  {
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Plan";
  }
  
  OUT MIR-POL-ISS-EFF-DT
  {
    Length = "10";
    DBTableName = "TPOL";
    SType = "Date";
    Label = "Policy Issue date";
  }
  
  OUT MIR-POL-PD-TO-DT-NUM
  {
    Length = "10";
    DBTableName = "TPOL";
    SType = "Text";
    Label = "Policy Paid to Date";
  }
  
  OUT MIR-TRAD-PD-TO-DT-NUM
  {
    Length = "10";
    DBTableName = "TPOL";
    SType = "Text";
    Label = "Trad Paid to Date";
  }
  
  OUT MIR-ACT-PD-TO-MON
  {
    Length = "07";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Actual Paid to Month";
  }
  
  OUT MIR-PD-TO-MON
  {
    Length = "07";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Paid to Month";
  }
  
  OUT MIR-ACT-PD-DUR
  {
    Length = "06";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Actual Paid Duration";
  }
  
  OUT MIR-PD-DUR
  {
    Length = "06";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Paid Duration";
  }
# Changes for ATF056 end here 
# Changes for MP155A starts here 

  OUT MIR-RECPT-TYP-CD-T[100]
  {
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
  INOUT MIR-POL-CRCY-CD
  {
    
    Length = "2";
    SType = "Hidden";
    Label = "Currency";
  }
#130664 CHANGES START HERE  
  #INOUT MIR-PMT-CRCY-CD
  #   {
  #     Length = "2";
  #     SType = "Hidden";
  #     Label = "Currency";
  #   }

   INOUT MIR-TRXN-CRCY-CD-T[100]
  
       {
         Length = "2";
         FieldGroup = "Table1";         
         SType = "Hidden";
         Label = "Transaction currency code";
         Index = "1";
     } 
#130664 CHANGES END HERE 
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
