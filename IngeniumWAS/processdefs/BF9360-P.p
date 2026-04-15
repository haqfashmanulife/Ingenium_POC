# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9360-P.p                                                    *
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
#*  MFPFU7  AC       ADD MIR-CVG-INS-TYP-CD-T             :                    *
#*  MP5002  CTS      ADD FlexFund Surrender Charge Type                        *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  MP1669 CTS   To support APL,loan in Future/Back dated trial calculation    *
#*  Q13469  CTS      CHANGES TO REMOVE ACCRUED INTEREST FIELD                  *
#*  M213L1  CTS      ADMIN CHANGES FOR RUM                                     *
#*  C19016  CTS      PS-SD97335 CHANGES TO RETURN CSV VALUE TO                 *
#*                   POST LAPSE SURRENDER VALUE                                *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245R  CTS      CHANGES FOR DISBURSEMENT CURRENCY CODE 		       *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  MP271A  CTS      CHANGES DONE FOR SEPERATE WITHHOLDING TAX                 *
#*  MP302K  CTS      ADDED FIELDS FOR SURVIVAL DEFFERAL PAYOUT                 *
#*                   AMOUNT AND DEFERRAL INTEREST AMOUNT                       *  
#*  MP334A  CTS      CHANGES DONE FOR ADDITION OF NEW FIELD TOTAL PREMIUM PAID *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  RPU013  CTS      CHANGES DONE FOR POLICY SERVICE AFTER RPU PROCESSING      *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  UYS024  CTS      CHANGES FOR TRAIL CALC WEBSERVICE                         *
#*  S24736  CTS      FIX FOR WARNING MSG ERROR CODE                            *
#*  S25039  CTS      FIX FOR CSV AMOUNT FIELD IN WSCSV                         *
#*  S25573  CTS      FIX FOR DISPLAY ISSUE                                    **
#*  UY3071  CTS      HEALTH CONGRATULATORY BENEFIT                             *
#*  UY3053  CTS      CHANGES FOR FULL SURRENDER                                *
#*  S25648  CTS      FIX FOR INSURANCE TYPE POPULATION IN WSTRALCALC           *
#*  S25705  CTS      FIX FOR NET AMOUNTS IN WS TRIAL CALC                      *
#*  UY3136  CTS      EDUCATIONAL CONGRATULATORY BENEFIT                        *
#*  CD3002  CTS      CHANGES DONE AS PART OF CEREBRUS DAY3                    *
#*******************************************************************************
 
