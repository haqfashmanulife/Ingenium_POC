# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9E41P.p                                                     *
#*  Description: Maturity Processing Screen                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802E  13APR22  Intial Version                                            *
#*  PM0481  28DEC22  PMG-481 ENHANCMENT FOR WEBSERVICE                         *
#*  UY3048  06MAY23  CTS    ENHANCMENT FOR MATURITY DEFERMENT                  *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP                              *
#*******************************************************************************

P-STEP BF9E41-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E41";
        BusinessFunctionName = "Maturity Processing ";
        BusinessFunctionType = "Prcesmat";
        MirName = "SCWM9E39";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        DBTableName = "Derived";
        Label = "Process State";
    }
    INOUT MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType="Hidden";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

   INOUT MIR-PRCES-DT
    {
      
        Length = "10";
        DBTableName = "TMAST";
        SType = "Date";
        Label = "Process Date";       
    }
    
   INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        DBTableName = "Derived";
        Label = "Payout Method";
       }

   INOUT MIR-JRNL-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
        
     }
     
  INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
     }
     
   INOUT MIR-DV-HO-RECV-DT
       {
           Length = "10";
           SType = "Date";
           Label = "Head Office Received Date";
       }     

   OUT MIR-TOT-PD-PREM-AMT
       {
          Length = "17";
          Signed;
          SType = "Currency";
          Label = "Total Premium Paid for the Policy";
       }     

    INOUT MIR-EVNT-ACTV-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EVNT-ACTV-TYP-CD";
        SType = "Selection";
        Label = "Activity Type";
    }

    INOUT MIR-POL-PERI-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PERI-CD";
        SType = "Text";
        Label = "Policy Period";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    } 

    OUT MIR-DV-POL-PAYO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        SType = "Text";
        Label = "Allocation Type";
    }

    OUT MIR-POL-MAT-DT 
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TCVG";
        Label = "Maturity Date";
    }

    OUT MIR-MATURITY-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Maturity amount";
    }  

    OUT MIR-SEG-FND-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Fund Amount";
    }  

    OUT MIR-POL-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Change Date";
    } 

    OUT MIR-SNGL-PREM-PLAN-ID
    {
       
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan ID after change";
     }   

    OUT MIR-POL-PERI-DUR
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PERI-CD";
        SType = "Text";
        Label = "Policy Period";
    }

    OUT MIR-SNGL-PREM-FACE-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Face Amount after Change";
    }
 

    OUT MIR-ORIG-FACE-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "(Reference)Face Amount Before Change";
     }

    INOUT MIR-CVG-NUM-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[99]
    {
        Length = "6";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    INOUT MIR-CDI-CVG-ALLOC-AMT-T[99]
    {
        Length = "15";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Allocation Amount to Coverage";
        Index = "1";
    }

    OUT MIR-DV-FND-DESC-TXT-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund Name";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-PCT-T[99]
    {
        Length = "7";
        Decimals = "0";
        FieldGroup = "Table99";
        SType = "Percent";
        Label = "Allocation Percentage to Fund";
        Index = "1";
    }

    OUT MIR-CDI-ALLOC-AMT-T[99]
    {
        Length = "15";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Amount Allocation to Fund";
        Index = "1";
    }

    OUT MIR-DV-JS-LOAD-CD-T[99]
    {
        Length = "1";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Java Script Load Code";
        Index = "1";
    }

    OUT MIR-CFN-STAT-CD-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-SNGL-PREM-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Single Premium";
     }   

    OUT MIR-PAYMT-MAT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Maturity amount";
    } 

    OUT MIR-SHRT-PREM-AMT
    {
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Shortage Premium";
    }
    
    INOUT MIR-DV-INC-TAXWH-AMT
    { 
        Length = "15";
        SType = "Currency";
        Label = "Separate Withholding Tax (Income Tax)";
    }
    
    INOUT MIR-DV-LOC-TAXWH-AMT
    { 
        Length = "15";
        SType = "Currency";
        Label = "Separate Withholding Tax (Local Tax)";
    }

    OUT MIR-PRE-PAY-INT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Prepayment Interest";
     }

    OUT MIR-OVR-PAID-PREM-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Overpaid Premium";
    }

    OUT MIR-POL-BT-SUSP-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Bank Transfer Suspense"; 
    }
    
    OUT MIR-POL-PD-SUSP-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Payroll Deduction Suspense"; 
    }
    
    OUT MIR-POL-CC-SUSP-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Cash Collection Suspense"; 
    }
