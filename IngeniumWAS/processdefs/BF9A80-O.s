#*******************************************************************************
#*  Component:   BF9A80-O.s                                                    *
#*  Description: Claim Payment                                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAPM  CTS      Intial version                                            *
#*  ABF419  CTS      CHANGED 'SUM OF PREMIUM SUSPENSE ' TO 'SUM OF SUSPENSE'   *
#*  ABU233  CTS      ADDED 'COVERAGE NUMBER' FIELD                             *
#*  ABF423  CTS      changes made to display the sign of payable Amount        * 
#*  ISLCLM  INSLAW   ADDED A NEW FIELD FOR 'NUMBER OF DAYS TO                  *
#*                   CLAIM PAYMENT DUE'                                        *
#*  143C38  CTS      ADDED A NEW FIELD TO DISPLAY THE TRAD PAID                *
#*                   TO DATE FOR NWL AND AMI DEATH CLAIMS                      *                                                                           *
#*  M166P3  CTS      ADDED NEW FIELDS TO DISPLAY APL , CASH                    *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  MP265H  CTS      ADDED MRF INDICATOR AS PART OF NOMURA                     *
#*  Q61523  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A3  CTS      FRA DEATH CLAIM CHANGES                                   *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  M319O1  CTS      FXWL Currency Code Changes                                * 
#*  CS0008  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  FFF0A7  CTS      CHANGES FOR FFF - DEATH CLAIM                             *
#*******************************************************************************