P-STEP BF9360-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9360";
  BusinessFunctionName = "Policy Inquiry - Surrender Values";
  BusinessFunctionType = "TabSurVal";
  MirName = "CCWM9360";
 }

 
 OUT LSIR-RETURN-CD;
    
 OUT MIR-RETRN-CD;

 INOUT MIR-APPL-CTL-PRCES-DT
 {
     Key;
     Length = "10";
     DBTableName = "TMAST";
     DefaultSession = "LSIR-PRCES-DT";
     SType = "Date";
     Label = "Process Date";
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

 OUT MIR-SBSDRY-CO-ID
 {
     Length = "2";
     CodeSource = "EDIT";
     CodeType = "SUBCO";
     DBTableName = "TPOL";
     SType = "Text";
     Label = "Sub Company";
 }

 OUT MIR-DV-OWN-CLI-NM
 {
     Length = "75";
     DBTableName = "Derived";
     SType = "Text";
     Label = "Owner Name";
 }

 OUT MIR-POL-CVG-REC-CTR
 {
     Length = "2";
     DBTableName = "TPOL";
     SType = "Text";
     Label = "Number of Coverages";
 }

 OUT MIR-POL-CSTAT-CD
 {
     Length = "4";
     CodeSource = "DataModel";
     CodeType = "POL-CSTAT-CD";
     DBTableName = "TPOL";
     SType = "Text";
     Label = "Policy Status";
 }

 OUT MIR-DV-POL-CSV-AMT
 {
     Signed;
     Length = "19";
     DBTableName = "Derived";
     SType = "Currency";
     Label = "Cash Surrender Value";
 }
 
#S25039 CHANGES START 
 OUT MIR-WS-POL-CSV-AMT
 {
     Signed;
     Length = "19";
     DBTableName = "Derived";
     SType = "Currency";
     Label = "WS Cash Surrender Value";
 }
#S25039 CHANGES END
 
 OUT MIR-POST-LAPS-SUR-AMT
 {
     Signed;
     Length = "17";
     DBTableName = "Derived";
     SType = "Currency";
     Label = "Post-Lapse Surrender Value";
 }

 OUT MIR-POL-OS-DISB-AMT
 {
     Signed;
     Length = "17";
     DBTableName = "TPOL";
     SType = "Currency";
     Label = "Outstanding Disbursement";
 }

    OUT MIR-OS-DISB-SURR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    OUT MIR-OS-DISB-MAT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    OUT MIR-OS-DISB-DTH-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    OUT MIR-OS-DISB-CLM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    OUT MIR-OS-DISB-AD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
#CD3002 CHANGES START 

    OUT MIR-FRACT-ACUM-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Accumulation Value for fractions less than a year";
    }
	
    OUT MIR-RAV-DEFR-BAL-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Rider A/V";
    }

    OUT MIR-RAV-DLY-INT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Rider A/V Daily Interest";
    }	

#CD3002 CHANGES ENDS HERE 
 
 OUT MIR-POL-UL-SHRT-AMT
 {
     Signed;
     Length = "17";
     DBTableName = "TPOL";
     SType = "Currency";
     Label = "Shortage Amount";
 }

 OUT MIR-POL-PREM-SUSP-AMT
 {
     Signed;
     Length = "17";
     DBTableName = "TPOL";
     SType = "Currency";
     Label = "Premium Suspense";
 }

 OUT MIR-POL-BT-SUSP-AMT
 {
     Signed;
     Length = "13";
     DBTableName = "TPOL";
     SType = "Currency";
     Label = "Bank Transfer Suspense";
 }

 OUT MIR-POL-PD-SUSP-AMT
 {
     Signed;
     Length = "13";
     DBTableName = "TPOL";
     SType = "Currency";
     Label = "Payroll Deduction Suspense";
 }

 OUT MIR-POL-CC-SUSP-AMT
 {
     Signed;
     Length = "13";
     DBTableName = "TPOL";
     SType = "Currency";
     Label = "Cash Collection Suspense";
 }

 OUT MIR-POL-PD-TO-DT-NUM
 {
     Length = "10";
     DBTableName = "TPOL";
     SType = "Date";
     Label = "Paid to Date";
 }

 OUT MIR-UL-LAPS-STRT-DT
 {
     Length = "10";
     DBTableName = "TPOL";
     SType = "Date";
     Label = "Lapse Start Date";
 }

 OUT MIR-DV-FUND-QUOTE-DT
 {
     Length = "10";
     DBTableName = "TMAST";
     SType = "Date";
     Label = "Fund Quote Date";
 }

 OUT MIR-DV-GCSV-QUOTE-DT
 {
     Length = "10";
     DBTableName = "TMAST";
     SType = "Date";
     Label = "Guaranteed Cash Value Quote Date";
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

 OUT MIR-SA-TYP-IND
 {
     SType="Hidden";
 }

 OUT MIR-CVG-NUM-T[99]
 {
     Length = "2";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCVG";
     SType = "Text";
     Label = "Coverage Number";
 }

 OUT MIR-PLAN-ID-T[99]
 {
     Length = "6";
     FieldGroup = "Table50";
     Index = "1";
     CodeSource = "EDIT";
     CodeType = "PLAN";
     DBTableName = "TCVG";
     SType = "Text";
     Label = "Type of Plan";
 }

 OUT MIR-DV-ACUM-FND-VAL-T[99]
 {
     Signed;
     Length = "17";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCFLW";
     SType = "Currency";
     Label = "Accumulated Fund Value Amount";
 }

 OUT MIR-DV-MKTVAL-T[99]
 {
     Signed;
     Length = "17";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCFLW";
     SType = "Currency";
     Label = "MVA";
 }

 OUT MIR-DV-SURRCHRG-T[99]
 {
     Signed;
     Length = "17";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCFLW";
     SType = "Currency";
     Label = "Surrender Charge";
 }

 OUT MIR-DV-NET-FUND-VAL-T[99]
 {
     Signed;
     Length = "17";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCFLW";
     SType = "Currency";
     Label = "Net Fund Value";
 }

 OUT MIR-DV-GCSV-AMT-T[99]
 {
     Signed;
     Length = "17";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCFLW";
     SType = "Currency";
     Label = "Guaranteed Cash Value";
 }

 OUT MIR-DV-NET-GCSV-AMT-T[99]
 {
     Signed;
     Length = "17";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCFLW";
     SType = "Currency";
     Label = "Coverage Net Surrender Value";
 }

 OUT MIR-CVG-INS-TYP-CD-T[99]
 {
     FieldGroup = "Table50";
     Index = "1";
     SType = "Hidden";
 }
#MP5002 
 INOUT MIR-SURR-CHRG-TYP-CD 
 {
     Length = "1";
     CodeSource = "EDIT";
     CodeType = "MVAL";
     DBTableName = "TPOL";
     SType = "Text";
     Label = "FlexFund Surrender Charge Type";
  }

# ISLADM - Changes start here     
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
# ISLADM - Changes end here
#MP1669- Changes Start here
   IN MIR-TRAD-PD-TO-MO-NUM
    {
        Length = "7";
        SType = "Text";
        Label = "Paid To Month";
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
         Length = "17";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Excess / Shortage in Premium";
      }
    OUT MIR-APL-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "APL Balance";
    }
    OUT MIR-DV-APL-LOAN-INT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "APL Interest";
    }
    OUT MIR-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Balance ";
    }
   OUT MIR-DV-LOAN-INT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }
    OUT MIR-LOAN-XCES-SHRT-AMT
      {
         Signed;
         Length = "17";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Excess / Shortage of Policy Loan Interest";
      }
