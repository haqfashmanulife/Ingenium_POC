# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A62-I.s                                                    *
#*  Description: Death Claim Adjudicator Decision                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAAD  CTS     INITIAL VERSION                                            *
#*  IPCA03  CTS     ADDED INSURED NAME,ISSUE AGE AND SEX IN 'COVERAGE OTHER    *
#*                  SUBJECT TO INSURED' SECTION.                               *
#*  ABU241  CTS    ENHANCEMENT TO DISPLAY CAUSE DESCRIPTION                    *
#*  ABF423  CTS     CHANGES MADE TO DISPLAY THE SIGN FOR CLAIM                 *
#*                  PAYABLE AMOUNT                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  Q50989  CTS     M245B2 - FIX TO CHANGE THE MIR-CRCY-CD FROM INOUT TO IN    *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  MP302L  CTS     TD SURVIVAL BENEFIT DEATH CLAIM CHANGES                    *
#*  ULMG13  CTS      CHANGES DONE FOR LAPSE RIDER AS PART OF UL MEDICAL RIDER  *
#*                   PAYMENT COMPLETION CHANGES                                *
#*******************************************************************************

S-STEP BF9A62-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    DelEmptyRows;
    FocusField = "ClmButtonBarAdjDecsnSum";
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

  OUT index
  {
    SType = "Hidden";
  }

  IN MIR-CLM-ID
  {
    DefaultSession = "MIR-CLM-ID";
    DisplayOnly;
    Key;
    Length = "8";
    SType = "Text";
    Label = "Claim ID";
  }

  IN MIR-INSRD-CLI-NM
  {
    DisplayOnly;
    Length = "51";
    SType = "Text";
    Label = "Insured Name";
  }

  IN MIR-CLM-STAT-CD
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "CLM-STAT-CD";
    SType = "Text";
    Label = "Death Master Claim Status";
  }

  IN MIR-INSRD-CLI-ID
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Insured Client ID";
  }

  IN MIR-CLI-BTH-DT
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Insured Date Of Birth";
  }

  IN MIR-CLI-SEX-CD
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "CLI-SEX-CD";
    SType = "Text";
    Label = "Sex";
  }

  IN MIR-POL-ID
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Policy ID";
  }

  IN MIR-CLM-TYP-CD
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "DataModel";
    CodeType = "CLM-TYP-CD";
    SType = "Text";
    Label = "Claim Type";
  }
#ABU241 CHANGES START HERE
  IN MIR-CAUSE-DESC-TXT
  {
      DisplayOnly;
      Length = "40";
      DBTableName = "TDCLM";
      SType = "Text";
      Label = "Cause Description";
   }   
#ABU241 CHANGES END HERE  
  IN MIR-CLM-EFF-DT
  {
      Length = "10";
      DBTableName = "TDCLM";
      SType = "Date";
      Label = "Effective Date";
  }


  IN MIR-UL-LAPS-STRT-DT
  {
     DisplayOnly;
     Length = "10";
     DBTableName = "TPOL";
     SType = "Date";
     Label = "Lapse Start Date";
  }

  INOUT MIR-AUTO-BNFT-DECID-CD
  {
    Length = "2";
    CodeSource = "DataModel";
    CodeType = "BNFT-DECID-CD";
    DBTableName = "TDCBD";
    SType = "Selection";
   }


  IN MIR-POL-APP-REASN-CD
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "DataModel";
    CodeType = "POL-APP-REASN-CD";
    SType = "Text";
    Label = "Policy Type";
  }

  IN MIR-PLAN-ID
  {
    DisplayOnly;
    Length = "6";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Base Plan";
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

  IN MIR-POL-SUB-STAT-CD
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "EDIT";
    CodeType = "SUBSC";
    SType = "Text";
    Label = "Policy Sub Status";
  }
# ABF423 The attribute Signed is added

  IN MIR-POL-PAYBL-AMT
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    Signed;
    DisplayOnly;
    Length = "15";
    SType = "Currency";
    Label = "Payable Amount";
  }

  IN MIR-CVG-NUM-T[50]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Coverage Number";
    Index = "1";
  }

  IN MIR-PLAN-ID-T[50]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table1";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Plan";
    Index = "1";
  }

  IN MIR-CVG-ISS-EFF-DT-T[50]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Issue Effective Date";
    Index = "1";
  }

  IN MIR-CVG-MAT-XPRY-DT-T[50]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Coverage Maturity/Expiry Date";
    Index = "1";
  }

  IN MIR-CVG-CSTAT-CD-T[50]
  {
    DisplayOnly;
    Length = "3";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "CVG-CSTAT-CD";
    SType = "Text";
    Label = "Coverage Status";
    Index = "1";
  }

  INOUT MIR-CVG-SUB-STAT-CD-T[50]
  {
    Length = "2";
    FieldGroup = "Table1";
    CodeSource = "EDIT";
    CodeType = "SUBSC";
    SType = "Selection";
    Label = "Coverage Sub Status";
    Index = "1";
  }

  IN MIR-CVG-FACE-AMT-T[50]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Length = "16";
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Face Amount";
    Index = "1";
  }

  IN MIR-BNFT-NM-ID-T[50]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table1";
    CodeSource = "EDIT";
    CodeType = "BNNM";
    SType = "Text";
    Label = "Benefit Name";
    Index = "1";
  }
