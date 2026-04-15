# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF1367-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  RPU001           ADDED MULTIPLE CHANGES FOR RPU                            *
#*  125619           ADDED FIX FOR CURRENCY CODE CHANGE                        *
#*  RPU016  01OCT20  CTS    ADDED CHANGES FOR WEBSERVICES (RPU QUOTE)  *       *
#*  132778           CHANGES FOR RPU QUOTE AND PROCESS                         * 
#*  RPUV2A           CHANGES FOR SULV2-RPU PROJECT                             * 
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  TLB053  22SEP21  ADDED NEW FIELDS FOR TLB COLI PRODUCT                     *
#*  UYS024  02JUN22  CHANGES FOR TRAIL CALC WEBSERVICE                         *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  UY3017  16MAR23  ADDED NEW FIELDS FOR RPU QUOTE CHANGES                    *
#*  R19898  04APR25  JBIPS-19,83&84 INC06520642_ RPU QUOTE(VIRTUAL QUOTE)CHANGE*
#*  R19898           OF THE FACE AMOUNT FIELD                                  *
#*******************************************************************************

P-STEP BF1367-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1367";
        BusinessFunctionName = "Service Transaction - Quote RPU";
        BusinessFunctionType = "Quoterpu";
        MirName = "CCWM0661";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
#RPU001 CHANGES STARTS HERE        
       #Label = "Process Date";
        Label = "Company Received Date";
#RPU001 CHANGES ENDS HERE        
       
    }

#RPU001 CHANGES STARTS HERE
    #INOUT MIR-CVG-NUM
    #{
     #   Length = "2";
     #  DBTableName = "TCVG";
     #   DefaultConstant = "00";
     #   SType = "Text";
     #   Label = "Coverage Number";
    #}
#RPU001 CHANGES ENDS HERE

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

#RPU001 CHANGES STARTS HERE
   INOUT MIR-POL-ID-SFX
   {
       Key;
       Length = "1";
       DBTableName = "TPOL";
       DefaultSession = "MIR-POL-ID-SFX";
       SType = "Text";
       Label = "Suffix";
   }
#RPU001 CHANGES ENDS HERE

   # OUT MIR-CVG-FACE-AMT
   # {
   #     Currency Code = MIR-POL-CRCY-CD; 
   #     Signed;
   #     Length = "15";
   #     DBTableName = "TCVG";
   #     SType = "Currency";
   #     Label = "Face Amount";
   # }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
#RPU001 CHANGES STARTS HERE        
    #    Label = "Owner Name";
         Label = "Policyholder Name";
#RPU001 CHANGES ENDS HERE         
    }
 
#RPU001 CHANGES STARTS HERE 
    INOUT MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY Benefit Rider";
      }  
      
     OUT MIR-POL-BILL-MODE-CD
     {
       
         DisplayOnly;
         Length = "2";
         CodeSource = "DataModel";
         CodeType = "PLAN-BILL-MODE-CD";
         SType = "Text";
         Label = "Billing Mode";
     }   
     
     OUT MIR-PLAN-ID
     {
         
         DisplayOnly;
         Length = "40";
         CodeSource = "EDIT";
         CodeType = "PLAN";
         SType = "Text";
         Label = "Plan";
     }
     
     OUT MIR-POL-ISS-EFF-DT
     {
         DisplayOnly;
         Length = "10";
         SType = "Date";
         Label = "Issue Effective Date";
     } 
     
     OUT MIR-CVG-FACE-AMT 
     {
     	DisplayOnly;
     	Signed;
     	Length = "16";
        CurrencyCode = "MIR-POL-CRCY-CD";
     	SType = "Currency";
     	Label = "Face Amount";
 	}
 	
     OUT MIR-APL-BAL-AMT
     {  
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
 	Length = "20";
 	SType = "Currency";
 	Label = "APL Balance";
     } 
 
     OUT MIR-DV-APL-INT-AMT
     {    
        CurrencyCode = "MIR-POL-CRCY-CD";
 	DisplayOnly;
 	Length = "20";
 	SType = "Currency";
 	Label = "APL Interest";
     } 
     
     OUT MIR-LOAN-BAL-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
 	 CurrencyCode = "MIR-POL-CRCY-CD";
         Label = "Policy Loan Balance";
     }
     
     OUT MIR-LOAN-SHRT-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
 	 CurrencyCode = "MIR-POL-CRCY-CD";
         Label = "Policy Loan Shortage Amount";
     }  
     
     OUT MIR-OS-PREM-AMT
     {
 
 	CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Outstanding Premium";
     }    
     
     OUT MIR-SHRT-PREM-AMT
     {
         Signed;
         Length = "17";
         DBTableName = "Derived";
         SType = "Currency";
         CurrencyCode = "MIR-PMT-CRCY-CD";         
         Label = "Shortage Premium";
     }
     
     OUT MIR-DV-NET-GCSV-AMT 
     {
         CurrencyCode="MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "Coverage Net Surrender Value";
     } 
