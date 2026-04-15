# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1460-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02PR62  DPK      Joint to Single Change                                    *
#*  P00891  YC       Add Journal Date with no limitation   05JUN2003           *
#*  HCL106  HIN/CL   SUPPRESS SURRENDER               (HCL106B)                *
#*                   Add  MIR-DV-SURR-SUB-STAT-CD                              *
#*  B11067  HIN/LJ   Remove MIR-DV-SURR-SUB-STAT-CD                            *
#*  MP4FB1   H.L     21JUL2004 Change to support FIRM BANKING                  *
#*  U40012  BP       Add Bank Name and Branch Name                             *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  M166P1  CTS      POLICY EVENT CHANGES FOR CASH LOAN                        *
#*  Q10210  CTS      LABEL CHANGES FOR POPULATING THE NEW FIELDS ADDED FOR CASH*
#*                   LOANS & APL                                               *
#*  Q10627  CTS      ADDITION OF TWO NEW FIELDS                                *
#*  Q13367  CTS      CHANGES FOR VIRTUAL UNDO PROCESS                          *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP265H  CTS      ADDED MRF INDICATOR AS PART OF NOMURA                     *
#*  MP271A  CTS      CHANGES DONE FOR SEPERATE WITHHOLDING TAX                 *
#*  MP302K  CTS      ADDED FIELDS FOR SURVIVAL DEFFERAL PAYOUT                 *
#*                   AMOUNT AND DEFERRAL INTEREST AMOUNT                       *  
#*  MP334A  CTS      CHANGES DONE FOR THE ADDITION OF NEW FIELDS               *
#*  CSCR02  CTS      CHANGES FOR NOMURA FOREIGN HOLIDAY REMITTANCE DATE        *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  130977  CTS      FIX DONE FOR ONLINE SCREEN PREMIUM REFUND CHANGES         *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  UY3071  CTS      HEALTH CONGRATULATORY BENEFIT                             *
#*  UY3053  CTS      CHNAGES FOR FULL SURRENDER                                *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*  CD3002  CTS      CHANGES DONE AS PART OF CERBERUS DAY3 PROJECT             *
#*******************************************************************************

P-STEP BF1460-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1460";
        BusinessFunctionName = "Termination - Surrender";
        BusinessFunctionType = "Tsurr";
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
    
#MP265H CHANGES START HERE

    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }


#MP265H CHANGES ENDS HERE

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

#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
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
     
#  MP4FB1 H.L     21JUL2004 ADD BELOW FIELDS TO SUPPORT FIRM BANKING

#  ISLADM Changes Start here        
#    INOUT MIR-HO-FORM-ACPT-DT
#    {
#        Length = "10";
#        DefaultSession = "LSIR-PRCES-DT";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    INOUT MIR-CO-RECV-DT
    {
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
#   M166P1 - Changes Starts here
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

    OUT MIR-NO-ACCDNT-BNFT-AMT
    {
      Signed;
      Length = "17";
      SType = "Currency";
      Label = "No Accidental Benefit";
    }
    
    OUT MIR-SAV-RIDER-AMT
    {
      Signed;
      Length = "17";
      SType = "Currency";
      Label = "Saving Rider Deferred Amount";
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
#   Q10210 - Changes Starts here        
        Label = "Excess/Shortage in Premium";
#   Q10210 - Changes ends here        
    } 
    OUT MIR-LOAN-XCES-SHRT-AMT
    { 
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Currency";
#   Q10210 - Changes Starts here        
        Label = "Overpaid/Shortage of policy loan interest";
#   Q10210 - Changes ends here        
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
#   Q10672 - CHANGES ENDS HERE    
#   Q13367 - CHANGES STARTS HERE
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
#   Q13367 - CHANGES ENDS HERE
#M245B2 CHANGES START HERE
    INOUT MIR-POL-CRCY-CD
            {
               
                 Length = "2";
                 SType = "Hidden";
                 Label = "Currency";
        }
#M245B2 CHANGES END HERE        
#FFF10R CHANGES START HERE      
     INOUT MIR-OVR-SHRT-PREM-CRCY-CD    
     {
              
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
      }       
#FFF10R CHANGES ENDS HERE 

#130977 CHANGES START HERE 

     INOUT MIR-CC-SUSP-CRCY-CD    
     {
              
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
     }       
#130977 CHANGES ENDS HERE

#MP245K CHANGES START HERE
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
#MP245K CHANGES END HERE 

#MP271A CHANGES ENDS HERE
 
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
#UY3071 Changes Start Here
    OUT MIR-HLTBEN-DEFR-AMT 
      {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Health Congratulatory Benefit";
      }
#UY3071 Changes End Here   
#CD3002 Changes Start Here
    OUT MIR-FRACT-ACUM-PREM-AMT
      {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Accumulation Value for fractions less than a year";
         DBTableName = "Derived";
      }
	  
    OUT MIR-RAV-DEFR-BAL-AMT
      {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Rider A/V";
         DBTableName = "Derived";
      }
	  
	OUT MIR-RAV-DLY-INT-AMT
      {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Rider A/V Daily Interest";
         DBTableName = "Derived";
      }  
#CD3002 Changes Ends Here
 
#UY3136 Changes Start Here
    OUT MIR-EDU-CNGR-AMT
      {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Educational Congratulatory Benefit";
      }
#UY3136 Changes End Here  
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
# MP271A Changes ends here
# MP334A - CHANGES START HERE
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
# MP334A - CHANGES ENDS HERE

# CSCR02 CHANGES START HERE
     OUT MIR-REMIT-DT
     { 
         Length = "10";
         DBTableName = "TFBNK";
         SType = "Date";
         Label = "Remittance Date";
     
     }
# CSCR02 CHANGES END HERE     
#27549A - Changes Start here
 INOUT MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    } 
#27549A- Changes ends here     
}




























































































