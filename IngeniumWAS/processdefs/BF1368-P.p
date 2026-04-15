# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF1368-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  RPU002  CTS      SCREEN ENHANCEMENT FOR RPU PROCESSING                     *
#*  132867  CTS      RPU Webservice Defect fix
#*  RPUV2B  CTS      SCREEN ENHANCEMENT FOR SULV2-RPU PROCESSING               *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  UY3017  01APR23  ADDED NEW FIELDS FOR RPU PROCESS CHANGES                  *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

P-STEP BF1368-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1368";
        BusinessFunctionName = "Service Transaction - Process RPU";
        BusinessFunctionType = "Prcesrpu";
        MirName = "CCWM0661";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
#RPU002 CHANGES STARTS HERE
#        Label = "Process Date";
         Label = "Company Received Date";
#RPU002 CHANGES ENDS HERE
    }

#   INOUT MIR-CVG-FACE-AMT
#   {
#       Mandatory;
#       Signed;
#       Length = "15";
#       DBTableName = "TCVG";
#       SType = "Currency";
#       Label = "Face Amount";
#   }

#RPU002 CHANGES STARTS FROM HERE
#   INOUT MIR-CVG-NUM
#   {
#       Length = "2";
#       DBTableName = "TCVG";
#       DefaultConstant = "00";
#       SType = "Text";
#       Label = "Coverage Number";
#   }
#RPU002 CHANGES ENDS HERE

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

#RPU002 CHANGES STARTS HERE
    INOUT MIR-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }
#RPU002 CHANGES ENDS HERE    

#RPU002 CHANGES STARTS HERE
#    OUT MIR-DV-OWN-CLI-NM
     INOUT MIR-DV-OWN-CLI-NM
#RPU002 CHANGES ENDS HERE    
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
       
     
#RPU002 CHANGES STARTS HERE      
     INOUT MIR-POL-BILL-MODE-CD
     {
       
         DisplayOnly;
         Length = "2";
         CodeSource = "DataModel";
         CodeType = "POL-BILL-MODE-CD";
         SType = "Text";
         Label = "Payment Mode";
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
         CurrencyCode = "MIR-POL-CRCY-CD";
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unadjusted RPU Face Amount";
     }    
     
     OUT MIR-ADJ-RPU-FACE-AMT
     {
         DisplayOnly;
         CurrencyCode = "MIR-POL-CRCY-CD";
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
         CurrencyCode = "MIR-POL-CRCY-CD";
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
       
    OUT MIR-DV-JP-XCHNG-EFF-DT
    { 
        Length = "10";
        SType = "Date";
        Label = "JPY Exchange Effective Date";
     }   
     
     OUT MIR-ADJ-RPU-SRC-AMT
     {
         DisplayOnly;
         CurrencyCode = "MIR-POL-CRCY-CD";
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Adjusted RPU Source Amount";
     }  
     
     OUT MIR-UNADJ-RPU-SRC-AMT
     {
         DisplayOnly;
         CurrencyCode = "MIR-POL-CRCY-CD";
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
         Signed;
         Length = "17";
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
   
   INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
       {
           Length = "1";
           CodeSource = "DataModel";
           CodeType = "DV-TRNXT-PAYO-MTHD-CD";
           SType = "Selection";
           DBTableName = "Derived";
           Label = "Pay Out Method";
       }
   
       INOUT MIR-BNK-ID
       {
           Length = "4";
           DBTableName = "TBNKB";
           SType = "Text";
           Label = "Bank Number";
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
   
   INOUT MIR-DV-HO-RECV-DT
       {
           Length = "10";
           SType = "Date";
           Label = "Head Office Received Date";
       }
   
       INOUT MIR-DV-PAYO-JPY-BNFT-CD
         {
           Length = "1";
           CodeSource = "DataModel";
           CodeType = "PAYO-JPY-BNFT-CD";
           SType = "Text";
           Label = "JPY Benefit Rider";
         } 

    INOUT MIR-JRNL-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
        
     } 

    OUT MIR-PD-PREM-AMT
       {
           CurrencyCode = "MIR-PMT-CRCY-CD";
           Signed;
           Length = "17";
           SType = "Currency";
           Label = "Paid Amount";
       }      
       
          INOUT MIR-PAYEE-NM-TXT
	{
		DisplayOnly;		
		Label = "Payee Name:";
		Length = "50";
		SType = "Text";
	}  
	
    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }   
    
      INOUT MIR-CSV-RFND-IND
      {
            Length = "1";
            SType="Hidden";
      }    
       
      INOUT MIR-PROD-TYP-TXT
      {
            Length = "20";
            SType="Hidden";
      }  
       
#RPU002 CHANGES ENDS HERE   
#132867 CHANGE START
      INOUT MIR-RPU-PLAN-TXT
      {
            Length = "30";
            SType="Hidden";
      }
#132867 CHANGE END

#RPUV2B CHANGES STARTS HERE   

    INOUT MIR-RPU-POL-TYP-CD
    {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "RPU-POL-TYP-CD";
        SType = "Selection";
        Label = "RPU Policy Type";	
    }     
#RPUV2B CHANGES ENDS HERE  
#27549A - CHANGES START HERE    
    INOUT MIR-ATO-NOT-APPL-IND
    {
         Length = "1";
         SType = "Indicator";
         Label = "ATO not applicable";
    } 
#27549A- CHANGES ENDS HERE         
}
    

