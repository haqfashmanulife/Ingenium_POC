# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A80-P.p                                                    *
#*  Description: Claim Payment                                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAPM  CTS      Intial version					       *
#*  ABF419  CTS      CHANGED 'SUM OF PREMIUM SUSPENSE ' TO 'SUM OF SUSPENSE'   *
#*  ABU233  CTS      ADDED 'COVERAGE NUMBER' FIELD                             *
#*  ISLCLM  INSLAW   ADDED A NEW FIELD FOR 'NUMBER OF DAYS TO                  *
#*                   CLAIM PAYMENT DUE'                                        *
#*  143C38  CTS      ADDED A NEW FIELD TO DISPLAY THE TRAD PAID                *
#*                   TO DATE FOR NWL AND AMI DEATH CLAIMS                      *                                                                           *
#*  M166P3  CTS      ADDED NEW FIELDS TO DISPLAY APL , CASH                    *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  MP265H  CTS      ADDED MRF INDICATOR AS PART OF NOMURA                     *
#*  Q61523  CTS      FRA Foreign Currency Formatting 			       *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  M319O1  CTS      FXWL Foreign Currency Formatting                          *
#*  CS0008  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  FFF0A7  CTS      CHANGES FOR FFF - DEATH CLAIM                             *
#*******************************************************************************

P-STEP BF9A80-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A80";
        BusinessFunctionName = "Claim Payment Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9A80";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }
    
    INOUT MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "DCLM";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Death Master Claim ID";
    }
    
    OUT MIR-POL-ID
    {
        Length = "10";
        KeyColumn;
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Policy ID";
    }
    
    OUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    OUT MIR-CLM-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim Status";
    }
    OUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Insured Client ID";
    }
    OUT MIR-CLM-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }
    
    OUT MIR-PLAN-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
    OUT MIR-BNFT-NM-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "BNNM";
        DBTableName = "TDBEN";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
    OUT MIR-BNFT-DECID-CD-T[50]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "BNFT-DECID-CD";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Decision";
        Index = "1";
    }
    OUT MIR-CLM-PAYBL-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        DBTableName = "TDCBD";
        SType = "Currency";
        Label = "Payable Amount";
        Index = "1";
    }
    
# ABU233 CHANGES START HERE.

    OUT MIR-CVG-NUM-T[50]
    {
        Length = "2";
        FieldGroup = "Table2";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Cov.number";
        Index = "1";
    }
    
# ABU233 CHANGES END HERE.

    OUT MIR-FINAL-APROV-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TFBNK";
        SType = "Date";
        Label = "Final Approval Date";
        Index = "1";
    }
    OUT MIR-SEQ-NUM-2-T[50]
    {
        Length = "50";
        FieldGroup = "Table2";
        CodeSource = "CSOM9A85";
        FilterFields = "1";
        FilterField1 = "MIR-CLM-ID";
        Index = "1";
    	SType = "Selection";
    	Label = "Payee";
    }
#M245Q2 CHANGES START HERE

    OUT MIR-PAYO-MTHD-CD
    {
        Length = "18";
        CodeSource = "DataModel";
        CodeType = "PAYO-MTHD-CD";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Payout Method";
    }  
    
    OUT MIR-PAYO-JPY-BNFT-CD
    {
        Length = "12";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "JPY Benefit Rider";
    }  
#M245Q2 CHANGES END HERE   
    OUT MIR-DLAY-INT-STRT-DT
    {
        Length = "10";        
        DBTableName = "TDCBD";
        SType = "Date";
        Label = "Delay Interest Start Date";
    }
    
#ISLCLM CHANGES START
    OUT MIR-DCLM-DYS-BFR-PMT-DUE
    {
        Length = "03";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Days Before Claim Payment Due";
    }    
#ISLCLM CHANGES END        
    
    OUT MIR-POL-UL-SHRT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Shortage Amount";
    }
    OUT MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
    }
    
    OUT MIR-CLM-EFF-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Claim Effective Date";
    }
    #143C38 CHANGES START
        
    OUT MIR-TRAD-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Trad Paid to Date";
    }
        
    #143C38 CHANGES END
    
    OUT MIR-PREM-DED-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Premium Amount to Deduct";
    }
    OUT MIR-SEQ-NUM-3
    {
        Length = "50";
        CodeSource = "CSOM9A85";
        FilterFields = "1";
        FilterField1 = "MIR-CLM-ID";
        SType = "Selection";
        Label = "Payee";
        
     }
        
    OUT MIR-SEQ-NUM-4
    {
        Length = "50";
        CodeSource = "CSOM9A85";
        FilterFields = "1";
        FilterField1 = "MIR-CLM-ID";
        SType = "Selection";
        Label = "Payee";
              
    }

# ABF419 CHANGES START HERE
    OUT MIR-PREM-SUSP-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sum of Suspense";
    }
# ABF419 CHANGES ENDS HERE

  #M166P3 CHANGES STARTS HERE
   
      OUT MIR-DV-CSH-LOAN-BAL
       {
           Signed;
           Length = "15";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "Cash Loan Balance";
       }
       
     OUT MIR-SEQ-NUM-5
      {
        Length = "50";
        CodeSource = "CSOM9A85";
        FilterFields = "1";
        FilterField1 = "MIR-CLM-ID";
        SType = "Selection";
        Label = "Payee";
      }  
    
    OUT MIR-DV-APL-BAL-AMT
       {
           Signed;
           Length = "15";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "APL  Balance";
       } 
       
      OUT MIR-SEQ-NUM-6
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

      OUT MIR-MRF-IND
      {
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
#MP300C CHANGES STARTS HERE    
     OUT MIR-PRE-LCD-CHK-IND
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "PRE-LCD-CHK-IND";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Pre-LCD Check";
    }
        
#MP300C CHANGES ENDS HERE
#CS0008 CHANGES STARTS HERE    
     OUT MIR-TRMN-NOTI-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "TRMN-NOTI-CD";
        DBTableName = "TDCBD";
        SType = "Text";
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
#FFF0A7 CHANGES START

        OUT MIR-SUSP-CRCY-CD
        {
                Length = "2";           
                SType = "Hidden";
                Label = "Currency";
        }

#FFF0A7 CHANGES END
}    