#UY3017 CHANGES STARTS HERE     
     OUT MIR-INCR-INS-CSV-AMT 
     {
         CurrencyCode="MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "CSV of Increased Survival benefit";
     } 
#UY3017 CHANGES ENDS HERE 
     OUT MIR-UNADJ-RPU-FACE-AMT
     {
         DisplayOnly;
#125619 CHANGES STARTS HERE	 
         CurrencyCode = "MIR-POL-CRCY-CD";
#125619 CHANGES ENDS HERE	 	 
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unadjusted RPU Face Amount";
     }    
     
     OUT MIR-ADJ-RPU-FACE-AMT
     {
         DisplayOnly;
#125619 CHANGES STARTS HERE	 
         CurrencyCode = "MIR-POL-CRCY-CD";
#125619 CHANGES ENDS HERE	 
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Adjusted RPU Face Amount";
     }    
     
     
     OUT MIR-CSV-RFND-AMT 
 
     {
         CurrencyCode = "MIR-POL-CRCY-CD";
 	DisplayOnly;
 	Label = "CSV Refund Amount";
 	Length = "15";
 	SType = "Currency";
 	
     }
     
    OUT MIR-RPU-PLAN-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PUPLN";
        SType = "Text";
        Label = "RPU Policy Type";
     } 
     
     
     OUT MIR-RPU-CVG-DUR
     {
         DisplayOnly;
         Length = "6";
         CodeSource = "EDIT";
         CodeType = "PUDUR";
         Label = "RPU Coverage Duration";
     }    
         
     OUT MIR-RPU-EFF-DT
     {
         DisplayOnly;
         Length = "10";
         SType = "Date";
         Label = "RPU Effective Date";
     } 
      
     
     OUT MIR-REMIT-AMT
     {
#125619 CHANGES BEGINS
  #       CurrencyCode = "MIR-PMT-CRCY-CD";
         CurrencyCode = "MIR-POL-CRCY-CD";
#125619 CHANGES ENDS         
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Remittance Amount(Policy Currency)";
     }   
     
     OUT MIR-OVR-PAID-PREM-AMT
     {
         CurrencyCode = "MIR-PMT-CRCY-CD";     
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "Overpaid Premium";
     }
     
     OUT MIR-POL-LOAN-OVR-PAID-AMT
     {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "Policy Loan Overpaid Amount ";
     } 
     
     OUT MIR-PRE-PAY-INT-AMT
     {
        CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Prepayment Interest";
     }
     
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST START HERE 
     OUT MIR-UNEARN-LOAN-INT-AMT
     {
        CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unearned Interest";
     }
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST END HERE
#UY3017 CHANGES STARTS HERE 
#TLB053 CHANGES BEGINS
#   OUT MIR-DFRL-SURV-BNFT-AMT
#   {
#       CurrencyCode = "MIR-POL-CRCY-CD";
#        DisplayOnly;
#        Signed;
#        Length = "15";
#        SType = "Currency";
#        Label = "Deferral Survival Benefit";
#    }
#   OUT MIR-DFRL-INT-AMT
#   {
#       CurrencyCode = "MIR-POL-CRCY-CD";
#        DisplayOnly;
#        Signed;
#        Length = "15";
#        SType = "Currency";
#        Label = "Deferral Interest";
#    }
#TLB053 CHANGES ENDS
#UY3017 CHANGES ENDS HERE 
#UY3017 CHANGES STARTS HERE     
      OUT MIR-NEW-CNVR-BAL-AMT 
     {
         CurrencyCode="MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "New Conversion Balance";
     } 
