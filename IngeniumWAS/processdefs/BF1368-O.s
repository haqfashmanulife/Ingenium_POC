# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF1368-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  RPU002  CTS      SCREEN ENHANCEMENT FOR RPU PROCESSING SCREEN              *
#*  RPUV2B  CTS      SCREEN ENHANCEMENT FOR SULV2-RPU PROCESSING               *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *    
#*  UY3017  01APR23  ADDED NEW FIELDS FOR RPU PROCESS CHANGES                  * 
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF1368-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Prcesrpu";
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
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
#RPU002 changes begins        
#       Label = "Process Date";
        Label = "Company Received Date";
#RPU002 changes ends        
    }
    
    IN MIR-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }
   

    IN MIR-CVG-FACE-AMT
    {
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";        
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Face Amount";
    }
    
 # RPU002 CHANGES STARTS HERE
 #   IN MIR-CVG-NUM
 #   {
 #       DisplayOnly;
 #       Length = "2";
 #       DefaultConstant = "00";
 #       SType = "Text";
 #       Label = "Coverage Number";
 #   }
 # RPU002 CHANGES ENDS HERE

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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

# RPU002 CHANGES STARTS HERE     
    IN MIR-DV-PAYO-JPY-BNFT-CD
          {
            Length = "1";
            CodeSource = "DataModel";
            CodeType = "PAYO-JPY-BNFT-CD";
            SType = "Selection";
            Label = "JPY BENEFIT RIDER INDICATOR"; 
            
      }
      
    IN MIR-POL-BILL-MODE-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
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
        CurrencyCode="MIR-POL-CRCY-CD";
        DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "APL Balance";
    } 

    IN MIR-DV-APL-INT-AMT
    {    
        CurrencyCode="MIR-POL-CRCY-CD"; 
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
	CurrencyCode="MIR-POL-CRCY-CD";
        Label = "Policy Loan Balance";
    }
    
    IN MIR-LOAN-SHRT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
	CurrencyCode="MIR-POL-CRCY-CD";
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
#UY3017 CHANGES STARTS HERE     
     IN MIR-INCR-INS-CSV-AMT 
     {
         CurrencyCode="MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "CSV of Increased Survival benefit";
     } 
#UY3017 CHANGES ENDS HERE  
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
        CurrencyCode="MIR-POL-CRCY-CD";
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
        CurrencyCode="MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan Overpaid Amount ";
    } 
    
    IN MIR-PRE-PAY-INT-AMT	
    {
         CurrencyCode="MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Prepayment Interest";
     }
#UY3017 CHANGES STARTS HERE  
     IN MIR-NEW-CNVR-BAL-AMT 
     {
         CurrencyCode="MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "New Conversion Balance";
     }
#UY3017 CHANGES ENDS HERE     
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST START HERE 
    IN MIR-UNEARN-LOAN-INT-AMT	
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unearned Interest";
     }
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST END HERE 
  
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
   
        CurrencyCode="MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }   
    
    IN MIR-DV-PAYO-CSV-AMT
    {
   
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Remittance Amount(JPY)";
    } 
    
     IN MIR-DV-JP-XCHNG-RT  
     {
    
         DisplayOnly;
         Signed;
         Length = "17";
         Label = "JPY Exchange Rate";
     }    
    IN MIR-POL-CRCY-CD
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Hidden";
        Label = "Currency Used for Balances";
    }
    IN MIR-PMT-CRCY-CD
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Hidden";
        Label = "Currency Used for Balances";
    }
    
   IN MIR-DV-HO-RECV-DT
       {
           Length = "10";
           SType = "Date";
           Label = "Head Office Received Date";
       }  
       
   IN MIR-DV-TRNXT-PAYO-MTHD-CD
       {
           Length = "1";
           CodeSource = "DataModel";
           CodeType = "DV-TRNXT-PAYO-MTHD-CD";
           SType = "Selection";
           DBTableName = "Derived";
           Label = "Pay Out Method";
       }
       
       
    IN MIR-JRNL-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
        
     } 
     
    IN MIR-PD-PREM-AMT
       {
           DisplayOnly;       
           CurrencyCode="MIR-PMT-CRCY-CD";       
           Signed;
           Length = "17";
           SType = "Currency";
           Label = "Paid Amount";
       }     

#RPU002 CHANGES ENDS HERE    

#RPUV2B CHANGES STARTS HERE   

    IN MIR-RPU-POL-TYP-CD
    {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "RPU-POL-TYP-CD";
        SType = "Selection";
        Label = "RPU Policy Type";	
    }     
#RPUV2B CHANGES ENDS HERE  
#27549A - CHANGES START HERE    
    IN  MIR-ATO-NOT-APPL-IND
    {
         Length = "1";
         SType = "Indicator";
         Label = "ATO not applicable";
    } 
#27549A- CHANGES ENDS HERE
}

