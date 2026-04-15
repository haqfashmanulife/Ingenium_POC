# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9E41-O.s                                                    *
#*  Description: Maturity Processing - Confirm  Transaction                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802E  13APR22  Intial Version                                            *
#*  27549A-CHANGES DONE AS PART OF CDAP PROJ                                   *

#*******************************************************************************

S-STEP BF9E41FA-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Prcesmat";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policyholder Name";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

   IN MIR-POL-ID-SFX
   {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
   }

   IN MIR-PRCES-DT
   {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";       
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
 
   IN MIR-JRNL-DT
   {
         Length = "10";
         SType = "Date";
         Label = "Journal Date";       
     } 
        
   IN MIR-APPL-CTL-PRCES-DT
   {
	DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
        
    }   

   IN MIR-DV-HO-RECV-DT
   {
        DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";		
   }

   IN MIR-POL-BILL-MODE-CD
   {      
         DisplayOnly;
         Length = "2";
         CodeSource = "DataModel";
         CodeType = "PLAN-BILL-MODE-CD";
         SType = "Text";
         Label = "Billing Mode";
     } 
     
   IN MIR-TOT-PD-PREM-AMT
   {
         DisplayOnly;           
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "Total Premium Paid for the Policy";
   }         

   IN MIR-EVNT-ACTV-CD
   {
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "EVNT-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
   }
    
   IN MIR-POL-PERI-CD
   {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PERI-CD";
        SType = "Text";
        Label = "Policy Period";
   }

   IN MIR-POL-MAT-DT 
   {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Maturity Date";
   }

   IN MIR-MATURITY-AMT
   {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maturity amount";
   }  

   IN MIR-SEG-FND-AMT
   {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Fund Amount";
   }  

   IN MIR-POL-CHNG-DT
   {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Change Date";
   } 

   IN MIR-SNGL-PREM-PLAN-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan ID after change";
     }   

   IN MIR-POL-PERI-DUR
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PERI-CD";
        SType = "Text";
        Label = "Policy Period";
    }

   IN MIR-SNGL-PREM-FACE-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Face Amount after Change";
     }

   IN MIR-ORIG-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "(Reference)Face Amount Before Change";
     }

   IN MIR-CVG-NUM-T[99]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

   IN MIR-PLAN-ID-T[99]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

   IN MIR-CVG-CSTAT-CD-T[99]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

   IN MIR-CDI-CVG-ALLOC-AMT-T[99]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Allocation Amount to Coverage";
        Index = "1";
    }

   IN MIR-DV-FND-DESC-TXT-T[99]
    {
        DisplayOnly;
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

   IN MIR-CDI-ALLOC-PCT-T[99]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "0";
        FieldGroup = "Table99";
        SType = "Percent";
        Label = "Allocation Percentage to Fund";
        Index = "1";
    }

   IN MIR-CDI-ALLOC-AMT-T[99]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Amount Allocation to Fund";
        Index = "1";
    }

   IN MIR-CFN-STAT-CD-T[99]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

   IN MIR-DV-JS-LOAD-CD-T[99]
      {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Java Script Load Code";
        Index = "1";
    }

   IN MIR-SNGL-PREM-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Single Premium";
     }   

    IN MIR-PAYMT-MAT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maturity amount";
    }  

    IN MIR-SHRT-PREM-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Shortage Premium";
    }
    
   IN MIR-DV-INC-TAXWH-AMT
    { 
        DisplayOnly;
        Length = "20";
        SType = "Currency";
        Label = "Separate Withholding Tax (Income Tax)";
    }
    
   IN MIR-DV-LOC-TAXWH-AMT
    { 
        DisplayOnly;
        Length = "20";
        SType = "Currency";
        Label = "Separate Withholding Tax (Local Tax)";
    }

   IN MIR-PRE-PAY-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Prepayment Interest";
    }

   IN MIR-OVR-PAID-PREM-AMT
    {
    
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Overpaid Premium";
    }

   IN MIR-POL-BT-SUSP-AMT
    {   
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Bank Transfer Suspense"; 
    }
    
   IN MIR-POL-PD-SUSP-AMT
    {   
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Payroll Deduction Suspense"; 
    }
    
   IN MIR-POL-CC-SUSP-AMT
    {   
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Cash Collection Suspense"; 
    }

   IN MIR-REMIT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Remittance Amount";
    }

  IN MIR-PAYEE-NM-TXT
   {
     DisplayOnly;
     Label = "Kanji Payee Name:";
     Length = "50";
     SType = "Text";
   }  

  IN MIR-CLI-PSTL-CD
    {
        DisplayOnly;
        Length = "09";
        SType = "Text";
        Label = "Postal Code";     
     }
  IN MIR-DV-CLI-ADDR 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }
    
   IN MIR-CLI-ADDR-ADDL-TXT
    {
        Length = "60";
        SType = "Text";
        Label = "Samakata-bu";
    }
    
   IN MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }    
    
   IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

   IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
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
      Label = "Branch Name";
    }
 #27549A - CHANGES START HERE   
   IN MIR-ATO-NOT-APPL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }
#27549A- CHANGES ENDS HERE       
  }          