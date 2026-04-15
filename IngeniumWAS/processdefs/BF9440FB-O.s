# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*  U40018  BP       Created For Firm Banking                                  *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  Q11534  CTS      LOAN RELATED CHANGES                                      *  
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271AA  CTS      FRA CHANGES FOR POST LAPSE SURRENDER  01SEP2015           *
#*  MP302K  CTS      ADDED FIELDS FOR SURVIVAL DEFFERAL PAYOUT                 *
#*                   AMOUNT AND DEFERRAL INTEREST AMOUNT                       *
#*  M319AB  CTS      FXWL FOREIGN CURRENCY FORMATTING 			       *
#*  MP334A  CTS      CHANGES DONE FOR THE ADDITION OF NEW FIELDS               *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP  PROJECT                     *
#*  UY3100  CTS      JIKKO POLICY                                              *

S-STEP BF9440FB-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "TPlaps";
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
    SType="Hidden";
  }

  IN MIR-APPL-CTL-PRCES-DT 
  {
    DisplayOnly;
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Process Date";
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

  IN MIR-POST-LAPS-SURR-AMT 
  {
    DisplayOnly;
    Signed;
    #M271AA CHANGES START HERE    
            CurrencyCode = "MIR-PAYO-CRCY-CD";
    #M271AA CHANGES END HERE 
    Length = "17";
    SType = "Currency";
    Label = "Post Lapse Surrender Amount";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-JRNL-DT
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Journal Date";
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
     
#  ISLADM Changes Start here     
#    IN MIR-HO-FORM-ACPT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        DefaultSession = "LSIR-PRCES-DT";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    IN MIR-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here        
     
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
#  Q11534 Changes Start here 

  IN MIR-DV-POL-CSV-AMT 
  {
 #M271AA CHANGES START HERE    
    CurrencyCode = "MIR-POL-CRCY-CD";
#M271AA CHANGES END HERE 
      DisplayOnly;
      Signed;
      Length = "19";
      SType = "Currency";
      Label = "Cash Surrender Value";
  }
  IN MIR-DV-UNEARN-PREM
  {
#M271O1 CHANGES START HERE 
    CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE  
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Unearned Premium";
  }
  IN MIR-PREM-XCES-SHRT-AMT
  {
#M271O1 CHANGES START HERE 
#M319AB CHANGES START HERE
#    CurrencyCode = "MIR-PREM-CRCY-CD";    
    CurrencyCode = "MIR-PMT-CRCY-CD";    
#M319AB CHANGES END HERE        
#M271O1 CHANGES END HERE      DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Excess / Shortage in Premium";
  }
  IN MIR-APL-LOAN-AMT
  {
#M271O1 CHANGES START HERE 
    CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE  
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "APL Balance";
  }
  IN MIR-DV-APL-LOAN-INT-AMT
  {
#M319AB CHANGES START HERE
    CurrencyCode = "MIR-POL-CRCY-CD";
#M319AB CHANGES END HERE
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "APL Interest";
  }
  IN MIR-LOAN-AMT
  {
#M319AB CHANGES START HERE
    CurrencyCode = "MIR-POL-CRCY-CD";
#M319AB CHANGES END HERE
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Policy Loan Balance";
  }
  IN MIR-DV-LOAN-INT-AMT
  {
#M319AB CHANGES START HERE
    CurrencyCode = "MIR-POL-CRCY-CD";
#M319AB CHANGES END HERE
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Policy Loan Interest";
  }
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST START HERE 
    IN MIR-UNEARN-LOAN-INT-AMT	
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "Unearned Interest";
     }
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST END HERE
  IN MIR-LOAN-XCES-SHRT-AMT
  {
#M319AB CHANGES START HERE
    CurrencyCode = "MIR-POL-CRCY-CD";
#M319AB CHANGES END HERE
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Excess / Shortage of Policy Loan Interest";
  }
#  Q11534 Changes End
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

# ISLADM - Changes start here     
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
# ISLADM - Changes end here    
#M271O1 CHANGES START HERE   
    INOUT MIR-PREM-CRCY-CD
    {
                   
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#M271O1 CHANGES END HERE 
# M271AA  CHANGES STARTS HERE
   IN MIR-PAYO-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }      
    IN MIR-MRF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }
    IN MIR-PMT-CRCY-CD
    {
      Length = "2";
      SType = "Hidden";
      Label = "Currency";
    }    
        IN MIR-POL-CRCY-CD
        {
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
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
  IN MIR-DV-PAYO-JPY-BNFT-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    SType = "Selection";
    Label = "JPY BENEFIT RIDER INDICATOR";
  } 
      IN MIR-DV-HO-RECV-DT
      {
          DisplayOnly;
          Length = "10";
          SType = "Date";
          Label = "Head Office Received Date";
    }
    IN MIR-DV-NATNL-TAXWH-AMT
    { 
          Signed;    
          CurrencyCode = "MIR-PAYO-CRCY-CD";
    	  DisplayOnly;
    	  Length = "20";
    	  SType = "Currency";
    	  Label = "Separate Withholding Tax (Income Tax)";
    }
#MP302K- Changes Start here      
    IN MIR-SRVBEN-DEFR-AMT
      {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Amount";
      } 
    IN MIR-SRVBEN-DEFR-INT-AMT
      {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Interest";
      } 
#MP302K- Changes Ends here
#UY3100 CHANGES STARTS HERE
     IN MIR-INCR-SURV-BNFT-AMT 
    { 
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "CSV of Increased Survival Benefit";
    }
      
    IN MIR-INCR-WL-AMT 
    { 
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "CSV of Increased Whole Life";
    }
    IN MIR-VEST-AMT 
    { 
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Vesting Amount";
    }
      
    IN MIR-CNVR-BAL-AMT 
    { 
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "CSV of Conversion Balance";
    }
    IN MIR-TAX-QUAL-AMT 
    { 
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Tax Qualification amount";
    }
      
    IN MIR-DEFR-DIV-AMT 
    { 
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Dividend Amount";
    }
  
    IN MIR-EDUC-ANN-AMT 
    {
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Educational Annuity amount";
    }  
  
    IN MIR-NO-ACCDNT-BNFT-AMT 
    {
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "No Accidental Benefit Amount";
    }
  
    IN MIR-SAV-RIDER-DEFR-AMT
    {
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Saving Rider Deferred Amount";
    } 
    
    IN MIR-HLTBEN-DEFR-AMT 
    {
       DisplayOnly;
       Signed;
       Length = "15";
       SType = "Currency";
       Label = "Health Congratulatory Benefit";
    }    
#UY3100 CHANGES ENDS HERE     
    IN MIR-DV-PREM-RFND-AMT    
    {     
          Signed;        
          CurrencyCode = "MIR-PMT-CRCY-CD";    
    	  DisplayOnly;    
    	  Length = "20";    
    	  SType = "Currency";    
    	  Label = "Premium Refund(JPY)";    
    }              

# M271AA  CHANGES END HERE 
# MP334A - CHANGES START HERE
    IN MIR-DT-OF-DTH
    {
        DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Date of Death of the policyholder";
    }
    IN MIR-CLMT-CAT-CD
    {
        DisplayOnly;    
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLMT-CAT-CD";
        SType = "Text";
        Label = "Claimant Category";
    }
    IN MIR-CLMT-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Claimant Client Id";
    }
# MP334A - CHANGES ENDS HERE       
#27549A - Changes Start here 
   IN MIR-ATO-NOT-APPL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }    
#27549A- Changes ends here
}
