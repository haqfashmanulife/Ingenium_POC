# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*  P00891  YC       Add Journal Date with no limitation   06JUN2003           *
#*  MP4FB1  H.L      add pay out method, ho acceptance date and bank,name,addres *
#*  U40018  BP       Moved Firm Banking Info to BF9440FB-O                     *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         * 
#*  Q11534  CTS      LOAN RELATED CHANGES                                      *  
#*  M271AA  CTS      FRA CHANGES FOR POST LAPSE SURRENDER  01SEP2015           *
#*  MP302K  CTS      ADDED FIELDS FOR SURVIVAL DEFFERAL PAYOUT                 *
#*                   AMOUNT AND DEFERRAL INTEREST AMOUNT                       *
#*  MP334A  CTS      CHANGES DONE FOR THE ADDITION OF NEW FIELDS               *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
S-STEP BF9440-O
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
#M271AA CHANGES START HERE    
        CurrencyCode = "MIR-PAYO-CRCY-CD";
#M271AA CHANGES END HERE    
    Signed;
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
#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
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
#   ISLADM - Changes end here
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
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Unearned Premium";
    }
    IN MIR-PREM-XCES-SHRT-AMT
    {
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Excess / Shortage in Premium";
    }
    IN MIR-APL-LOAN-AMT
    {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "APL Balance";
    }
    IN MIR-DV-APL-LOAN-INT-AMT
    {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "APL Interest";
    }
    IN MIR-LOAN-AMT
    {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Policy Loan Balance";
    }
    IN MIR-DV-LOAN-INT-AMT
    {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Policy Loan Interest";
    }
    
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST START HERE 
    IN MIR-UNEARN-LOAN-INT-AMT	
    {
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "Unearned Interest";
     }
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST END HERE
    
    IN MIR-LOAN-XCES-SHRT-AMT
    {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Excess / Shortage of Policy Loan Interest";
    }
#  Q11534 Changes End
# M271AA  CHANGES STARTS HERE
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
    IN MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
    IN MIR-PMT-CRCY-CD
    {
      Length = "2";
      SType = "Hidden";
      Label = "Currency";
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
    IN MIR-DV-LOC-TAXWH-AMT
    { 
      Signed;    
      CurrencyCode = "MIR-PAYO-CRCY-CD";
      DisplayOnly;
      Length = "20";
      SType = "Currency";
      Label = "Separate Withholding Tax (Local Tax)";
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
    IN MIR-DV-PREM-RFND-AMT    
    {     
      Signed;        
      CurrencyCode = "MIR-PREM-CRCY-CD";    
      DisplayOnly;        
      Length = "20";        
      SType = "Currency";        
      Label = "Premium Refund(JPY)";        
    } 
# M271AA  CHANGES ENDS HERE    
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
}