#UY3048 changes starts
     OUT MIR-UNPAID-PREM-AMT
     {
        Length = "15";
        SType = "Currency";
        Label = "Unpaid Premium";
     }    
    OUT MIR-LOAN-REPAY-AMT
    {
        Length = "15"; 
        SType = "Currency";
        Label = "Policy Loan Balance";
    }
    OUT MIR-APL-RPAY-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "APL Balance"; 
    }
    OUT MIR-APL-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "APL Interest"; 
    }
    OUT MIR-DELAY-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Delinquent Interest"; 
    }
    OUT MIR-POL-LOAN-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Policy loan interest(total)"; 
    }
    OUT MIR-LOAN-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Policy loan interest"; 
    }
    OUT MIR-LOAN-OVR-SHRT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Excess/Short Interest"; 
    }
    OUT MIR-UNEARN-LOAN-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Loan Interest (Unearned)"; 
    }
    OUT MIR-LOAN-XCES-SHRT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Excess Interest of Policy Loan Repayments"; 
    }
    OUT MIR-TOT-SCHLR-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Scholarship"; 
    }
    OUT MIR-TOT-EMP-DIV-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Employee dividends (total)"; 
    }
    OUT MIR-EMP-DIV-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Employee dividend"; 
    }
    OUT MIR-MAT-DIV-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Maturity Dividend"; 
    }
    OUT MIR-ACCUM-DIV-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Accumulated dividend"; 
    }
    OUT MIR-ADM-CNGRT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
#UY3136 changes starts        
       #Label = "Admission congratulatory fee"; 
        Label = "Educational Congratulatory Benefit";
#UY3136 changes Ends 
    }
    OUT MIR-SRV-BNFT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Survival benefit total"; 
    }
    OUT MIR-VEST-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Vesting amount"; 
    }
#UY3048 changes ENDS

    INOUT MIR-REMIT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Total Remittance Amount";
    }   
    
    INOUT MIR-BNK-ID
    {
       Length = "4";
       DBTableName = "TBNKB";
       SType = "Text";
       Label = "Bank Number";
     }
     
  INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }   
       
   
   INOUT MIR-BNK-BR-ID
      {
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Number";
      }
   
   INOUT MIR-BNK-ACCT-ID
     {
        Length = "17";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
     }
   
   INOUT MIR-BNK-ACCT-HLDR-NM
    {
      Length = "50";
      DBTableName = "TBNKA";
      SType = "Text";
      Label = "Account Holder Name";
    }
   
   INOUT MIR-BNK-ACCT-TYP-CD
    {
      Length = "3";
      CodeSource = "EDIT";
      CodeType = "FBACC";
      DBTableName = "TCLRL";
      SType = "Selection";
      Label = "Account Type";
    }
    
   INOUT MIR-PAYE-CLI-FRST-NM
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CLI-LAST-NM
    {
       Length = "25";
       DBTableName = "CLNM";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    INOUT MIR-PAYE-CO-NM
    {
       Length = "50";
       DBTableName = "CLNC";
       SType = "Text";
       Label = "Company Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD
    {
       Length = "8";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Address Code";
    }
    
   OUT MIR-PAYEE-NM-TXT
  {
     DisplayOnly;		
     Label = "Kanji Payee Name:";
     Length = "50";
     SType = "Text";
  }  

    INOUT MIR-CLI-PSTL-CD
    {
       Length = "9";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Postal Code";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Samakata-bu";
    }

    INOUT MIR-DV-CLI-ADDR
    {
       Length = "50";
       DBTableName = "Derived";
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
#*  CHANGES PM0481  STARTS HERE 
    INOUT MIR-TOT-REMIT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "FINAL Remittance Amount";
    }     
#*  CHANGES PM0481  ENDS HERE   
#27549A - Changes Start here    
    INOUT MIR-ATO-NOT-APPL-IND
    {
         Length = "1";
         SType = "Indicator";
         Label = "ATO not applicable";
    }    
#27549A- Changes ends here
  }   