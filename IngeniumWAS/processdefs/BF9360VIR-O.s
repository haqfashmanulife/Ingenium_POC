
#*******************************************************************************
#*  Component:   BF9360VIR-O.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS043  CTS      INITIAL VERSION FOR VIRTUAL QUOTE                         *
#*  S21986  CTS      CHANGES DONE AS PART OF UDSD-1986                         *
#*  S25573  CTS      FIX FOR DISPLAY ISSUE                                    **
#*  UY3071  CTS      HEALTH CONGRATULATORY BENEFIT                             *
#*  UY3136  CTS      EDUCATIONAL CONGRATULATORY BENEFIT                        *
#*  UY3149  CTS      SURRENDER VIRTUAL SCREEN STREAM 3			       *
#*******************************************************************************
 
S-STEP BF9360VIR-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "TabSurVal";
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
    SType="Hidden";
  }

  OUT index
  {
    SType = "Hidden";
  }
   
  IN MIR-APPL-CTL-PRCES-DT 
  {
    Key;
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Process Date";
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
    SType = "Text";
    Label = "Suffix";
  }

  IN MIR-SBSDRY-CO-ID 
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "EDIT";
    CodeType = "SUBCO";
    SType = "Text";
    Label = "Sub Company";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-POL-CVG-REC-CTR 
  {
    DisplayOnly;
    Length = "2";
    SType = "Text";
    Label = "Number of Coverages";
  }

  IN MIR-POL-CSTAT-CD 
  {
    DisplayOnly;
    Length = "4";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Policy Status";
  }

  IN MIR-DV-POL-CSV-AMT 
  {
            CurrencyCode="MIR-POL-CRCY-CD"; 
    DisplayOnly;
    Signed;
    Length = "19";
    SType = "Currency";
    Label = "Cash Surrender Value";
  }

  IN MIR-POST-LAPS-SUR-AMT 
  {
        CurrencyCode="MIR-POL-CRCY-CD"; 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Post-Lapse Surrender Value";
  }

  IN MIR-POL-OS-DISB-AMT 
  {
    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Outstanding Disbursement";
  }
   
    IN MIR-OS-DISB-SURR-AMT
    {
   
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    IN MIR-OS-DISB-MAT-AMT
    {
    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";

        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    IN MIR-OS-DISB-DTH-AMT
    {
    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";

        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    IN MIR-OS-DISB-CLM-AMT
    {
    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";

        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    IN MIR-OS-DISB-AD-AMT
    {
    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
   
  IN MIR-POL-UL-SHRT-AMT 
  {
 
         CurrencyCode = "MIR-PREM-CRCY-CD";
 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Shortage Amount";
  }

  IN MIR-POL-PREM-SUSP-AMT 
  {

        CurrencyCode = "MIR-PREM-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Premium Suspense";
  }

  IN MIR-POL-BT-SUSP-AMT 
  {

        CurrencyCode = "MIR-PMT-CRCY-CD";      
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Bank Transfer Suspense";
  }

  IN MIR-POL-PD-SUSP-AMT 
  {
        CurrencyCode = "MIR-PMT-CRCY-CD";        
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Payroll Deduction Suspense";
  }

  IN MIR-POL-CC-SUSP-AMT 
  { 
        CurrencyCode = "MIR-CC-SUSP-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Cash Collection Suspense";
  }

  IN MIR-POL-PD-TO-DT-NUM 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Paid to Date";
  }

  IN MIR-UL-LAPS-STRT-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Lapse Start Date";
  }

  IN MIR-DV-FUND-QUOTE-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Fund Quote Date";
  }

  IN MIR-DV-GCSV-QUOTE-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Guaranteed Cash Value Quote Date";
  }

  IN MIR-CVG-NUM-T[99] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }

  IN MIR-PLAN-ID-T[99] 
  {
    DisplayOnly;
    Length = "6";
    FieldGroup = "Table50";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Type of Plan";
  }

  IN MIR-DV-ACUM-FND-VAL-T[99] 
  {   
        CurrencyCode="MIR-POL-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Accumulated Fund Value Amount";
  }

  IN MIR-DV-MKTVAL-T[99] 
  {   
        CurrencyCode="MIR-POL-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "MVA";
  }

  IN MIR-DV-SURRCHRG-T[99] 
  {    
        CurrencyCode="MIR-POL-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Surrender Charge";
  }

  IN MIR-DV-NET-FUND-VAL-T[99] 
  {   
        CurrencyCode="MIR-POL-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Net Fund Value";
  }

  IN MIR-DV-GCSV-AMT-T[99] 
  {    
        CurrencyCode="MIR-POL-CRCY-CD";

    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Guaranteed Cash Value";
  }

  IN MIR-DV-NET-GCSV-AMT-T[99] 
  {
   
        CurrencyCode="MIR-POL-CRCY-CD";

    DisplayOnly;
    Signed;
    Length = "17";
    FieldGroup = "Table50";
    Index = "1";
    SType = "Currency";
    Label = "Coverage Net Surrender Value";
  }
   
  IN MIR-CVG-INS-TYP-CD-T[99]
  {
    FieldGroup = "Table50";
    Index = "1";
    SType="Hidden";
  }

  IN MIR-SURR-CHRG-TYP-CD 
    {
      DisplayOnly;
      Length = "1";
      CodeSource = "EDIT";
      CodeType = "MVAL";
      DBTableName = "TPOL";
      SType = "Text";
      Label = "FlexFund Surrender Charge Type";
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

        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Unearned Premium";
     }
    IN MIR-PREM-XCES-SHRT-AMT
      { 
        CurrencyCode = "MIR-OVR-SHRT-PREM-CRCY-CD"; 

        DisplayOnly;
         Signed;
         Length = "13";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Excess / Shortage in Premium";
      }
    IN MIR-APL-LOAN-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD"; 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "APL Balance";
    }
    IN MIR-DV-APL-LOAN-INT-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "APL Interest";
    }
    IN MIR-LOAN-AMT
    {   
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan Balance";
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
    IN MIR-LOAN-XCES-SHRT-AMT
      {   
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
         Signed;
         Length = "17";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Excess / Shortage of Policy Loan Interest";
      }     
    IN MIR-SRVBEN-DEFR-AMT
      {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Amount";
      }
#UY3071 Changes Start Here
    IN MIR-HLTBEN-DEFR-AMT 
      {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Health Congratulatory Benefit";
      } 
#UY3071 Changes End Here   
#UY3136 Changes Start Here
    IN MIR-EDU-CNGR-AMT 
      {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Educational Congratulatory Benefit";
      } 
#UY3136 Changes End Here  
#S21986- Changes Start here      
#    IN MIR-UNEARN-INT-AMT
     IN MIR-UNEARN-LOAN-INT-AMT
#S21986- Changes Ends here     
      {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unearned Interest";
      } 
    IN MIR-SRVBEN-DEFR-INT-AMT 
      {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Interest";
      } 

   IN MIR-CVG-PRIM-GR-ID-T[99]
   {
        Length = "2";
        FieldGroup = "Table50";
        Index = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
   }

    INOUT MIR-POL-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        } 
    
   INOUT MIR-OS-DISB-CRCY-CD
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
     
     INOUT MIR-OVR-SHRT-PREM-CRCY-CD    
     {
              
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
     }       
 
    IN MIR-PAYO-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }         
    IN MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
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
    IN MIR-DV-PAYO-CSV-AMT 
    {
      CurrencyCode="MIR-PAYO-CRCY-CD";
      DisplayOnly;
      Signed;
      Length = "19";
      SType = "Currency";
      Label = "Cash Surrender Value in Payout Currency";
    }    
 
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  


 INOUT MIR-PMT-CRCY-CD
 {
     Length = "2";
     SType = "Hidden";
     Label = "Currency";
  }   

 IN MIR-DV-NATNL-TAXWH-AMT
 {
     Signed;
     CurrencyCode="MIR-PAYO-CRCY-CD";     
     Length = "19";
     DBTableName = "Derived";
     SType = "Currency";
     Label = "Separate Withholding Tax (Income Tax)";
 }
 
 IN MIR-DV-LOC-TAXWH-AMT
  {
      Signed;
      CurrencyCode="MIR-PAYO-CRCY-CD";     
      Length = "19";
      DBTableName = "Derived";
      SType = "Currency";
      Label = "Separate Withholding Tax (Local Tax)";
 }
 
 IN MIR-DV-PREM-RFND-AMT 
  { 
      Signed; 
      CurrencyCode="MIR-PMT-CRCY-CD";
      Length = "19"; 
      DBTableName = "Derived"; 
      SType = "Currency"; 
      Label = "Refund Premium(JPY)"; 
 }
 

   IN  MIR-TOT-PD-PREM-AMT
    {
        Label = "Total Premium Paid for the Policy";
        Length = "16";
        SType = "Currency";
        Signed; 
    }

   IN  MIR-RPU-TRNST-CNCL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "During RPU Transition Period Cancel:";
     }

    IN MIR-VIR-TRAD-PD-TO-MO-NUM
    {
        DisplayOnly;
        Label = "Next Payment Date:";
        Length = "07";
        SType = "text";
    }  
    
    IN MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
        DisplayOnly;
        Label = "Elapsed years:";
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
    
    IN MIR-VIR-INS-TYP-CD
    {
        DisplayOnly;    
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "INS-TYP-CD";
        SType = "Text";
        Label = "Type:";	
    }     


    IN MIR-VIR-RPU-POL-CD
    {
        DisplayOnly;    
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "RPU-POL-CD";
        SType = "Text";
        Label = "RPU Policy:";	
    }     
        
#S25573
#   IN MIR-VIR-RPU-NEW-OLD-RT
#   {   
#       DisplayOnly;    
#       Signed;
#       Length = "13";
#       Decimals = "5";
#       SType = "Number";
#       Label = "RPU new/old rate:";
#   }
    IN MIR-VIR-RPU-NEW-OLD-RT
     {
         DisplayOnly;    
         Length = "13";
         CodeSource = "DataModel";
         CodeType = "RPU-NEW-OLD-RT";
         SType = "Text";
         Label = "RPU new/old rate:";
     }     
#S25573
    

    IN MIR-VIR-RPU-FACE-AMT
    {   
        DisplayOnly;    
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Regular death face amount after RPU:";
    }   
    
    IN MIR-VIR-LOAN-AMT
    {   
        DisplayOnly;    
        Mandatory;
        Signed;
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
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    } 
#UY3149 CHANGES START HERE
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
#UY3149 CHANGES ENDS HERE
}