#UY3017 CHANGES ENDS HERE   
    OUT MIR-DV-JP-XCHNG-EFF-DT
    { 
        Length = "10";
        SType = "Date";
        Label = "JPY Exchange Effective date";
     }   
     
     OUT MIR-ADJ-RPU-SRC-AMT
     {
         DisplayOnly;
#125619 CHANGES STARTS HERE	 
         CurrencyCode = "MIR-POL-CRCY-CD";
#125619 CHANGES ENDS HERE	 
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Adjusted RPU Source Amount";
     }  
     
     OUT MIR-UNADJ-RPU-SRC-AMT
     {
         DisplayOnly;
#125619 CHANGES STARTS HERE	 
         CurrencyCode = "MIR-POL-CRCY-CD";
#125619 CHANGES ENDS HERE	 
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unadjusted RPU Source Amount";
     }    
     
    OUT MIR-DV-LOAN-INT-AMT
     {
    
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "Policy Loan Interest";
     }   
     
     OUT MIR-DV-PAYO-CSV-AMT
     {
	 CurrencyCode = "MIR-PMT-CRCY-CD";    
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Remittance Amount(JPY)";
     }    
     
     OUT MIR-DV-JP-XCHNG-RT  
     {
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "JPY Exchange Rate";
     }
    INOUT MIR-POL-CRCY-CD
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Hidden";
        Label = "Currency Used for Balances";
    }
    INOUT MIR-PMT-CRCY-CD
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Hidden";
        Label = "Currency Used for Balances";
    }
        
      INOUT MIR-DV-UNDO-VALID-CD
      {
            Length = "1";
            SType="Hidden";
      }
      
      INOUT MIR-DV-COMMIT-CD
      {
            Length = "1";
            SType="Hidden";
      }
      
#RPU016 CHANGES STARTS HERE      
      
      OUT MIR-WARN-MSG-CD
      {
        Length = "01";
        SType = "Text";
	Label = "Warning Message Indicator";        
      }   
      
#RPU016 CHANGES ENDS HERE 
#132778 CHANGES STARTS HERE       
      INOUT MIR-PROD-TYP-TXT
      {
            Length = "20";
            SType="Hidden";
      } 
#132778 CHANGES ENDS HERE
#RPU001 CHANGES ENDS HERE

#RPUV2A CHANGES STARTS HERE

   INOUT MIR-RPU-POL-TYP-CD
      {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "RPU-POL-TYP-CD";
        SType = "Selection";
        Label = "RPU Policy Type";
      }     

#RPUV2A CHANGES ENDS HERE

