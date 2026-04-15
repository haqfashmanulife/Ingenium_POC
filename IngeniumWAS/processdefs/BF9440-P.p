# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9440-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01PR04  TMC      New for FTJ                                               *
#*  P00891  YC       Add Journal Date with no limitation   06JUN2003           *
#*  MP4FB1  H.L      add pay out method, ho acceptance date and bank,name,addres *
#*  U40012  BP       Add Bank Name and Branch Name                             *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  Q11534  CTS      NEW FIELDS FOR PLS SCREEN                                 *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271AA  CTS      FRA CHANGES FOR POST LAPSE SURRENDER  01SEP2015           *
#*  MP302K  CTS      ADDED FIELDS FOR SURVIVAL DEFFERAL PAYOUT                 *
#*                   AMOUNT AND DEFERRAL INTEREST AMOUNT                       *
#*  MP334A  CTS      CHANGES DONE FOR THE ADDITION OF NEW FIELDS               *
#*  122505  CTS      CHANGES DONE FOR MRF INDICATOR                            *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP  PROJECT		       *
#*  UY3100  CTS      JIKKO POLICY CHANGES                                      *
#*******************************************************************************

P-STEP BF9440-P
{

 ATTRIBUTES
 {
  BusinessFunctionId = "9440";
  BusinessFunctionName = "Post Lapse Surrender";
  BusinessFunctionType = "TPlaps";
  MirName = "CCWM9440";
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

 IN MIR-DV-PRCES-STATE-CD
 {
  Length = "1";
  DBTableName = "Derived";
  SType = "Hidden";
  Label = "Process State";
 }

 IN MIR-POL-ID-BASE
 {
  Key;
  Mandatory;
  Length = "9";
  DBTableName = "TPOL";
  DefaultSession = "MIR-POL-ID-BASE";
  SType = "Text";
  Label = "Policy Id";
 }

 IN MIR-POL-ID-SFX
 {
  Key;
  Length = "1";
  DBTableName = "TPOL";
  DefaultSession = "MIR-POL-ID-SFX";
  SType = "Text";
  Label = "Suffix";
 }

 OUT MIR-POST-LAPS-SURR-AMT
 {
  Signed;
  Length = "17";
  DBTableName = "TPOL";
  SType = "Currency";
  Label = "Post Lapse Surrender Amount";
 }

 OUT MIR-DV-OWN-CLI-NM
 {
  Length = "75";
  DBTableName = "Derived";
  SType = "Text";
  Label = "Owner Name";
 }

#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

#  MP4FB1 H.L  ADD BELOW FIELDS FOR FIRM BANKING
#              AND ALL KEY FIELDS ARE CHANGES TO DISPLAY-ONLY
    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";
    }
     
#  ISLADM Changes Start here        
#    INOUT MIR-HO-FORM-ACPT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        DefaultSession = "LSIR-PRCES-DT";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    INOUT MIR-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here    
      
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
#122505 CHANGES STARTS HERE 
    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }
#122505 CHANGES ENDS HERE 
    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKA";
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

#   ISLADM - Changes start here     
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
#   ISLADM - Changes end here
#  Q11534 Changes Start here 

    OUT MIR-DV-POL-CSV-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }
    OUT MIR-DV-UNEARN-PREM
    {
        Signed;
        Length = "17";
        DBTableName = "Derived"; 
        SType = "Currency";
        Label = "Unearned Premium";
    }
    
    OUT MIR-PREM-XCES-SHRT-AMT
    {
       Signed;
       Length = "13";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Excess / Shortage in Premium";
    }
    OUT MIR-APL-LOAN-AMT
    {
       Signed;
       Length = "17";
       SType = "Currency";
       Label = "APL Balance";
    }
    OUT MIR-DV-APL-LOAN-INT-AMT
    {
       DisplayOnly;
       Signed;
       Length = "17";
       SType = "Currency";
       Label = "APL Interest";
    }
    OUT MIR-LOAN-AMT
    {
       Signed;
       Length = "17";
       SType = "Currency";
       Label = "Policy Loan Balance";
    }
    OUT MIR-DV-LOAN-INT-AMT
    {
       Signed;
       Length = "17";
       SType = "Currency";
       Label = "Policy Loan Interest";
    }
    
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST START HERE 
     OUT MIR-UNEARN-LOAN-INT-AMT
     {
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "Unearned Interest";
     }
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST END HERE
    
    OUT MIR-LOAN-XCES-SHRT-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Excess / Shortage of Policy Loan Interest";
    }

# Q11534 Changes End
#M271O1 CHANGES START HERE   
    INOUT MIR-PREM-CRCY-CD
    {
                   
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#M271O1 CHANGES END HERE 
#M271AA CHANGES STARTS HERE
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
	Length = "17";
	SType = "Currency";
	Label = "Separate Withholding Tax (Income Tax)";
    }
    OUT MIR-DV-LOC-TAXWH-AMT
    { 
	DisplayOnly;
	Length = "17";
	SType = "Currency";
	Label = "Separate Withholding Tax (Local Tax)";
    } 
#MP302K- Changes Start here      
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
#MP302K- Changes Ends here
#UY3100 CHANGES STARTS HERE    
    OUT MIR-INCR-SURV-BNFT-AMT 
    { 
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "CSV of Increased Survival Benefit";
    }
      
    OUT MIR-INCR-WL-AMT 
    { 
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "CSV of Increased Whole Life";
    }
    
    OUT MIR-VEST-AMT 
    { 
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Vesting Amount";
    }
      
    OUT MIR-CNVR-BAL-AMT 
    { 
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "CSV of Conversion Balance";
    }
    
    OUT MIR-TAX-QUAL-AMT 
    { 
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Tax Qualification amount";
    }
      
    OUT MIR-DEFR-DIV-AMT 
    { 
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Dividend Amount";
    }
    
    OUT MIR-EDUC-ANN-AMT 
    { 
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Dividend Amount";
    }

    OUT MIR-NO-ACCDNT-BNFT-AMT 
    {
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "No Accidental Benefit Amount";
    }
  
    OUT MIR-SAV-RIDER-DEFR-AMT
    {
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Saving Rider Deferred Amount";
    } 
    
    OUT MIR-HLTBEN-DEFR-AMT 
    {
       Signed;
       Length = "15";
       SType = "Currency";
       Label = "Health Congratulatory Benefit";
    }    
#UY3100 CHANGES ENDS HERE 
    OUT MIR-DV-PREM-RFND-AMT        
    {         
	DisplayOnly;        
	Length = "17";        
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
 
    INOUT MIR-POL-CRCY-CD
    {       
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }  

    INOUT MIR-DV-JP-XCHNG-RT
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";     
    }     
    INOUT MIR-DV-JP-XCHNG-EFF-DT
    { 
	DisplayOnly;
	Length = "10";
	SType = "Date";
	Label = "Conversion Exchange Effective date";    
    }    
# M271AA Changes ends here
# MP334A - CHANGES START HERE
    INOUT MIR-DT-OF-DTH
    {
        Length = "10";
        SType = "Date";
        Label = "Date of Death of the policyholder";
    }
    INOUT MIR-CLMT-CAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLMT-CAT-CD";
        SType = "Selection";
        Label = "Claimant Category";
    }
    INOUT MIR-CLMT-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Claimant Client Id";
    }
# MP334A - CHANGES ENDS HERE
#FFF10R CHANGES START HERE 
     INOUT MIR-CC-SUSP-CRCY-CD
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
#FFF10R CHANGES ENDS HERE 

#27549A - Changes Start here 
   INOUT MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }    
#27549A- Changes ends here

}