# ABF423 The attribute Signed is added

  IN MIR-CLM-ADJC-AMT-T[50]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Amount for Adjudication";
    Index = "1";
  }

# ABF423 The attribute Signed is added

  IN MIR-CLM-PAYBL-AMT-T[50]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "15";
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Payable Amount";
    Index = "1";
  }
#M245Q2 CHANGES START HERE
  IN MIR-DV-CLM-PAYBL-JPY-AMT-T[50]
  {
    Signed;
    Length = "15";
    FieldGroup = "Table2";
    SType = "Currency";
    Label = "Payable Amount(Converted to JPY)";
    Index = "1";
  }
#M245Q2 CHANGES END HERE
  IN MIR-CLM-OTHR-RFND-AMT-T[50]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Other Refund Amount";
    Index = "1";
  }


  IN MIR-PAYE-T[50]
  {
    DisplayOnly;
    Length = "51";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Payee";
    Index = "1";
  }

  INOUT MIR-BNFT-DECID-CD-T[50]
  {
    Length = "2";
    CodeSource = "DataModel";
    CodeType = "BNFT-DECID-CD";
    FieldGroup = "Table1";
    SType = "Selection";
    Label = "Decision";
    Index = "1";
  }

  INOUT MIR-BNFT-DCLN-REASN-CD-T[50]
  {
    Length = "2";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "BNFT-DCLN-REASN-CD";
    SType = "Selection";
    Label = "Decline Reason";
    Index = "1";
  }

  IN MIR-MSG-TXT-T[50]
  {
    DisplayOnly;
    Length = "120";
    FieldGroup = "Table2";
    SType = "Text";
    Label = "Message";
    Index = "1";
  }

  IN MIR-MSG-OPT-CD-T[50]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table2";
    CodeSource = "DataModel";
    CodeType = "DCLM-MSG-OPT-CD";
    SType = "Text";
    Label = "Level";
    Index = "1";
  }

  IN MIR-MSG-CVG-NUM-T[50]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table2";
    SType = "Text";
    Label = "Coverage Number";
    Index = "1";
  }

  IN MIR-CVG-ID-T[50]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table3";
    SType = "Text";
    Label = "Coverage ID";
    Index = "1";
  }

  IN MIR-CLM-REQIR-ID-T[50]
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table3";
    CodeSource = "EDIT";
    CodeType = "DCRQT";
    SType = "Text";
    Label = "Requirement";
    Index = "1";
  }

  IN MIR-CLM-REQIR-OPT-CD-T[50]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table3";
    CodeSource = "DataModel";
    CodeType = "DCLM-REQIR-OPT-CD";
    SType = "Text";
    Label = "Requirement Level";
    Index = "1";
  }

  IN MIR-REQIR-SEQ-NUM-T[50]
  {
     DisplayOnly;
     Length = "3";
     FieldGroup = "Table3";
     SType = "Hidden";
     Label = "Sequence Number";
     Index = "1";
  }

  INOUT MIR-REQIR-STAT-CD-T[50]
  {
    Length = "3";
    FieldGroup = "Table3";
    CodeSource = "EDIT";
    CodeType = "DRQST";
    SType = "Selection";
    Label = "Requirement Status";
    Index = "1";
  }

  INOUT MIR-REQIR-ORDR-DT-T[50]
  {
    Length = "10";
    FieldGroup = "Table3";
    SType = "Date";
    Label = "Ordered Date";
    Index = "1";
  }

  INOUT MIR-REQIR-RECV-DT-T[50]
  {
    Length = "10";
    FieldGroup = "Table3";
    SType = "Date";
    Label = "Received Date";
    Index = "1";
  }

  IN MIR-PREV-UPDT-USER-ID-T[50]
  {
    DisplayOnly;
    Length = "8";
    FieldGroup = "Table3";
    SType = "Text";
    Label = "Last Update User ID";
    Index = "1";
  }

  IN MIR-OTHR-CVG-NUM-T[50]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table4";
    SType = "Text";
    Label = "Coverage Number";
    Index = "1";
  }

  IN MIR-OTHR-PLAN-ID-T[50]
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table4";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Plan";
    Index = "1";
  }

  IN MIR-OTHR-ISS-EFF-DT-T[50]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table4";
    SType = "Date";
    Label = "Issue Effective Date";
    Index = "1";
  }

  IN MIR-OTHR-MAT-XPRY-DT-T[50]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table4";
    SType = "Date";
    Label = "Coverage Maturity/Expiry Date";
    Index = "1";
  }

  IN MIR-OTHR-CSTAT-CD-T[50]
  {
    DisplayOnly;
    Length = "3";
    FieldGroup = "Table4";
    CodeSource = "DataModel";
    CodeType = "CVG-CSTAT-CD";
    SType = "Text";
    Label = "Coverage Status";
    Index = "1";
  }

  IN MIR-OTHR-SUB-STAT-CD-T[50]
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table4";
    CodeSource = "EDIT";
    CodeType = "SUBSC";
    SType = "Text";
    Label = "Coverage Sub Status";
    Index = "1";
  }

  IN MIR-OTHR-FACE-AMT-T[50]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Length = "16";
    FieldGroup = "Table4";
    SType = "Currency";
    Label = "Face Amount";
    Index = "1";
  }

  IN MIR-OTHR-RFND-AMT-T[50]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table4";
    SType = "Currency";
    Label = "Other Refund Amount";
    Index = "1";
  }

  IN MIR-OTHR-PAYE-T[50]
  {
    DisplayOnly;
    Length = "51";
    FieldGroup = "Table4";
    SType = "Text";
    Label = "Payee";
    Index = "1";
  }

  INOUT MIR-OTHR-DECID-CD-T[50]
  {
    Length = "2";
    FieldGroup = "Table4";
    CodeSource = "DataModel";
    CodeType = "BNFT-DECID-CD";
    SType = "Selection";
    Label = "Decision";
    Index = "1";
  }

  INOUT MIR-OTHR-DCLN-REASN-CD-T[50]
  {
    Length = "2";
    FieldGroup = "Table4";
    CodeSource = "DataModel";
    CodeType = "BNFT-DCLN-REASN-CD";
    SType = "Selection";
    Label = "Decline Reason";
    Index = "1";
  }