#MP302K- Changes Start here      
    OUT MIR-SRVBEN-DEFR-AMT
      {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Amount";
      } 
#UYS32E Addition of Unearned Interest Changes Start Here
    OUT MIR-UNEARN-LOAN-INT-AMT 
      {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unearned Interest";
      }
#UYS32E Addition of Unearned Interest Changes Ends Here
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
#Q13469 CHANGES STARTS HERE      
#   OUT MIR-DV-ADV-PMT-INT-AMT
#    {
#        Signed;
#        Length = "17";
#        DBTableName = "Derived";
#        SType = "Currency";
#        Label = "Accrued Interest for Prepayment";
#    }
#Q13469 CHANGES ENDS HERE
  INOUT  MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Undo Indicator";
    }
#MP1669- Changes End here
#M213L1 CHANGES STARTS HERE 
 OUT MIR-CVG-PRIM-GR-ID-T[99]
 {
     Length = "2";
     FieldGroup = "Table50";
     Index = "1";
     DBTableName = "TCVG";
     SType = "Text";
     Label = "Group ID";
 }
#M213L1 CHANGES ENDS HERE  
#C19016 CHANGES STARTS HERE
  OUT  MIR-POL-TRAD-NON-SEG-FND-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Trad Non Seg Fund Indicator";
    }
#C19016- Changes End here
#M245B2 CHANGES START HERE  
  INOUT MIR-POL-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        } 
#M245B2 CHANGES END HERE          
#MP245R CHANGES START HERE 
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

