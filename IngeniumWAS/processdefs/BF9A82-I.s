#*******************************************************************************
#*  Component:   BF9A82-O.s                                                    *
#*  Description: Claim Payment                                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAPM  CTS      Intial version                                            *
#*  ABU233  CTS      Added 'Coverage Number' Field                             *
#*  ABF423  CTS      changes made to display the sign of payable Amount        * 
#*  ISLCLM  CTS      ADDED A NEW FIELD FOR 'NUMBER OF DAYS TO                  *
#*                   CLAIM PAYMENT DUE'                                        *
#*  143C38  CTS      ADDED A NEW FIELD TO DISPLAY THE TRAD PAID                *
#*                   TO DATE FOR NWL AND AMI DEATH CLAIMS                      *      
#*  M166P3  CTS      ADDED NEW FIELDS TO DISPLAY APL , CASH                    *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  MP265H  CTS      ADDED MRF INDICATOR AS PART OF NOMURA                     *
#*  M271A3  CTS      FRA DEATH CLAIM CHANGES                                   *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  Q61776  CTS      FRA Foreign Currency Formatting 			       *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  M319O1  CTS      FXWL CURRENCY CODE CHANGES                                *
#*  CS0008  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  FFF0A7  CTS      CHANGES FOR FFF - DEATH CLAIM                             *
#*******************************************************************************
S-STEP BF9A82-I
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
    FieldGroup = "Table2";
    Index = "1";
    Label = "Final Approval Date";
    Length = "10";
    SType = "Date";
  }

  INOUT MIR-SEQ-NUM-2-T[50]
  {
    CodeSource = "CSOM9A85";
    FilterFields = "1";
    FilterField1 = "MIR-CLM-ID";
    FieldGroup = "Table2";
    Index = "1";
    Label = "Payee";
    Length = "50";
    SType = "Selection";
  }

#M245Q2 CHANGES START HERE
  INOUT MIR-PAYO-MTHD-CD
  {
    Length = "18";
    CodeSource = "DataModel";
    CodeType = "PAYO-MTHD-CD";
    DefaultConstant = "FB";    
    DBTableName = "TDCBD";
    SType = "Selection";
    Label = "Payout Method";
  }  
    
  INOUT MIR-PAYO-JPY-BNFT-CD
  {
    Length = "12";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    DefaultConstant = " ";
    DBTableName = "TDCBD";
    SType = "Selection";
    Label = "JPY Benefit Rider";
  }  
#M245Q2 CHANGES END HERE

  INOUT MIR-DLAY-INT-STRT-DT
  {
    Label = "Delay Interest Start Date";
    Length = "10";
    SType = "Date";
  }
  
#ISLCLM CHANGES START
  INOUT MIR-DCLM-DYS-BFR-PMT-DUE
  {
    Length = "03";
    CodeSource = "DataModel";
    CodeType = "DYS-BFR-PMT-DUE";
    DefaultConstant = "005";
    DBTableName = "TDCBD";
    SType = "Selection";
    Label = "Days Before Claim Payment Due";
  }    
#ISLCLM CHANGES END 

  IN MIR-POL-UL-SHRT-AMT
  {
    #	M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE   
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
 
  IN MIR-CLM-EFF-DT
  {
    DisplayOnly;
    Label = "Claim Effective Date";
    Length = "10";
    SType = "Date";
  }
 #143C38 CHANGES START
  
  IN MIR-TRAD-PD-TO-DT-NUM
  {
      DisplayOnly;
      Label = "Trad Paid to Date";
      Length = "10";
      SType = "Date";
  }
 
 #143C38 CHANGES END

  INOUT MIR-PREM-DED-AMT
  {
    #	M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
      #  CurrencyCode = "MIR-PREM-CRCY-CD";
#Q61776 CHANGES START HERE CHANGING CURRENCY CODE        
       CurrencyCode = "MIR-POL-CRCY-CD";      
#Q61776 CHANGES END HERE        
#M271O1 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE 
    Label = "Premium Amount to Deduct";
#M245B2 CHANGES START HERE         
#        Length = "11";
        Length = "12";
#M245B2 CHANGES END HERE  
    SType = "Currency";
    Signed;
  }

  INOUT MIR-SEQ-NUM-3
  {
    CodeSource = "CSOM9A85";
                FilterFields = "1";
                FilterField1 = "MIR-CLM-ID";
    Label = "Payee";
    Length = "50";
    SType = "Selection";
  }

  INOUT MIR-SEQ-NUM-4
  {
    CodeSource = "CSOM9A85";
                FilterFields = "1";
                FilterField1 = "MIR-CLM-ID";
    Label = "Payee";
    Length = "50";
    SType = "Selection";
  }

  IN MIR-PREM-SUSP-AMT
  {
    #	M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
#FFF0A7 CHANGES START HERE
#        CurrencyCode = "MIR-PMT-CRCY-CD";
        CurrencyCode = "MIR-SUSP-CRCY-CD";
#FFF0A7 CHANGES END HERE
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE 
    DisplayOnly;
    Label = "Premium Amount to Deduct";
    Length = "15";
    SType = "Currency";
    Signed;
  }
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
       
     INOUT MIR-SEQ-NUM-5
    {
        Length = "50";
        CodeSource = "CSOM9A85";
        FilterFields = "1";
        FilterField1 = "MIR-CLM-ID";
        SType = "Selection";
        Label = "Payee";
    }  
    
   IN MIR-DV-APL-BAL-AMT
       {
    #	M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE 
           DisplayOnly;
           Signed;
           Length = "15";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "APL  Balance";
       } 
       
   INOUT MIR-SEQ-NUM-6
       {
           Length = "50";
           CodeSource = "CSOM9A85";
           FilterFields = "1";
           FilterField1 = "MIR-CLM-ID";
           SType = "Selection";
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

   INOUT MIR-MRF-IND
       {
           Length = "1";
           SType = "Indicator";
           Label = "MRF Indicator";
       }


#MP265H CHANGES ENDS HERE
#M271O1 CHANGES START HERE  
     
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 

#M271A3 CHANGES START HERE

   INOUT MIR-MRF-2-IND
       {
           Length = "1";
           SType = "Indicator";
           Label = "MRF-2 Indicator";
       }
#M271A3 CHANGES ENDS HERE
# MP300C CHANGES STARTS HERE 
   INOUT MIR-PRE-LCD-CHK-IND     
       {
	   Length = "01";
	   CodeSource = "DataModel";
	   CodeType = "PRE-LCD-CHK-IND";
	   DefaultConstant = "005";
	   DBTableName = "TDCBD";
	   SType = "Selection";
	   Label = "Pre-LCD Check";
       }    
                
#MP300C CHANGES ENDS HERE
#CS0008 CHANGES STARTS HERE    
   INOUT MIR-TRMN-NOTI-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "TRMN-NOTI-CD";
        DefaultConstant = "005";
        DBTableName = "TDCBD";
        SType = "Selection";
        Label = "Policy Continuation/Termination";
    }
        
#CS0008 CHANGES ENDS HERE
#M319O1 CHANGES START HERE 
    INOUT MIR-PMT-CRCY-CD
     {
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
     } 
#M319O1 CHANGES END HERE      
#Q90721 CHANGES START HERE
     INOUT MIR-SUSP-CRCY-CD
      {
          Length = "2";           
	  SType = "Hidden";
	  Label = "Currency";
      }	
#Q90721 CHANGES END HERE
}
