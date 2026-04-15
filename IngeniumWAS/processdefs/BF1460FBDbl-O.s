# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1460-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP271A  CTS      NEW S-STEP AS PART OF FRA                                 *
#*  M319O1  CTS      FXWL Currency Code Changes                                *
#*  130971  CTS      FIX DONE FOR FFF NOMURA                                   *
#*  130977  CTS      FIX DONE FOR ONLINE SCREEN PREMIUM REFUND CHANGES         *
#*******************************************************************************

S-STEP BF1460FBDbl-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Tsurr";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN LSIR-RETURN-CD
    {
        DisplayOnly;
    }

    IN MIR-RETRN-CD
    {
        DisplayOnly;
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
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

    IN MIR-MRF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
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

    IN MIR-DV-SURR-TAX-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-SURR-TAX-CD";
        SType = "Text";
        Label = "Tax Reporting Override";
    }

    IN MIR-DV-TAX-OVRID-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Tax Override";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

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
     
    IN MIR-DV-SURR-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-SURR-REASN-CD";
        SType = "Text";
        Label = "Reason for Surrender";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }
     
    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Product Name";
    }

    IN MIR-JRNL-DT
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
    }

#  ISLADM Changes Start here     
#    IN MIR-HO-FORM-ACPT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    IN MIR-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here  

    IN MIR-PAYE-CLI-FRST-NM 
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    IN MIR-PAYE-CLI-LAST-NM 
    {
       DisplayOnly;
       Length = "25";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    IN MIR-PAYE-CO-NM 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Company Name";
    }

    IN MIR-CLI-ADDR-LOC-CD 
    {
       DisplayOnly;
       Length = "8";
       SType = "Text";
       Label = "Address Code";
    }

    IN MIR-CLI-PSTL-CD 
    {
       DisplayOnly;
       Length = "9";
       SType = "Text";
       Label = "Postal Code";
    }

    IN MIR-CLI-ADDR-ADDL-TXT
    {
       DisplayOnly;
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }

    IN MIR-DV-CLI-ADDR 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
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
      Label = "Bank Branch Name";
    }
  
    IN MIR-SURR-FORM-ACPT-DT
    { 
        DisplayOnly;
        Length = "10";       
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
    
    IN MIR-ASIGN-SURR-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
    
    IN MIR-POL-STEP-IN-RIGHT-IND
    { 
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy with Step-In Right";
    }    

    IN MIR-DV-UNEARN-PREM
    {    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
        DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Unearned Premium";
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
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "APL Interest";
    }    

    IN MIR-CSH-LOAN-BAL
    {  
        CurrencyCode = "MIR-POL-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Policy loan Balance";
    } 
    
    IN MIR-DV-CSH-LOAN-INT
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Policy loan Interest";
    }

    IN MIR-OVR-SHRT-PREM-AMT
    {    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
      #FFF10R CHANGES STARTS HERE
      #  CurrencyCode = "MIR-PMT-CRCY-CD";         
        CurrencyCode = "MIR-OVR-SHRT-PREM-CRCY-CD";       
#FFF10R CHANGES ENDS HERE     
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
	DisplayOnly;
	Length = "20";
	SType = "Currency";	
	Label = "Excess/Shortage in Premium";
    } 
    
    IN MIR-LOAN-XCES-SHRT-AMT
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";	
	Label = "Overpaid/Shortage of policy loan interest";
    }

    IN MIR-BASE-POL-CSV
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Base Policy CSV";
    }

    IN MIR-TOT-PAYOUT-AMT
    { 
        CurrencyCode ="MIR-PAYO-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Total Payout amount";
    }
    
    IN MIR-SUR-TYP-IND
    {
        Length = "1";
        SType="Hidden";
    }
    IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType="Hidden";
    }
    INOUT MIR-DV-COMMIT-CD
    {
          Length = "1";
          SType="Hidden";
    }

    IN MIR-POL-CRCY-CD
        {
            
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }
    
    IN MIR-DV-HO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }
  IN MIR-DV-PAYO-JPY-BNFT-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    SType = "Selection";
    Label = "JPY BENEFIT RIDER INDICATOR";
  }  
    IN MIR-DV-POL-VAL-AMT
    { 
            CurrencyCode = "MIR-POL-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Base Policy Value";
    }
    IN MIR-DV-MKT-VAL-ADJ-AMT
    { 
        Signed;    
        CurrencyCode = "MIR-POL-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "MVA Amount";
    }
    IN MIR-DV-JP-XCHNG-EFF-DT
    { 
	DisplayOnly;
	Length = "10";
	SType = "Date";
	Label = "Conversion Exchange Effective date";
    }
    IN MIR-DV-JP-XCHNG-RT
    { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";     
    }  
   IN MIR-PAYO-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }      

#M271O1 CHANGES START HERE  
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#  MP271A CODE CHANGES STARTS HERE
    IN MIR-MRF-IND-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }

    IN MIR-BNK-ID-1
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID-1
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-BNK-ACCT-ID-1
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM-1
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-BNK-ACCT-TYP-CD-1
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Text";
        Label = "Account Type";
    }
    
    IN MIR-BNK-NM-1 
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }
    
    IN MIR-BNK-BR-NM-1
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Bank Branch Name";
    }
    
    IN MIR-PMT-CRCY-CD
    {
      Length = "2";
      SType = "Hidden";
      Label = "Currency";
    }    
    
#FFF10R CHANGES START HERE 

     IN MIR-OVR-SHRT-PREM-CRCY-CD    
     {
              
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
     }       
#FFF10R CHANGES ENDS HERE      

#130977 CHANGES START HERE 

     IN MIR-CC-SUSP-CRCY-CD    
     {
              
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
     }       
#130977 CHANGES ENDS HERE      

    IN MIR-DV-NATNL-TAXWH-AMT
    { 
        Signed;    
        CurrencyCode = "MIR-PAYO-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Separate Withholding Tax (Income Tax)";
    }
    IN MIR-DV-LOC-TAXWH-AMT
    { 
        Signed;    
        CurrencyCode = "MIR-PAYO-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Separate Withholding Tax (Local Tax)";
    } 
    IN MIR-DV-PREM-RFND-AMT    
    {     
        Signed;
#130971 CHANGES START HERE	        
#       CurrencyCode = "MIR-PMT-CRCY-CD";    
#130977 CHANGES START HERE
#    CurrencyCode = "MIR-OVR-SHRT-PREM-CRCY-CD";
     CurrencyCode = "MIR-CC-SUSP-CRCY-CD";
#130977 CHANGES END HERE    
#130971 CHANGES END HERE
	DisplayOnly;    
	Length = "20";    
	SType = "Currency";    
	Label = "Premium Refund(JPY)";    
    }            
#  MP271A CODE CHANGES ENDS HERE
}