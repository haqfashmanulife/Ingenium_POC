# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9360-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01PR10  CSS      New for MCL                                               *
#*  B00542  EKM      DISPLAY 99 COVERAGES                                      *
#*  02GL03  MAW      ADD POL-BT-SUSP-AMT, POL-PD-SUSP-AMT, POL-CC-SUSP-AMT     *
#*  1CPR03  EKM      ADD MIR-DV-SURRCHRG-T                                     *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*  MP5002  CTS      ADD FlexFund Surrender Charge Type                        *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  MP1669 CTS   To support APL,loan in Future/Back dated trial calculation    *
#*  Q13469  CTS      CHANGES TO REMOVE ACCRUED INTEREST FIELD                  *
#*  M213L1  CTS      ADMIN CHANGES FOR RUM                                     *
#*  C19016  CTS      PS-SD97335 CHANGES TO RETURN CSV VALUE TO                 *
#*                   POST LAPSE SURRENDER VALUE                                *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245R  CTS      CHANGES FOR DISBURSEMENT CURRENCY CODE       	       *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  MP271A  CTS      CHANGES DONE FOR SEPERATE WITHHOLDING TAX                 *
#*  MP302K  CTS      ADDED FIELDS FOR SURVIVAL DEFFERAL PAYOUT                 *
#*                   AMOUNT AND DEFERRAL INTEREST AMOUNT                       *  
#*  M319O1  CTS      FXWL Currency Code Changes                                *        
#*  MP334A  CTS      CHANGES DONE FOR ADDITION OF NEW FIELD TOTAL PREMIUM PAID *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  RPU013  CTS      CHANGES DONE FOR POLICY SERVICE AFTER RPU PROCESSING      *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  UY3053  CTS      CHANGES FOR FULL SURRENDER                                *
#*  UY3136  CTS      EDUCATIONAL CONGRATULATORY BENEFIT                        *
#*  CD3002  CTS      CHANGES DONE AS PART OF CERBERUS DAY-3                    *
#*******************************************************************************
 
S-STEP BF9360-O
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
    #M245B2 CHANGES START HERE    
            CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "19";
    SType = "Currency";
    Label = "Cash Surrender Value";
  }

  IN MIR-POST-LAPS-SUR-AMT 
  {
    #M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Post-Lapse Surrender Value";
  }

  IN MIR-POL-OS-DISB-AMT 
  {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE  
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Outstanding Disbursement";
  }
   
    IN MIR-OS-DISB-SURR-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    IN MIR-OS-DISB-MAT-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    IN MIR-OS-DISB-DTH-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    IN MIR-OS-DISB-CLM-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    IN MIR-OS-DISB-AD-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }

#CD3002 CHANGES START HERE

    IN MIR-FRACT-ACUM-PREM-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Accumulation Value for fractions less than a year";
    }
	
    IN MIR-RAV-DEFR-BAL-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Rider A/V";
    }
	
    IN MIR-RAV-DLY-INT-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Rider A/V Daily Interest";
    }

#CD3002 CHANGES ENDS HERE


   
  IN MIR-POL-UL-SHRT-AMT 
  {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
       # CurrencyCode = "MIR-POL-CRCY-CD";
         CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Shortage Amount";
  }

  IN MIR-POL-PREM-SUSP-AMT 
  {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Premium Suspense";
  }

  IN MIR-POL-BT-SUSP-AMT 
  {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";      
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Bank Transfer Suspense";
  }

  IN MIR-POL-PD-SUSP-AMT 
  {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";        
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Payroll Deduction Suspense";
  }

  IN MIR-POL-CC-SUSP-AMT 
  {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
#FFF10R CHANGES STARTS HERE
      # CurrencyCode = "MIR-PMT-CRCY-CD";  
        CurrencyCode = "MIR-CC-SUSP-CRCY-CD";
#FFF10R CHANGES ENDS HERE
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#MP5002  
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
# MP1669- Changes Start here
   IN MIR-DV-UNEARN-PREM
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Unearned Premium";
     }
    IN MIR-PREM-XCES-SHRT-AMT
      {
#M245B2 CHANGES START HERE    
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
#M245B2 CHANGES END HERE  
        DisplayOnly;
         Signed;
         Length = "13";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Excess / Shortage in Premium";
      }
    IN MIR-APL-LOAN-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "APL Balance";
    }
    IN MIR-DV-APL-LOAN-INT-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "APL Interest";
    }
    IN MIR-LOAN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan Balance";
    }
   IN MIR-DV-LOAN-INT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }
    IN MIR-LOAN-XCES-SHRT-AMT
      {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
         Signed;
         Length = "17";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Excess / Shortage of Policy Loan Interest";
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
#UYS32E Addition of Unearned Interest Changes Start Here
    IN MIR-UNEARN-LOAN-INT-AMT 
      {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unearned Interest";
      } 
#UYS32E Addition of Unearned Interest Changes Start Here
    IN MIR-SRVBEN-DEFR-INT-AMT 
      {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Interest";
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
#MP302K- Changes Ends here      
#Q13469 CHANGES STARTS HERE
#   IN MIR-DV-ADV-PMT-INT-AMT
#    {
#        DisplayOnly;
#        Signed;
#        Length = "17";
#        SType = "Currency";
#        Label = "Accrued Interest for Prepayment";
#    }
#Q13469 CHANGES ENDS HERE
   IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Undo Indicator";
    }
# MP1669- Changes End here
#M213L1 CHANGES STARTS HERE 
   IN MIR-CVG-PRIM-GR-ID-T[99]
   {
        Length = "2";
        FieldGroup = "Table50";
        Index = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
   }
#M213L1 CHANGES ENDS HERE  
# C19016 CHANGES STARTS HERE
   IN MIR-POL-TRAD-NON-SEG-FND-IND
    {
        Length = "1";
        SType = "Hidden";
        Label = "Trad Non Seg Fund Indicator";
    }
# C19016- CHANGES ENDS HERE    
#M245B2 CHANGES START HERE  
    INOUT MIR-POL-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        } 
#M245B2 CHANGES END HERE          
#MP245R CHANGES STARTS HERE     
   INOUT MIR-OS-DISB-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }               
#MP245R CHANGES ENDS HERE
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
#MP245K CHANGES STARTS HERE 
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
#MP245K CHANGES ENDS HERE
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#MP271A CHANGES STARTS HERE

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
 
#MP271A CHANGES ENDS HERE
#MP334A CHANGES START HERE
   IN  MIR-TOT-PD-PREM-AMT
    {
        Label = "Total Premium Paid for the Policy";
        Length = "16";
        SType = "Currency";
        Signed; 
    }
#MP334A CHANGES END HERE
#RPU013- CHANGES START HERE
   IN  MIR-RPU-TRNST-CNCL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "During RPU Transition Period Cancel:";
     }
#RPU013- CHANGES END HERE
}
