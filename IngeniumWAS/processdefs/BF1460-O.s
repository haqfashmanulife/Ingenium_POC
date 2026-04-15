# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1460-O.s                                                    *
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
#*  MP4FB1  H.L      Add additional fields for firm banking                    *
#*  U40018  BP       Moved Firm Banking Info to BF1460FB-O                     *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  M166P1  CTS      POLICY EVENT CHANGES FOR CASH LOAN                        *
#*  Q10210  CTS      LABEL CHANGES FOR POPULATING THE NEW FIELDS ADDED FOR CASH*
#*                   LOANS & APL                                               *
#*  Q10627  CTS      ADDITION OF TWO NEW FIELDS                                *
#*  Q13367  CTS      CHANGES FOR VIRTUAL UNDO PROCESS                          *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP271A  CTS      CHANGES DONE FOR SEPERATE WITHHOLDING TAX                 *
#*  MP302K  CTS      ADDED FIELDS FOR SURVIVAL DEFFERAL PAYOUT                 *
#*                   AMOUNT AND DEFERRAL INTEREST AMOUNT                       *  
#*  M319O1  CTS      FXWL Currency Code Changes                                *
#*  MP334A  CTS      CHANGES DONE FOR THE ADDITION OF NEW FIELDS               *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  130971  CTS      FIX DONE FOR FFF NOMURA                                   *
#*  130977  CTS      FIX DONE FOR ONLINE SCREEN PREMIUM REFUND CHANGES         *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  UY3071  CTS      HEALTH CONGRATULATORY BENEFIT                             *
#*  UY3053  CTS      CHNAGES FOR FULL SURRENDER                                *
#*  UY3136  CTS      EDUCATIONAL CONGRATULATORY BENEFIT                        *
#*  CD3002  CTS      CHANGES DONE AS PART OF CERBERUS DAY-3                    *
#*******************************************************************************

S-STEP BF1460-O
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

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
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
#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
    IN MIR-JRNL-DT
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
    }
#  MP4FB1 H.L     21JUL2004 ADD BELOW FIELDS TO SUPPORT FIRM BANKING

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

#   ISLADM - Changes start here     
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
#   M166P1 - Changes Starts here

    IN MIR-DV-UNEARN-PREM
    { 
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Unearned Premium";
    }    
#UY3053 CHANGES START HERE
  IN MIR-INCR-SRVBEN-AMT 
  { 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "CSV of Increased Survival Benefit";
  }
    
  IN MIR-INCR-WL-AMT 
  { 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "CSV of Increased Whole Life";
  }
  IN MIR-VEST-AMT 
  { 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Vesting Amount";
  }
    
  IN MIR-CNVR-BAL-AMT 
  { 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "CSV of Conversion Balance";
  }
  IN MIR-TAX-QUAL-AMT 
  { 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Tax Qualification amount";
  }
    
  IN MIR-DEFR-DIV-AMT 
  { 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Dividend Amount";
  }
  
  IN MIR-EDUC-ANN-AMT 
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Dividend Amount";
  }

  IN MIR-NO-ACCDNT-BNFT-AMT
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "No Accidental Benefit";
  }
  
  IN MIR-SAV-RIDER-AMT
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Saving Rider Deferred Amount";
  }   
#UY3053 CHANGES ENDS HERE 
    IN MIR-APL-BAL-AMT
    { 
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE
#M245B2 CHANGES END HERE 
        DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "APL Balance";
    }        

    IN MIR-DV-APL-INT-AMT
    { 
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "APL Interest";
    }    

    IN MIR-CSH-LOAN-BAL
    { 
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Policy loan Balance";
    } 
    
    IN MIR-DV-CSH-LOAN-INT
    { 
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Policy loan Interest";
    }

    IN MIR-OVR-SHRT-PREM-AMT
    { 
#M245B2 CHANGES START HERE
#FFF10R CHANGES STARTS HERE    
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PMT-CRCY-CD";       
#M319O1 CHANGES END HERE
        CurrencyCode = "MIR-OVR-SHRT-PREM-CRCY-CD";       
#FFF10R CHANGES ENDS HERE
	DisplayOnly;
	Length = "20";
	SType = "Currency";
#   Q10210 - Changes Starts here	
	Label = "Excess/Shortage in Premium";
#   Q10210 - Changes ends here	

    } 
    
    IN MIR-LOAN-XCES-SHRT-AMT
    { 
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
	DisplayOnly;
	Length = "20";
	SType = "Currency";
#   Q10210 - Changes Starts here	
	Label = "Overpaid/Shortage of policy loan interest";
#   Q10210 - Changes ends here	
    }
#   M166P1 changes ends here  
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
# CD3002 CERBERUS DAY3 CHANGES START HERE 
IN MIR-FRACT-ACUM-PREM-AMT	
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Accumulation Value for fractions less than a year";
     }
	 
IN MIR-RAV-DEFR-BAL-AMT	
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Rider A/V";
     }
	 
IN MIR-RAV-DLY-INT-AMT	
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Rider A/V Daily Interest ";
     }
# CD3002 CERBERUS DAY3 CHANGES ENDS HERE 
#   Q10672 - CHANGES STARTS HERE

    IN MIR-BASE-POL-CSV
    { 
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Base Policy CSV";
    }

    IN MIR-TOT-PAYOUT-AMT
    { 
#MP245K - CHANGES STARTS HERE
#M245B2 CHANGES START HERE    
#MP245K        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        CurrencyCode ="MIR-PAYO-CRCY-CD";
#MP245K - CHANGES ENDS HERE
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Total Payout amount";
    }
#   Q10672 - CHANGES ENDS HERE
#   Q13367 - CHANGES STARTS HERE
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
#   Q13367 - CHANGES ENDS HERE
#M245B2 CHANGES START HERE  
    IN MIR-POL-CRCY-CD
            {
                
                 Length = "2";
                 SType = "Hidden";
                 Label = "Currency";
        }
#M245B2 CHANGES end HERE         
#   MP245K - CHANGES STARTS HERE
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
#   MP245K - CHANGES ENDS HERE
#M271O1 CHANGES START HERE  
         
    IN MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#   MP271A Changes starts here

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
#MP302K- Changes Start here      
    IN MIR-SRVBEN-DEFR-AMT
      {
         Signed;
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Amount";
      } 
    IN MIR-SRVBEN-DEFR-INT-AMT 
      {
         Signed;
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Interest";
      } 
#MP302K- Changes Ends here 
#UY3071 Changes Start here      
    IN MIR-HLTBEN-DEFR-AMT 
      {
         Signed;
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Health Congratulatory Benefit";
      }       
#UY3071 Changes Ends here 
#UY3136 Changes Start here      
    IN MIR-EDU-CNGR-AMT 
      {
         Signed;
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Educational Congratulatory Benefit";
      }       
#UY3136 Changes Ends here 
    IN MIR-DV-PREM-RFND-AMT    
    {     
      Signed;  
#130971 CHANGES STARTS HERE            
#    CurrencyCode = "MIR-PMT-CRCY-CD";
#130977 CHANGES START HERE
#    CurrencyCode = "MIR-OVR-SHRT-PREM-CRCY-CD";
     CurrencyCode = "MIR-CC-SUSP-CRCY-CD";
#130977 CHANGES END HERE
#130971 CHANGES ENDS HERE        
      DisplayOnly;        
      Length = "20";        
      SType = "Currency";        
      Label = "Premium Refund(JPY)";        
    }                    
#  MP271A Changes ends here
# MP334A - CHANGES START HERE
    IN MIR-DT-OF-DTH
    {
        DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Date of Death of the Policyholder";
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




















