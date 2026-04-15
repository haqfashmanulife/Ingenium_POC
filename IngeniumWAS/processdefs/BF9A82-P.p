# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A82-P.p                                                    *
#*  Description: Claim Payment                                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAPM  CTS      Intial version                                            *
#*  ABU233  CTS      Added 'Coverage Number' Field                             *
#*  ISLCLM  CTS      ADDED NEW DROPDOWN FIELD FOR NUMBER OF DAYS TO CLAIM      *
#*  ISLCLM           PAYMENT DUE                                               *
#*  143C38  CTS      ADDED A NEW FIELD TO DISPLAY THE TRAD PAID                *
#*                   TO DATE FOR NWL AND AMI DEATH CLAIMS                      *      
#*  M166P3  CTS      ADDED NEW FIELDS TO DISPLAY APL , CASH                    *
#*  M245B2  CTS      FOREIGN CURRENCY FORMATTING                               *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  Q52972  CTS      ADDED JPY BENEFIT INDICATOR                               *
#*  MP265H  CTS      ADDED MRF INDICATOR AS PART OF NOMURA                     *
#*  Q57608  CTS      ADDED MRF INDICATOR                                       *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A3  CTS      FRA DEATH CLAIM CHANGES                                   *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  M319O1  CTS      FXWL CURRENCY CODE CHANGES                                *
#*  CS0008  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  FFF0A7  CTS      CHANGES FOR FFF - DEATH CLAIM                             *
#*******************************************************************************

P-STEP BF9A82-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A82";
        BusinessFunctionName = "Claim Payment Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9A82";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "DCLM";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    INOUT MIR-POL-ID
    {
        Length = "10";
        KeyColumn;
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    INOUT MIR-CLM-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim Status";
    }
    INOUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Insured Client ID";
    }
    INOUT MIR-CLM-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }

    INOUT MIR-PLAN-ID-T[50]
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
    INOUT MIR-BNFT-NM-ID-T[50]
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
    INOUT MIR-BNFT-DECID-CD-T[50]
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
    INOUT MIR-CLM-PAYBL-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        DBTableName = "TDCBD";
        SType = "Currency";
        Label = "Payable Amount";
        Index = "1";
    }
    INOUT MIR-FINAL-APROV-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TFBNK";
        SType = "Date";
        Label = "Final Approval Date";
        Index = "1";
    }

# ABU233 CHANGES START HERE.

    INOUT MIR-CVG-NUM-T[50]
    {
        Length = "2";
        FieldGroup = "Table2";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Cov.number";
        Index = "1";
    }

# ABU233 CHANGES END HERE.

    INOUT MIR-SEQ-NUM-2-T[50]
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

  INOUT MIR-PAYO-MTHD-CD
  {
    Length = "18";
    CodeSource = "DataModel";
    CodeType = "PAYO-MTHD-CD";
    DBTableName = "TDCBD";
    SType = "Selection";
    Label = "Payout Method";
  }  
    
  INOUT MIR-PAYO-JPY-BNFT-CD
  {
    Length = "12";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    DBTableName = "TDCBD";
    SType = "Selection";
    Label = "JPY Benefit Rider";
  }  
#M245Q2 CHANGES END HERE

    INOUT MIR-DLAY-INT-STRT-DT
    {
        Length = "10";
        DBTableName = "TDCBD";
        SType = "Date";
        Label = "Delay Interest Start Date";
    }
#ISLCLM CHANGES START    
    INOUT MIR-DCLM-DYS-BFR-PMT-DUE
    {
        Length = "03";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TDCBD";
        SType = "Selection";
        Label = "Days Before Claim Payment Due";
    }
    
#ISLCLM CHANGES END        
    

    INOUT MIR-POL-UL-SHRT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Shortage Amount";
    }
    INOUT MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
    }

    INOUT MIR-CLM-EFF-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Claim Effective Date";
    }
    #143C38 CHANGES START
    
    INOUT MIR-TRAD-PD-TO-DT-NUM
    {
         Length = "10";
         DBTableName = "TPOL";
         SType = "Date";
         Label = "Trad Paid to Date";
    }
        
    #143C38 CHANGES END
    
    INOUT MIR-PREM-DED-AMT
    {
        Signed;
#M245B2 CHANGES START HERE         
#        Length = "11";
        Length = "12";
#M245B2 CHANGES END HERE         
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Premium Amount to Deduct";
    }
    INOUT MIR-SEQ-NUM-3
    {
        Length = "50";
        CodeSource = "CSOM9A85";
        FilterFields = "1";
        FilterField1 = "MIR-CLM-ID";
        SType = "Selection";
        Label = "Payee";

     }

    INOUT MIR-SEQ-NUM-4
    {
        Length = "50";
        CodeSource = "CSOM9A85";
        FilterFields = "1";
        FilterField1 = "MIR-CLM-ID";
        SType = "Selection";
        Label = "Payee";

    }
    INOUT MIR-PREM-SUSP-AMT
    {
        Signed;
  Length = "15";
  FieldGroup = "Table4";
  DBTableName = "TPOL";
  SType = "Currency";
  Label = "Premium Amount to Deduct";
  Index = "1";
    }

  #M166P3 CHANGES STARTS HERE
   
   INOUT MIR-DV-CSH-LOAN-BAL
       {
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
    
   INOUT MIR-DV-APL-BAL-AMT
       {
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
#Q52972 CHANGES START HERE
       
        INOUT MIR-PREV-PAYO-JPY-BNFT-CD
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Previous JPY benefit indicator";
        }
#Q52972 CHANGES END HERE

#MP265H CHANGES START HERE

    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }


#MP265H CHANGES ENDS HERE
#Q57608 CHANGES START HERE
       
        INOUT MIR-PREV-MRF-IND
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Previous MRF Indicator";
        }
#Q57608 CHANGES END HERE

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

      
    INOUT MIR-PREV-MRF-2-IND
    {     
            Length = "1";
            SType = "Hidden";
            Label = "Previous MRF-2 Indicator";
    }
#M271A3 CHANGES END HERE
#MP300C CHANGES STARTS HERE    
     INOUT MIR-PRE-LCD-CHK-IND
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "PRE-LCD-CHK-IND";
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
#FFF0A7 CHANGES START

        INOUT MIR-SUSP-CRCY-CD
        {
                Length = "2";           
                SType = "Hidden";
                Label = "Currency";
        }

#FFF0A7 CHANGES END
}
