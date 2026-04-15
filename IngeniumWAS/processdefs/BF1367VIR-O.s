# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF1367VIR-O.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  S23997  CTS      FIX TO INCLUDE MIR FIELDS AS PART OF UYS043               *
#*******************************************************************************

S-STEP BF1367VIR-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quoterpu";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";

        Label = "Company Received Date";
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
       DefaultSession = "MIR-POL-ID-SFX";
       SType = "Text";
       Label = "Suffix";
   }
       
    IN MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY BENEFIT RIDER INDICATOR"; 
        
      }           
      
    IN MIR-CVG-FACE-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Face Amount";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";       
    }
        
    IN MIR-POL-BILL-MODE-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    }    
    
    IN MIR-PLAN-ID
    {
        Key;
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
        SType = "Date";
        Label = "Issue Effective Date";
    } 
	
    IN MIR-APL-BAL-AMT
    {  
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "APL Balance";
    } 

    IN MIR-DV-APL-INT-AMT
    {    
        CurrencyCode = "MIR-POL-CRCY-CD"; 
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "APL Interest";
    } 
    
    IN MIR-LOAN-BAL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Policy Loan Balance";
    }
    
    IN MIR-LOAN-SHRT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Policy Loan Shortage Amount";
    }  
    
    IN MIR-OS-PREM-AMT
    {

	CurrencyCode="MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Premium";
    }    
    
    IN MIR-SHRT-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
	CurrencyCode = "MIR-PMT-CRCY-CD";
        Label = "Shortage Premium";
    }
    
    IN MIR-DV-NET-GCSV-AMT 
    {
    CurrencyCode="MIR-POL-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Coverage Net Surrender Value";
    } 
    
    IN MIR-UNADJ-RPU-FACE-AMT
    {
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD"; 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Unadjusted RPU Face Amount";
    }    
    
    IN MIR-ADJ-RPU-FACE-AMT
    {
        DisplayOnly;	
         CurrencyCode = "MIR-POL-CRCY-CD";	 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted RPU Face Amount";
    }    
    
    IN MIR-CSV-RFND-AMT 

    {
        CurrencyCode = "MIR-POL-CRCY-CD";
	DisplayOnly;
	Label = "CSV Refund Amount";
	Length = "15";
	SType = "Currency";
	
    }
    
    IN MIR-RPU-PLAN-ID
  {
    DisplayOnly;
    Length = "6";
    CodeSource = "EDIT";
    CodeType = "PUPLN";
    SType = "Text";
    Label = "RPU Policy Type";
    } 
    
    
    IN MIR-RPU-CVG-DUR
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PUDUR";
        Label = "RPU Coverage Duration";
    }    
        
    IN MIR-RPU-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "RPU Effective Date";
    }  
    
    IN MIR-REMIT-AMT
    {

         CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Remittance Amount(Policy Currency)";
    }   
    
    IN MIR-OVR-PAID-PREM-AMT
    {
    
	CurrencyCode = "MIR-PMT-CRCY-CD";    
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Overpaid Premium";
    }
    
    IN MIR-POL-LOAN-OVR-PAID-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan Overpaid Amount ";
    } 
    
    IN MIR-PRE-PAY-INT-AMT	
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Prepayment Interest";
     }
    IN MIR-UNEARN-INT-AMT	
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unearned Interest";
     } 
   
# S23997 CHANGES START HERE 
    IN MIR-UNEARN-LOAN-INT-AMT	
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unearned Interest";
     } 

    IN MIR-DFRL-SURV-BNFT-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Deferral Survival Benefit";
     }
    IN MIR-DFRL-INT-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Deferral Interest";
     }
#S23997 CHANGES ENDS     

    IN  MIR-DV-JP-XCHNG-EFF-DT
   { 
       Length = "10";
       SType = "Date";
       Label = "JPY Exchange Effective date";
    }
    
  
    
    IN MIR-ADJ-RPU-SRC-AMT
    {
        DisplayOnly;
         CurrencyCode = "MIR-POL-CRCY-CD";	 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted RPU Source Amount";
    }  
    
    IN MIR-UNADJ-RPU-SRC-AMT
    {
        DisplayOnly;	
         CurrencyCode = "MIR-POL-CRCY-CD";	 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Unadjusted RPU Source Amount";
    }    
    
   IN MIR-DV-LOAN-INT-AMT
    {
   
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }   
    
    IN MIR-DV-PAYO-CSV-AMT
    {

	CurrencyCode = "MIR-PMT-CRCY-CD";    
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Remittance Amount(JPY)";
    } 
    
     IN MIR-DV-JP-XCHNG-RT  
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
    

   IN MIR-RPU-POL-TYP-CD
      {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "RPU-POL-TYP-CD";
        SType = "Selection";
        Label = "RPU Policy Type";
      }     


   IN  MIR-VIR-SCREEN-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Check when doing virtual quote";
     }
     
    IN MIR-VIR-TRAD-PD-TO-MO-NUM
    {
    
        Label = "Next Payment Date:";
        DisplayOnly;
        Length = "07";
        SType = "text";
    }  
    
    IN MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
 
        Label = "Elapsed years:";
        DisplayOnly;
        Length = "07";
        SType = "text";
    } 
    
    IN MIR-VIR-ACTV-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Active";
    }
    
    IN MIR-VIR-BILL-MODE-CD
    {
        DisplayOnly;    
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment frequency";
    } 
    
    IN MIR-VIR-LOAN-AMT
    {   
        DisplayOnly;    
        Signed;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "13";
        SType = "Currency";
        Label = "Policy loan balance:";
    }  
    
    IN MIR-VIR-INT-STR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Interest start date";
    }  
    
    IN MIR-VIR-APL-LOAN-AMT
    {   
        DisplayOnly;
        Signed;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "13";
        SType = "Currency";
        Label = "APL balance:";
    }     
    
    IN MIR-VIR-POL-LOAN-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "APL date";
    }    
    
    IN MIR-VIR-PREPAY-MNG-IND
    {
        DisplayOnly;    
        Length = "1";
        SType = "Indicator";
        Label = "Prepayment management";
    }
    
    IN MIR-VIR-SEI-ASS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Seizure assignment";
    }    
    
    IN MIR-VIR-CVG-NUM-T[99] 
    {   
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        KeyColumn;
        Label = "Coverage No";
        Length = "2";
        SType = "Text";
    }

    IN MIR-VIR-PLAN-ID-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Plan";
        Length = "40";
        SType = "Text";
    }

    IN MIR-VIR-CVG-FACE-AMT-T[99] 
    {   
        CurrencyCode = "MIR-POL-CRCY-CD";     
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }      
       
}