# IPCA03 CHANGES STARTS HERE.

     IN MIR-OTHR-INSRD-CLI-NM-T[50]
     {
        Length = "51";
        DisplayOnly;
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
     }

    IN MIR-OTHR-INSRD-AGE-T[50]
    {
        Length = "03";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Issue Age";
        Index = "1";
     }

    IN MIR-OTHR-SEX-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

# IPCA03 CHANGES ENDS HERE.

#M245B2 CHANGES START HERE       
#Q50989 CHANGE START HERE
#       INOUT MIR-POL-CRCY-CD
     IN MIR-POL-CRCY-CD
#Q50989 CHANGE END HERE   
        {
           Length = "2";           
           SType = "Hidden";
           Label = "Currency";
        }
#M245B2 CHANGES END HERE  
#MP302L CHANGES START HERE
    IN MIR-SRVBEN-DEFR-AMT
         {
             CurrencyCode = "MIR-POL-CRCY-CD";
             Length = "15";
             SType = "Currency";
             Label = "Survival Benefit Deferral Amount";
         }
    
    IN MIR-SRVBEN-DEFR-INT-AMT
         {
             CurrencyCode = "MIR-POL-CRCY-CD";
             Length = "15";
             SType = "Currency";
             Label = "Deferral Interest";
         }
         
    IN MIR-SRVBEN-TOT-AMT
        {
             CurrencyCode = "MIR-POL-CRCY-CD";
             Length = "15";
             SType = "Currency";
             Label = "Total";
         }
         
    IN MIR-SRVBEN-CHRGBCK-AMT
        {
             CurrencyCode = "MIR-POL-CRCY-CD";
             Length = "15";
             SType = "Currency";
             Label = "Chargeback Amount";
        }

#MP302L CHANGES END HERE    
#ULMG13 CHANGES START HERE
    IN MIR-POST-LAPS-SUR-AMT
         {
             CurrencyCode = "MIR-POL-CRCY-CD";
             Length = "15";
             SType = "Currency";
             Label = "Cash Surrender Value";
         }
#ULMG13 CHANGES END HERE
  }

