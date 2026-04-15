# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A60-P.p                                                    *
#*  Description: Death Claim Adjudicator Inquiry                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAMC  CTS     INITIAL VERSION                                            *
#*  IPCA03  CTS     ADDED INSURED NAME,ISSUE AGE AND SEX IN 'COVERAGE OTHER    *
#*                  SUBJECT TO INSURED' SECTION.                               *
#*  ABU241  CTS    ENHANCEMENT TO DISPLAY CAUSE DESCRIPTION                    *
#*  EN9547  CTS    COMMENTED OUT THE VARIABLE  MIR-POL-ID  IN ONE PLACE        *
#*                 DUE TO DUPLICATE DECLARATION                                *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245Q2  CTS    SPWL CHANGES FOR DEATH CLAIMS                             *
#*  MP302L  CTS     TD SURVIVAL BENEFIT DEATH CLAIM CHANGES                    *
#*  ULMG13  CTS      CHANGES DONE FOR LAPSE RIDER AS PART OF UL MEDICAL RIDER  *
#*                   PAYMENT COMPLETION CHANGES                                *
#*******************************************************************************

P-STEP BF9A60-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A60";
        BusinessFunctionName = "Death Claim Adjudicator Inquiry";
        BusinessFunctionType = "List";
        MirName = "CCWM9A60";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-PRCES-STAT-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }
    INOUT MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DefaultSession = "MIR-CLM-ID";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    OUT MIR-INSRD-CLI-NM
    {
        Length = "51";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-CLM-STAT-CD
    {
        Length = "1";
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

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Insured Date Of Birth";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
#EN9547 CHANGES START HERE	
#    OUT MIR-POL-ID
#    {
#        Length = "10";
#        DBTableName = "TDCLM";
#        SType = "Text";
#        Label = "Policy ID";
#    }
#EN9547 CHANGES END HERE
    OUT MIR-CLM-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLM-TYP-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Claim Type";
    }

    OUT MIR-CLM-EFF-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-UL-LAPS-STRT-DT
    {
      Length = "10";
      DBTableName = "TPOL";
      SType = "Date";
      Label = "Lapse Start Date";
    }
    
#ABU241 CHANGES START HERE
    OUT MIR-CAUSE-DESC-TXT
    {
      Length = "40";
      DBTableName = "TDCLM";
      SType = "Text";
      Label = "Cause Description";
    }   
#ABU241 CHANGES END HERE  

	
    OUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }

    OUT MIR-POL-APP-REASN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-APP-REASN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Type";

    }

    OUT MIR-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Base Plan";
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

    OUT MIR-POL-SUB-STAT-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Sub Status";

    }

    OUT MIR-POL-PAYBL-AMT
    {
        Length = "15";
        DBTableName = "TDCBN";
        SType = "Currency";
        Label = "Payable Amount";

    }

    OUT MIR-CVG-NUM-T[50]
    {
        Length = "2";
        FieldGroup = "Table1";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[50]
    {
        FieldGroup = "Table1";
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-CVG-ISS-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Effective Date";
        Index = "1";
    }

    OUT MIR-CVG-MAT-XPRY-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage Maturity/Expiry Date";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-SUB-STAT-CD-T[50]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[50]
    {
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-BNFT-NM-ID-T[50]
    {
        Length = "5";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "BNNM";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }

    OUT MIR-CLM-ADJC-AMT-T[50]
    {
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TDCBD";
        SType = "Currency";
        Label = "Amount for Adjudication";
        Index = "1";
     }

     OUT MIR-CLM-PAYBL-AMT-T[50]
     {
         Length = "15";
         FieldGroup = "Table1";
         DBTableName = "TCBD";
         SType = "Currency";
         Label = "Payable Amount";
         Index = "1";
     }
#M245Q2 CHANGES START HERE
     OUT MIR-DV-CLM-PAYBL-JPY-AMT-T[50]
      {
         Signed;
         Length = "15";
         FieldGroup = "Table2";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Payable Amount(Converted to JPY)";
         Index = "1";
         }
#M245Q2 CHANGES END HERE
     OUT MIR-CLM-OTHR-RFND-AMT-T[50]
     {
         Length = "15";
         FieldGroup = "Table1";
         DBTableName = "TCBD";
         SType = "Currency";
         Label = "Other Refund Amount";
         Index = "1";
     }

     OUT MIR-PAYE-T[50]
     {
         Length = "51";
         FieldGroup = "Table1";
         SType = "Text";
         Label = "Payee";
         Index ="1";
     }

     OUT MIR-BNFT-DECID-CD-T[50]
     {
         Length = "2";
         FieldGroup = "Table1";
         CodeSource = "DataModel";
         CodeType = "BNFT-DECID-CD";
         DBTableName = "TDCBD";
         SType = "Text";
         Label = "Decision";
         Index = "1";
     }

     OUT MIR-BNFT-DCLN-REASN-CD-T[50]
     {
         Length = "2";
         FieldGroup = "Table1";
         CodeSource = "DataModel";
         CodeType = "BNFT-DCLN-REASN-CD";
         DBTableName = "TDCBD";
         SType = "Text";
         Label = "Decline Reason";
         Index = "1";
     }

     OUT MIR-MSG-CVG-NUM-T[50]
     {
         Length = "2";
         FieldGroup = "Table2";
         DBTableName = "TDCKO";
         SType = "Text";
         Label = "Coverage Number";
         Index = "1";
     }

     OUT MIR-MSG-TXT-T[50]
     {
         Length = "120";
         FieldGroup = "Table2";
         DBTableName = "TMSGS";
         SType = "Text";
         Label = "Message";
         Index = "1";
     }

     OUT MIR-MSG-OPT-CD-T[50]
     {
         Length = "1";
         FieldGroup = "Table2";
         CodeSource = "DataModel";
         CodeType = "DCLM-MSG-OPT-CD";
         DBTableName = "TDCKO";
         SType = "Text";
         Label = "Level";
         Index = "1";
     }

     OUT MIR-CVG-ID-T[50]
     {
         Length = "2";
         FieldGroup = "Table3";
         SType = "Text";
         Label = "Coverage ID";
         Index = "1";
     }

     OUT MIR-CLM-REQIR-ID-T[50]
     {
         Length = "30";
         FieldGroup ="Table3";
         CodeSource = "EDIT";
         CodeType = "DCRQT";
         SType = "Text";
         Label = "Requirement";
         Index = "1";
     }

     OUT MIR-REQIR-SEQ-NUM-T[50]
     {
         Length = "3";
         FieldGroup = "Table3";
         SType = "Hidden";
         Label = "Sequence Number";
         Index = "1";
      }

     OUT MIR-CLM-REQIR-OPT-CD-T[50]
     {
         Length = "1";
         FieldGroup = "Table3";
         CodeSource = "DataModel";
         CodeType = "DCLM-REQIR-OPT-CD";
         SType = "Text";
         Label = "Requirement Level";
         Index = "1";
     }

     OUT MIR-REQIR-STAT-CD-T[50]
     {
        Length = "3";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "DRQST";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
     }

     OUT MIR-REQIR-ORDR-DT-T[50]
     {
        Length = "10";
        FieldGroup = "Table3";
        SType = "Date";
        Label = "Ordered Date";
        Index = "1";
     }

     OUT MIR-REQIR-RECV-DT-T[50]
     {
        Length = "10";
        FieldGroup = "Table3";
        SType = "Date";
        Label = "Received Date";
        Index = "1";
     }

     OUT MIR-PREV-UPDT-USER-ID-T[50]
     {
        Length = "8";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Last Updated User ID";
        Index = "1";
     }

    OUT MIR-OTHR-CVG-NUM-T[50]
    {
        Length = "2";
        FieldGroup = "Table4";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-OTHR-PLAN-ID-T[50]
    {
        FieldGroup = "Table4";
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-OTHR-ISS-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Effective Date";
        Index = "1";
    }

    OUT MIR-OTHR-MAT-XPRY-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage Maturity/Expiry Date";
        Index = "1";
    }

    OUT MIR-OTHR-CSTAT-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-OTHR-SUB-STAT-CD-T[50]
    {
        Length = "2";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    OUT MIR-OTHR-FACE-AMT-T[50]
    {
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

     OUT MIR-OTHR-RFND-AMT-T[50]
     {
         Length = "15";
         FieldGroup = "Table4";
         DBTableName = "TDCBD";
         SType = "Currency";
         Label = "Other Refund Amount";
         Index = "1";
     }

     OUT MIR-OTHR-PAYE-T[50]
     {
         Length = "51";
         FieldGroup = "Table4";
         SType = "Text";
         Label = "Payee";
         Index ="1";
     }

     OUT MIR-OTHR-DECID-CD-T[50]
     {
         Length = "2";
         FieldGroup = "Table4";
         CodeSource = "DataModel";
         CodeType = "BNFT-DECID-CD";
         DBTableName = "TDCBD";
         SType = "Text";
         Label = "Decision";
         Index = "1";
     }

     OUT MIR-OTHR-DCLN-REASN-CD-T[50]
     {
         Length = "2";
         FieldGroup = "Table4";
         CodeSource = "DataModel";
         CodeType = "BNFT-DCLN-REASN-CD";
         DBTableName = "TDCBD";
         SType = "Text";
         Label = "Decline Reason";
         Index = "1";
     }

# IPCA03 CHANGES STARTS HERE.

     OUT MIR-OTHR-INSRD-CLI-NM-T[50]
     {
        Length = "51";
        DisplayOnly;
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
     }

    OUT MIR-OTHR-INSRD-AGE-T[50]
    {
        Length = "03";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Issue Age";
        Index = "1";
     }

    OUT MIR-OTHR-SEX-CD-T[50]
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
       INOUT MIR-POL-CRCY-CD
        {
           Length = "2";           
           SType = "Hidden";
           Label = "Currency";
    }
#M245B2 CHANGES END HERE    

#MP302L CHANGES START HERE
    OUT MIR-SRVBEN-DEFR-AMT
         {
             Length = "15";
             SType = "Currency";
             DBTableName = "TDCDS";
             Label = "Survival Benefit Deferral Amount";
         }
    
    OUT MIR-SRVBEN-DEFR-INT-AMT
         {
             Length = "15";
             DBTableName = "TDCDS";
             SType = "Currency";
             Label = "Deferral Interest";
         }
         
    OUT MIR-SRVBEN-TOT-AMT
        {
             Length = "15";
             DBTableName = "TDCDS";
             SType = "Currency";
             Label = "Total";
         }
         
    OUT MIR-SRVBEN-CHRGBCK-AMT
        {
             Length = "15";
             DBTableName = "TDCDS";
             SType = "Currency";
             Label = "Chargeback Amount";
         } 
#MP302L CHANGES END HERE
#ULMG13 CHANGES START HERE
    OUT MIR-POST-LAPS-SUR-AMT
         {
             Length = "15";
             DBTableName = "TPOL";
             SType = "Currency";
             Label = "Cash Surrender Value";
         }
#ULMG13 CHANGES END HERE
  }