#MP245K CHANGES START HERE 
    INOUT MIR-PAYO-CRCY-CD
    {
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }      
    INOUT MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY BENEFIT RIDER INDICATOR";
      }
      OUT MIR-DV-JP-XCHNG-EFF-DT
      { 
      	Length = "10";
      	SType = "Date";
      	Label = "Conversion Exchange Effective date";
      }
      OUT MIR-DV-JP-XCHNG-RT
          { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";     
    }
     OUT MIR-DV-PAYO-CSV-AMT
     {
         Signed;
         Length = "19";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Cash Surrender Value";
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

 OUT MIR-DV-NATNL-TAXWH-AMT
 {
     Signed;
     Length = "19";
     DBTableName = "Derived";
     SType = "Currency";
     Label = "Separate Withholding Tax (Income Tax)";
 }
 
  OUT MIR-DV-LOC-TAXWH-AMT
  {
      Signed;
      Length = "19";
      DBTableName = "Derived";
      SType = "Currency";
      Label = "Separate Withholding Tax (Local Tax)";
 }
 
  OUT MIR-DV-PREM-RFND-AMT          
   { 
       Signed; 
       Length = "19"; 
       DBTableName = "Derived"; 
       SType = "Currency"; 
       Label = "Refund Premium(JPY)";
  }
 
#MP271A CHANGES ENDS HERE
#MP334A CHANGES START HERE
    OUT MIR-TOT-PD-PREM-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Total Premium Paid for the Policy";
    }
#MP334A CHANGES END HERE
#RPU013 CHANGES START HERE
    INOUT MIR-RPU-TRNST-CNCL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "During RPU Transition Period Cancel:";
    }
#RPU013 CHANGES END HERE
#UYS043 CHANGES START HERE
    INOUT MIR-VIR-SCREEN-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "Please check in case of virtual quote implementation";
      }     
     INOUT MIR-VIR-TRAD-PD-TO-MO-NUM
     {
     
         Label = "Next Payment Date:";
         DBTableName = "TPOL";
         Length = "07";
         SType = "text";
     }  
     
     INOUT MIR-VIR-CI-FRST-ELAPS-YRS-DUR
     {
  
         Label = "Elapsed years:";
         Length = "07";
         SType = "text";
     }      
 
     INOUT MIR-VIR-ACTV-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Active";
     }
     
     INOUT MIR-VIR-BILL-MODE-CD
     {
         Length = "40";
         CodeSource = "DataModel";
         CodeType = "PLAN-BILL-MODE-CD";
         SType = "Selection";
         Label = "Payment frequency";
     } 
     
     OUT MIR-VIR-INS-TYP-CD
     {
         Length = "5";
         CodeSource = "DataModel";
         CodeType = "INS-TYP-CD";
         SType = "Selection";
         Label = "Type:";	
     }     
 
 
     OUT MIR-VIR-RPU-POL-CD
     {
         Length = "5";
         CodeSource = "DataModel";
         CodeType = "MIR-VIR-RPU-POL-CD";
         SType = "Selection";
         Label = "RPU Policy:";	
     }     
         
#S25573
#    OUT MIR-VIR-RPU-NEW-OLD-RT
#    {   
#        Signed;
#        DBTableName = "Derived";
#        Length = "13";
#        Decimals = "5";
#        SType = "Number";
#        Label = "RPU new/old rate:";
#    }
     OUT MIR-VIR-RPU-NEW-OLD-RT
     {
         Length = "13";
         CodeSource = "DataModel";
         CodeType = "RPU-NEW-OLD-RT";
         SType = "Selection";
         Label = "RPU new/old rate:";
     }     
