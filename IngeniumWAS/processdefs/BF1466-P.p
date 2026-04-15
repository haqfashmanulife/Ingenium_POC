# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1466-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS044  CTS      CANCELLATION SCREEN CHANGES                               *
#*******************************************************************************

P-STEP BF1466-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1466";
        BusinessFunctionName = "Cancellation process";
        BusinessFunctionType = "Tcncl";
        MirName = "CCWM0691";
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
        Label = "Process Date";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Pay Out Method";
    }

    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch ID";
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

    INOUT MIR-DV-SURR-TAX-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-SURR-TAX-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Tax Reporting Override";
    }

    INOUT MIR-DV-TAX-OVRID-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Tax Override";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
     
    INOUT MIR-DV-SURR-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-SURR-REASN-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Reason for Surrender";
    }
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

    INOUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
     
    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Product Name";
    }
	
    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
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
	
    OUT MIR-SURR-FORM-ACPT-DT
    { 
        Length = "10";
        DBTableName = "TPOL";        
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
    
    OUT MIR-ASIGN-SURR-EFF-DT
    { 
        Length = "10";
        DBTableName = "TPOL";                
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
    
    OUT MIR-POL-STEP-IN-RIGHT-IND
    { 
        Length = "1";
        DBTableName = "TPOL";                
        SType = "Indicator";
        Label = "Policy with Step-In Right";
    }    

    OUT MIR-DV-UNEARN-PREM
    { 
        DisplayOnly;
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Unearned Premium";
    } 
#UY3053 CHANGES STARTS HERE    
    OUT MIR-INCR-SRVBEN-AMT 
    { 
      Signed;
      Length = "17";
      SType = "Currency";
      Label = "CSV of Increased Survival Benefit";
    }
      
    OUT MIR-INCR-WL-AMT 
    { 
      Signed;
      Length = "17";
      SType = "Currency";
      Label = "CSV of Increased Whole Life";
    }
    
    OUT MIR-VEST-AMT 
    { 
      Signed;
      Length = "17";
      SType = "Currency";
      Label = "Vesting Amount";
    }
      
    OUT MIR-CNVR-BAL-AMT 
    { 
      Signed;
      Length = "17";
      SType = "Currency";
      Label = "CSV of Conversion Balance";
    }
    
    OUT MIR-TAX-QUAL-AMT 
    { 
      Signed;
      Length = "17";
      SType = "Currency";
      Label = "Tax Qualification amount";
    }
      
    OUT MIR-DEFR-DIV-AMT 
    { 
      Signed;
      Length = "17";
      SType = "Currency";
      Label = "Dividend Amount";
    }
    
    OUT MIR-EDUC-ANN-AMT 
    { 
      Signed;
      Length = "17";
      SType = "Currency";
      Label = "Dividend Amount";
    }  
#UY3053 CHANGES ENDS HERE    
    OUT MIR-APL-BAL-AMT
    { 
        DisplayOnly;
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "APL Balance";
    }        

    OUT MIR-DV-APL-INT-AMT
    { 
        DisplayOnly;
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Interest";
    }    
    
    OUT MIR-CSH-LOAN-BAL
    { 
        DisplayOnly;
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy loan Balance";
    } 
    OUT MIR-DV-CSH-LOAN-INT
    { 
        DisplayOnly;
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Policy loan Interest";
    }    

    OUT MIR-OVR-SHRT-PREM-AMT
    { 
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Currency";        
        Label = "Excess/Shortage in Premium";        
    } 
    OUT MIR-LOAN-XCES-SHRT-AMT
    { 
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Currency";        
        Label = "Overpaid/Shortage of policy loan interest";       
    } 
#   M166P1 changes ends here 
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
#   Q10672 - CHANGES STARTS HERE

    OUT MIR-BASE-POL-CSV
    { 
        DisplayOnly;
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Base Policy CSV";
    }    
    
    OUT MIR-TOT-PAYOUT-AMT
    { 
        DisplayOnly;
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Payout amount";
    }  

    INOUT MIR-SUR-TYP-IND
    {
        Length = "1";
        SType="Hidden";
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

    INOUT MIR-POL-CRCY-CD
    {
               
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
      
    INOUT MIR-OVR-SHRT-PREM-CRCY-CD    
     {
              
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
      }    

    INOUT MIR-CC-SUSP-CRCY-CD    
    {
              
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 
    
    INOUT MIR-DV-HO-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Head Office Received Date";
    }
  INOUT MIR-DV-PAYO-JPY-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY BENEFIT RIDER INDICATOR";
    }  
    INOUT MIR-DV-POL-VAL-AMT
    { 
        DisplayOnly;
        Length = "20";
        SType = "Currency";
        Label = "Base Policy Value";
    }
    INOUT MIR-DV-MKT-VAL-ADJ-AMT
    { 
        CurrencyCode = "MIR-POL-CRCY-CD";    
        DisplayOnly;
        Length = "20";
        SType = "Currency";
        Label = "MVA Amount";
    }
    INOUT MIR-DV-JP-XCHNG-EFF-DT
    { 
        Length = "10";
        SType = "Date";
        Label = "Conversion Exchange Effective date";
        
    }
    INOUT MIR-DV-JP-XCHNG-RT
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";     
    } 
   INOUT MIR-PAYO-CRCY-CD
    {
         
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }     

    INOUT MIR-MRF-IND-1
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }
        
    INOUT MIR-BNK-ID-1
    {
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID-1
    {
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID-1
    {
        Length = "17";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-1
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD-1
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Account Type";
    }
    
    OUT MIR-BNK-NM-1        
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM-1     
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Branch Name";
    }
    
    OUT MIR-DV-NATNL-TAXWH-AMT
    { 
        DisplayOnly;
        Length = "20";
        SType = "Currency";
        Label = "Separate Withholding Tax (Income Tax)";
    }
    OUT MIR-DV-LOC-TAXWH-AMT
    { 
        DisplayOnly;
        Length = "20";
        SType = "Currency";
        Label = "Separate Withholding Tax (Local Tax)";
    } 
      
    OUT MIR-SRVBEN-DEFR-AMT
      {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival Benefit Deferral Amount";
      } 
    OUT MIR-SRVBEN-DEFR-INT-AMT 
      {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Interest";
      }
#UY3071 Changes Start Here
    OUT MIR-HLTBEN-DEFR-AMT 
      {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Health Congratulatory Benefit";
      }
#UY3071 Changes End Here       
#MP302K- Changes Ends here 
    OUT MIR-DV-PREM-RFND-AMT        
    {         
        DisplayOnly;        
        Length = "20";        
        SType = "Currency";        
        Label = "Premium Refund(JPY)";        
    }
    INOUT MIR-DBL-DISB-IND
    {               
        Length = "1";
        SType = "Hidden";
        Label = "Double Disbursement Indicator";
    }    
    INOUT MIR-PMT-CRCY-CD
    {       
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }  
     INOUT MIR-PREM-CRCY-CD
    {       
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }         

    INOUT MIR-DT-OF-DTH
    {
        Length = "10";
        SType = "Date";
        Label = "Date of Death of the Policyholder";
    }
    INOUT MIR-CLMT-CAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLMT-CAT-CD";
        DBTableName = "Derived";        
        SType = "Selection";
        Label = "Claimant Category";
    }
    INOUT MIR-CLMT-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Claimant Client Id";
    }

    OUT MIR-REMIT-DT
    { 
        Length = "10";
        DBTableName = "TFBNK";
        SType = "Date";
        Label = "Remittance Date";
     
    }     
}