S-STEP BF9A80-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    DelEmptyRows;
    FocusField = "OKButton";
    FocusFrame = "ButtonFrame";
    Type = "Output";
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

        INOUT MIR-DV-PRCES-STATE-CD
        {
            Length = "1";
            SType = "Hidden";
            Label = "process code";
        }

  IN MIR-CLM-ID
  {
    DefaultSession = "MIR-CLM-ID";
    DisplayOnly;
    Key;
    Label = "Death Master Claim ID";
    Length = "8";
    SType = "Text";
  }

  IN MIR-POL-ID
  {
    DisplayOnly;
    KeyColumn;
    Label = "Policy ID";
    Length = "10";
    SType = "Text";
  }

  IN MIR-DV-INS-CLI-NM
  {
    DisplayOnly;
    Label = "Insured Name";
    Length = "75";
    SType = "Text";
  }

  IN MIR-CLM-STAT-CD
  {
    CodeSource = "DataModel";
    CodeType = "CLM-STAT-CD";
    DisplayOnly;
    Label = "Death Master Claim Status";
    Length = "40";
    SType = "Text";
  }

  IN MIR-INSRD-CLI-ID
  {
    DisplayOnly;
    Label = "Insured Client ID";
    Length = "10";
    SType = "Text";
  }

  IN MIR-CLM-HO-ACPT-DT
  {
    DisplayOnly;
    Label = "Head Office Claim Form Acceptance Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-PLAN-ID-T[50]
  {
    CodeSource = "EDIT";
    CodeType = "PLAN";
    DisplayOnly;
    FieldGroup = "Table2";
    Index = "1";
    Label = "Rider Name";
    Length = "40";
    SType = "Text";
  }
  
# ABU233 CHANGES START HERE.

   IN MIR-CVG-NUM-T[50]
   {
      Length = "2";
      DisplayOnly;
      FieldGroup = "Table2";
      DBTableName = "TDCBD";
      SType = "Text";
      Label = "Cov.number";
      Index = "1";
   }
    
# ABU233 CHANGES END HERE.  

  IN MIR-BNFT-NM-ID-T[50]
  {
    CodeSource = "EDIT";
    CodeType = "BNNM";
    DisplayOnly;
    FieldGroup = "Table2";
    Index = "1";
    Label = "Benefit Name";
    Length = "40";
    SType = "Text";
  }

  IN MIR-BNFT-DECID-CD-T[50]
  {
    CodeSource = "DataModel";
    CodeType = "BNFT-DECID-CD";
    DisplayOnly;
    FieldGroup = "Table2";
    Index = "1";
    Label = "Decision";
    Length = "2";
    SType = "Text";
  }
  
# ABF423 The attribute Signed is added  

  IN MIR-CLM-PAYBL-AMT-T[50]
  {
#M245B2 CHANGES START HERE   
    CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    FieldGroup = "Table2";
    Index = "1";
    Label = "Payable Amount";
    Length = "15";
    SType = "Currency";
    Signed;
  }

  IN MIR-FINAL-APROV-DT-T[50]
  {
    DisplayOnly;
    FieldGroup = "Table4";
    Index = "1";
    Label = "Final Approval Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-SEQ-NUM-2-T[50]
  {
    CodeSource = "CSOM9A85";
    FilterFields = "1";
    FilterField1 = "MIR-CLM-ID";
    DefaultConstant=" ";
    DisplayOnly;
    FieldGroup = "Table2";
    Index = "1";
    Label = "Payee";
    Length = "50";
    SType = "Text";
  }

#M245Q2 CHANGES START HERE
  IN MIR-PAYO-MTHD-CD
  {
    Length = "18";
    CodeSource = "DataModel";
    CodeType = "PAYO-MTHD-CD";
    DisplayOnly;
    SType = "Text";
    Label = "Payout Method";
  }  
    
  IN MIR-PAYO-JPY-BNFT-CD
  {
    Length = "12";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    DisplayOnly;    
    SType = "Text";
    Label = "JPY Benefit Rider";
  }  
#M245Q2 CHANGES END HERE

  IN MIR-DLAY-INT-STRT-DT
  {
    DisplayOnly;
    Label = "Delay Interest Start Date";
    Length = "10";
    SType = "Date";
  }
#ISLCLM CHANGES START  
  IN MIR-DCLM-DYS-BFR-PMT-DUE
  {
    Length = "03";
    CodeSource = "DataModel";
    CodeType = "DYS-BFR-PMT-DUE";
    SType = "Text";
    Label = "Days Before Claim Payment Due";
  }
 
#ISLCLM CHANGES END

  IN MIR-POL-UL-SHRT-AMT
  {
#M245B2 CHANGES START HERE    
#Q61523 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#Q61523 CHANGES END HERE 
#M245B2 CHANGES END HERE  
    DisplayOnly;
    Label = "Shortage Amount";
    Length = "15";
    SType = "Currency";
    Signed;
  }

  IN MIR-UL-LAPS-STRT-DT
  {
    DisplayOnly;
    Label = "Lapse Start Date";
    Length = "10";
    SType = "Date";
  }
  
#143C38 CHANGES STRAT

  IN MIR-TRAD-PD-TO-DT-NUM
  {
      DisplayOnly;
      Label = "Trad Paid to Date";
      Length = "10";
      SType = "Date";
  }
#143C38 CHANGES END

  IN MIR-CLM-EFF-DT
  {
    DisplayOnly;
    Label = "Claim Effective Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-PREM-DED-AMT
  {
#M245B2 CHANGES START HERE    
       CurrencyCode = "MIR-POL-CRCY-CD";
#Q61523 CHANGES END HERE 
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Label = "Premium Amount to Deduct";
    Length = "11";
    SType = "Currency";
    Signed;
  }

  IN MIR-SEQ-NUM-3
  {
    CodeSource = "CSOM9A85";
    FilterFields = "1";
    FilterField1 = "MIR-CLM-ID";
    DisplayOnly;
    Label = "Payee";
    Length = "50";
    SType = "Text";
  }

  IN MIR-SEQ-NUM-4
  {
    CodeSource = "CSOM9A85";
    FilterFields = "1";
    FilterField1 = "MIR-CLM-ID";
    DisplayOnly;
    Label = "Payee";
    Length = "50";
    SType = "Text";
  }

# ABF419 CHANGES START HERE  
  IN MIR-PREM-SUSP-AMT
  {
#M245B2 CHANGES START HERE    
#Q61523 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
#FFF0A7 CHANGES START HERE
#        CurrencyCode = "MIR-PMT-CRCY-CD";
        CurrencyCode = "MIR-SUSP-CRCY-CD";
#FFF0A7 CHANGES END HERE 
#M319O1 CHANGES END HERE            
#Q61523 CHANGES END HERE 
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Label = "Sum of Suspense";
    Length = "15";
    SType = "Currency";
    Signed;
  }
# ABF419 CHANGES ENDS HERE 

  #M166P3 CHANGES STARTS HERE
   
   IN MIR-DV-CSH-LOAN-BAL
       {
#M245B2 CHANGES START HERE    
           CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
           DisplayOnly;
           Signed;
           Length = "15";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "Cash Loan Balance";
       }
       
     IN MIR-SEQ-NUM-5
    {
        DisplayOnly;
        Length = "50";
        CodeSource = "CSOM9A85";
        FilterFields = "1";
        FilterField1 = "MIR-CLM-ID";
        SType = "Text";
        Label = "Payee";
    }  
    
   IN MIR-DV-APL-BAL-AMT
       {
   #M245B2 CHANGES START HERE    
           CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
           DisplayOnly;
           Signed;
           Length = "15";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "APL  Balance";
       } 
       
   IN MIR-SEQ-NUM-6
       {
           DisplayOnly;
           Length = "50";
           CodeSource = "CSOM9A85";
           FilterFields = "1";
           FilterField1 = "MIR-CLM-ID";
           SType = "Text";
           Label = "Payee";
    }  
  #M166P3 CHANGES ENDS  HERE
#M245B2 CHANGES START HERE   
  INOUT MIR-POL-CRCY-CD
      {
          
          Length = "2";  
          SType = "Hidden";
          Label = "Currency";
    }
#M245B2 CHANGES END HERE 
#MP265H CHANGES START HERE

   IN MIR-MRF-IND
       {
           DisplayOnly;
           Length = "1";
           SType = "Indicator";
           Label = "MRF Indicator";
       }


#MP265H CHANGES ENDS HERE

#Q61523 CHANGES START HERE  
     
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#Q61523 CHANGES END HERE 

#M271A3 CHANGES START HERE

   IN MIR-MRF-2-IND
       {
           DisplayOnly;
           Length = "1";
           SType = "Indicator";
           Label = "MRF-2 Indicator";
       }

#M271A3 CHANGES ENDS HERE
#*MP300C CHANGES START
        IN MIR-PRE-LCD-CHK-IND
        {
                Length = "01";
                CodeSource = "DataModel";
                CodeType = "PRE-LCD-CHK-IND";
                SType = "Text";
                Label = "Pre-LCD Check";
        }     
#*MP300C CHANGES END
#*CS0008 CHANGES START
        IN MIR-TRMN-NOTI-CD
        {
                Length = "01";
                CodeSource = "DataModel";
                CodeType = "TRMN-NOTI-CD";
                SType = "Text";
                Label = "Policy Continuation/Termination";
        }     
#*CS0008 CHANGES END
#M319O1 CHANGES START HERE      
     INOUT MIR-PMT-CRCY-CD
      {     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
     }
#M319O1 CHANGES END HERE
#FFF0A7 CHANGES START HERE
	IN MIR-SUSP-CRCY-CD
	  {
	   Length = "2";           
	   SType = "Hidden";
	   Label = "Currency";
	  }	
#FFF0A7 CHANGES END HERE
}