#UYS043 CHANGES STARTS HERE
    INOUT MIR-VIR-SCREEN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Check when doing virtual quote";
    }

    INOUT MIR-VIR-TRAD-PD-TO-MO-NUM
    {
    
        Label = "Next Payment Date:";
        Length = "07";
        SType = "text";
    }  
    
    INOUT MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
 
        Label = "Elapsed years:";
        Length = "07";
        SType = "text";
    } 
    
     INOUT MIR-VIR-ACTV-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Active";
     }
     
     INOUT MIR-VIR-BILL-MODE-CD
     {
         Length = "40";
         CodeSource = "DataModel";
         CodeType = "PLAN-BILL-MODE-CD";
         SType = "Selection";
         Label = "Payment frequency";
     } 
       
     
     INOUT MIR-VIR-LOAN-AMT
     {   
         Signed;
         Length = "13";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Policy loan balance:";
     }  
     
     INOUT MIR-VIR-INT-STR-DT
     {
 
         Length = "10";
         SType = "Date";
         Label = "Interest start date";
     }  
     
     INOUT MIR-VIR-APL-LOAN-AMT
     {   
         Signed;
         Length = "13";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "APL balance:";
     }     
     
     INOUT MIR-VIR-POL-LOAN-EFF-DT
     {
 
         Length = "10";
         SType = "Date";
         Label = "APL date";
     }    
     
     INOUT MIR-VIR-PREPAY-MNG-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Prepayment management";
     }
     
     OUT MIR-VIR-SEI-ASS-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Seizure assignment";
     }    
     
     OUT MIR-VIR-CVG-NUM-T[99] 
     {
        
         FieldGroup = "Table99";
         DBTableName = "TCVG";
         Index = "1";
         KeyColumn;
         Label = "Coverage No";
         Length = "2";
         SType = "Text";
     }
 
     OUT MIR-VIR-PLAN-ID-T[99] 
     {
         CodeSource = "EDIT";
         CodeType = "PLAN";
         DBTableName = "TCVG";
         FieldGroup = "Table99";
         Index = "1";
         Label = "Plan";
         Length = "40";
         SType = "Text";
     }
#R19898 - CHANGES START HERE   
#     OUT MIR-VIR-CVG-FACE-AMT-T[99] 
      INOUT MIR-VIR-CVG-FACE-AMT-T[99] 
#R19898 - CHANGES ENDS HERE         
     {           
         FieldGroup = "Table99";
         DBTableName = "TCVG";
         Index = "1";
         Label = "Face Amount";
         Length = "16";
         SType = "Currency";
         Signed;
    } 

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
#UYS043 CHANGES ENDS HERE
#UYS024 CHANGES STARTS HERE
     OUT MIR-TOT-RPU-INCM-AMT
     {
	     CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Total Paid-up Income amount";
     }  
     
     OUT MIR-TOT-RPU-EXPNS-AMT
     {
	     CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Total Paid-up Expense";
     }  
     
     OUT MIR-NET-RPU-INCM-AMT
     {
	     CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Net Paid-up Income amount";
     }  
     
     OUT MIR-NET-RPU-EXPNS-AMT
     {
	     CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Net Paid-up Expense amount";
     } 
#Table fields  (income)
 
     OUT MIR-RPU-INCM-ACCT-NM-T[8]
    {
        Length ="30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Income Account Name";
        Index = "1";
    }
    OUT MIR-RPU-INCM-ACCT-CD-T[8]
    {
        Length ="10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Income Account Code";
        Index = "1";
    }     
 
    OUT MIR-RPU-INCM-AMT-T[8]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Income amount";
        Index = "1";
    } 
#Table fields  (Expense)  
     OUT MIR-RPU-EXPNS-ACCT-NM-T[8]
    {
        Length ="30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Expense Account Name";
        Index = "1";
    }
    OUT MIR-RPU-EXPNS-ACCT-CD-T[8]
    {
        Length ="10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Expense Account Code";
        Index = "1";
    }     
 
    OUT MIR-RPU-EXPNS-AMT-T[8]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Expense Amount";
        Index = "1";
    }  

    OUT MIR-CHNG-DTLS-MSG1
    {
        Length ="132";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Change Details Message 1";
    }

    OUT MIR-CHNG-DTLS-MSG2
    {
        Length ="132";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Change Details Message 2";
    }
#UYS024 CHANGES ENDS HERE
 
 }