#S25573
     
 
     OUT MIR-VIR-RPU-FACE-AMT
     {   
         Signed;
         DBTableName = "Derived";
         Length = "13";
         SType = "Currency";
         Label = "Regular death face amount after RPU:";
     }   
     
     INOUT MIR-VIR-LOAN-AMT
     {   
         Mandatory;
         Signed;
         DBTableName = "Derived";
         Length = "13";
         SType = "Currency";
         Label = "Policy loan balance:";
     }  
     
     INOUT MIR-VIR-INT-STR-DT
     {
 
         Length = "10";
         SType = "Date";
         Label = "Interest start date";
     }  
     
     INOUT MIR-VIR-APL-LOAN-AMT
     {   
         Signed;
         DBTableName = "Derived";
         Length = "13";
         SType = "Currency";
         Label = "APL balance:";
     }     
     
     INOUT MIR-VIR-POL-LOAN-EFF-DT
     {
 
         Length = "10";
         SType = "Date";
         Label = "APL date";
     }    
     
     INOUT MIR-VIR-PREPAY-MNG-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Prepayment management";
     }
     
     OUT MIR-VIR-SEI-ASS-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Seizure assignment";
     }    
     
     OUT MIR-VIR-CVG-NUM-T[99] 
     {
        
         FieldGroup = "Table99";
         DBTableName = "TCVG";
         Index = "1";
         KeyColumn;
         Label = "Coverage No";
         Length = "2";
         SType = "Text";
     }
 
     OUT MIR-VIR-PLAN-ID-T[99] 
     {
         CodeSource = "EDIT";
         CodeType = "PLAN";
         DBTableName = "TCVG";
         
         FieldGroup = "Table99";
         Index = "1";
         Label = "Plan";
         Length = "40";
         SType = "Text";
     }
 
     OUT MIR-VIR-CVG-FACE-AMT-T[99] 
     {   
         FieldGroup = "Table99";
         DBTableName = "TCVG";
         Index = "1";
         Label = "Face Amount";
         Length = "16";
         SType = "Currency";
         Signed;
    } 

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
#UYS043 CHANGES ENDS HERE 
#UYS024 CHANGES STARTS HERE 
#Table fields  (income)
 
     OUT MIR-SURR-INCM-ACCT-NM-T[8]
    {
        Length ="30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account Name";
        Index = "1";
    }
    OUT MIR-SURR-INCM-ACCT-CD-T[8]
    {
        Length ="10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Type";
        Index = "1";
    }     
 
    OUT MIR-SURR-INCM-AMT-T[8]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Income amount";
        Index = "1";
    } 
#Table fields  (Expense)  
     OUT MIR-SURR-XPNS-ACCT-NM-T[8]
    {
        Length ="30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account Name";
        Index = "1";
    }
    OUT MIR-SURR-XPNS-ACCT-CD-T[8]
    {
        Length ="10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Type";
        Index = "1";
    }     
 
    OUT MIR-SURR-XPNS-AMT-T[8]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Income amount";
        Index = "1";
    }  

     OUT MIR-TOT-SURR-INCM-AMT
     {
         CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Total Paid-up Income amount";
     }  
     
     OUT MIR-TOT-SURR-XPNS-AMT
     {
         CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Total Paid-up Expense";
     }  
     
     OUT MIR-NET-SURR-INCM-AMT
     {
         CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Net Paid-up Income amount";
     }  
     
     OUT MIR-NET-SURR-XPNS-AMT
     {
         CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Net Paid-up Expense amount";
     } 
#UYS024 CHANGES ENDS HERE
#S24736 CHANGES STARTS HERE      
      
      OUT MIR-WARN-MSG-CD
      {
        Length = "01";
        SType = "Text";
	Label = "Warning Message Indicator";        
      }   
#S24736 CHANGES END HERE      
#S25648 CHANGES START    
    OUT MIR-INS-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "PRSML";
        DBTableName = "TETAB";
        SType = "Text";
        Label = "InsuranceType";
    }  
#S25648 CHANGES END   
#S25705 CHANGES START
     OUT MIR-TCALC-PD-PREM-AMT
     {
         CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Paid Premium Amount";
     } 
#S25705 CHANGES END     
}
