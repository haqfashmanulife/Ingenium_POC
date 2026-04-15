# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF9B84-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  NWLCAR  NWL-NP   NEW INQUIRY PROCESS FOR THE TRADITIONAL DEPOSIT HSITORY   *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  R10762  CTS     ADDITION OF EXPECTED LAPSE DATE FIELD                      *
#*  M319B1  CTS      CHANGES FOR FXWL PROJECT                                  *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  FFF10Q  CTS      CHANGES FOR FFF PRODUCT                                   *
#*  TL0763  CTS     ADDITION OF Elapsed Duration of CSV FILED                  *
#*******************************************************************************

P-STEP BF9B84-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B84";
        BusinessFunctionName = "Policy Inquiry - Trad Deposit History";
        BusinessFunctionType = "List";
        MirName = "CCWM9B84";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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
    
    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    
    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan ID";
    }
    
    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }
    
    OUT MIR-POL-PD-TO-MO-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policy Paid to Month";
    }
    
    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Paid to Date";
    }

    OUT MIR-POL-PD-DURATION-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policy Paid Duration";
    }
    
    OUT MIR-TRAD-PD-TO-MO-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Trad Paid to Month";
    }
    
    OUT MIR-TRAD-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Trad Paid to Date";
    }

    OUT MIR-TRAD-PD-DURATION-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Trad Paid Duration";
    }
    
#R10762 CHANGES START HERE
    OUT MIR-EXPCT-LAPS-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Expected Lapse Date";
    }
#R10762 CHANGES END HERE
    
    OUT MIR-COLCT-MTHD-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        CodeSource = "DataModel";
        CodeType = "COLCT-MTHD-CD";
        SType = "Text";
        Label = "Collection Method";
        Index = "1";
    }
    
    OUT MIR-COLCT-CATG-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        CodeSource = "DataModel";
        CodeType = "COLCT-CATG-CD";
        SType = "Text";
        Label = "Collection Category";
        Index = "1";
    }
    
    OUT MIR-TRAD-JRNL-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Trad Journal Date";
        Index = "1";
    }
    
    OUT MIR-TRAD-SO-JRNL-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Trad SO Journal Date";
        Index = "1";
    }
    
    OUT MIR-TRAD-RECV-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Trad Received Date";
        Index = "1";
    }
    
    OUT MIR-PREM-DUE-MO-NUM-T[50]
    {
        Length = "7";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Premium Due Month";
        Index = "1";
    }
    
    OUT MIR-DPOS-RFND-QTY-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Number of Deposits/ Refunds";
        Index = "1";
    }
    
    OUT MIR-TRXN-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Currency";
        Label = "Transaction Amount";
        Index = "1";
    }
    
#M319B1 CHANGES START HERE
    OUT MIR-CRCY-XCHNG-RT-T[50]
    {
        DBTableName = "TDH";
        FieldGroup = "Table50";
        Index = "1";
        Length = "18";
        SType = "Number";
        Label = "JPY Conversion Rate";
    }
	
    OUT MIR-JPY-TRXN-AMT-T[50] 
    {
        DBTableName = "TDH";
        FieldGroup = "Table50";
        Index = "1";
        Length = "16";
        SType = "Currency";
        Label = "Payment Amount (Yen Equivalent amount)";
        Signed;
    }
	
    OUT MIR-PREM-CRCY-TRXN-AMT-T[50] 
    {
        DBTableName = "TDH";
        FieldGroup = "Table50";
        Index = "1";
        Length = "16";
        SType = "Currency";
        Label = "Premium (Policy Currency)";
        Signed;
    }
	
    OUT MIR-CRCY-XCHNG-EFF-DT-T[50] 
    {
        DBTableName = "TDH";
        FieldGroup = "Table50";
        Index = "1";
        Length = "10";
        SType = "Date";
        Label = "Conversion Rate Effective Date";
    }
#M319B1 CHANGES END HERE       
    
    OUT MIR-TRXN-PRCES-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Transaction Process Date";
        Index = "1";
    }
    
    OUT MIR-SEQ-NUM-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }
#TDMG24 CHANGES START HERE    
    OUT MIR-POL-CSTAT-CD
    {
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        Label = "Current Policy Status";
        Length = "40";
        SType = "Text";
     }
     
#TDMG24 CHANGES END HERE 

#TDMG24 CHANGES START HERE
    OUT MIR-PREM-PMT-CMPLT-IND
 {
 
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Base Policy Premium Payment Completion";
 
 }    
#TDMG24 CHANGES END HERE    
    INOUT MIR-HID-TRAD-SO-JRNL-DT
    {
        Length = "10";
        DBTableName = "TDH";
        SType = "Hidden";
        Label = "Trad SO Journal Date";
    }

    
    INOUT MIR-HID-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TDH";
        SType = "Hidden";
        Label = "Sequence Number";
    }
#M245B2 CHANGES START HERE     
#FFF10Q CHANGES START HERE
#    INOUT MIR-PMT-CRCY-CD
#       {
#           Length = "2"; 
#           SType = "Hidden";
#           Label = "Currency";
#   }
#M245B2 CHANGES END HERE 
   INOUT MIR-TRXN-CRCY-CD-T[50]
  
       {
         Length = "2";
         FieldGroup = "Table1";         
         SType = "Hidden";
         Label = "Transaction currency code";
         Index = "1";
     }
#FFF10Q CHANGES END HERE

#M319B1 CHANGES START HERE     
    INOUT MIR-PREM-CRCY-CD
       {
           Length = "2"; 
           SType = "Hidden";
           Label = "Currency";
   }
#M319B1 CHANGES END HERE

#TL0763 CHANGES START HERE
    OUT MIR-CSV-ELPSD-DUR
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Elapsed Duration of CSV";
    }
#TL0763 CHANGES END HERE
}
