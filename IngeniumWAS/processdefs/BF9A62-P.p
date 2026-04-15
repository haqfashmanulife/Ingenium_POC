# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A62-P.p                                                    *
#*  Description: Death Claim Adjudicator Decision                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAAD  CTS     DEATH CLAIM ADJUDICATOR DECISION INPUT SCREEN              *
#*  IPCA03  CTS     ADDED INSURED NAME,ISSUE AGE AND SEX IN 'COVERAGE OTHER    *
#*                  SUBJECT TO INSURED' SECTION.                               *
#*  ABU241  CTS    ENHANCEMENT TO DISPLAY CAUSE DESCRIPTION                    *
#*  ABF423  CTS     CHANGES MADE TO DISPLAY THE SIGN FOR CLAIM                 *
#*                  PAYABLE AMOUNT                                             *  
#*  EN9547  CTS    COMMENTED OUT THE VARIABLE  MIR-POL-ID  IN ONE PLACE        *
#*                 DUE TO DUPLICATE DECLARATION                                *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245Q2  CTS    SPWL CHANGES FOR DEATH CLAIMS                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF9A62-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A62";
        BusinessFunctionName = "Death Claim Adjudicator Decision";
        BusinessFunctionType = "List";
        MirName = "CCWM9A62";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FCN-UPDT-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Function Code";
    }

    IN MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DefaultSession = "MIR-CLM-ID";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    INOUT MIR-INSRD-CLI-NM
    {
        Length = "51";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Name";
    }

    INOUT MIR-CLM-STAT-CD
    {
        Length = "1";
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

    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Insured Date Of Birth";
    }

    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    INOUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-CLM-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLM-TYP-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Claim Type";
    }


    INOUT MIR-CLM-EFF-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Effective Date";
    }


    INOUT MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
    }
#ABU241 CHANGES START HERE
    INOUT MIR-CAUSE-DESC-TXT
    {
       Length = "40";
       DBTableName = "TDCLM";
       SType = "Text";
       Label = "Cause Description";
    }   
#ABU241 CHANGES END HERE      

    INOUT MIR-AUTO-BNFT-DECID-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "BNFT-DECID-CD";
        DBTableName = "TDCBD";
        SType = "Selection";
    }
#EN9547 CHANGES START HERE
#    INOUT MIR-POL-ID
#    {
#        Length = "10";
#        DBTableName = "TPOL";
#        SType = "Text";
#        Label = "Policy ID";
#    }
#EN9547 CHANGES END HERE

    INOUT MIR-POL-APP-REASN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-APP-REASN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Type";

    }

    INOUT MIR-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Base Plan";
    }

    INOUT MIR-POL-CSTAT-CD
    {
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";

    }

    INOUT MIR-POL-SUB-STAT-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Sub Status";

    }
# ABF423 The attribute Signed is added

    INOUT MIR-POL-PAYBL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TDCBN";
        SType = "Currency";
        Label = "Payable Amount";

    }

    INOUT MIR-CVG-NUM-T[50]
    {
        Length = "2";
        FieldGroup = "Table1";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-PLAN-ID-T[50]
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

    INOUT MIR-CVG-ISS-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Effective Date";
        Index = "1";
    }

    INOUT MIR-CVG-MAT-XPRY-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage Maturity/Expiry Date";
        Index = "1";
    }

    INOUT MIR-CVG-CSTAT-CD-T[50]
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

    INOUT MIR-CVG-SUB-STAT-CD-T[50]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    INOUT MIR-CVG-FACE-AMT-T[50]
    {
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    INOUT MIR-BNFT-NM-ID-T[50]
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
# ABF423 The attribute Signed is added

    INOUT MIR-CLM-ADJC-AMT-T[50]
    {
        Length = "15";
        Signed;
        FieldGroup = "Table1";
        DBTableName = "TDCBD";
        SType = "Currency";
        Label = "Amount for Adjudication";
        Index = "1";
     }

# ABF423 The attribute Signed is added

     INOUT MIR-CLM-PAYBL-AMT-T[50]
     {
         Length = "15";
         Signed;
         FieldGroup = "Table1";
         DBTableName = "TCBD";
         SType = "Currency";
         Label = "Payable Amount";
         Index = "1";
     }
#M245Q2 CHANGES START HERE
     INOUT MIR-DV-CLM-PAYBL-JPY-AMT-T[50]
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

     INOUT MIR-CLM-OTHR-RFND-AMT-T[50]
     {
         Length = "15";
         FieldGroup = "Table1";
         DBTableName = "TCBD";
         SType = "Currency";
         Label = "Other Refund Amount";
         Index = "1";
     }

     INOUT MIR-PAYE-T[50]
     {
         Length = "51";
         FieldGroup = "Table1";
         SType = "Text";
         Label = "Payee";
         Index ="1";
     }

     INOUT MIR-BNFT-DECID-CD-T[50]
     {
         Length = "2";
         FieldGroup = "Table1";
         CodeSource = "DataModel";
         CodeType = "BNFT-DECID-CD";
         DBTableName = "TDCBD";
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
         DBTableName = "TDCBD";
         SType = "Selection";
         Label = "Decline Reason";
         Index = "1";
     }

     INOUT MIR-MSG-CVG-NUM-T[50]
     {
         Length = "2";
         FieldGroup = "Table2";
         DBTableName = "TDCKO";
         SType = "Text";
         Label = "Coverage Number";
         Index = "1";
     }

     INOUT MIR-MSG-TXT-T[50]
     {
         Length = "120";
         FieldGroup = "Table2";
         DBTableName = "TMSGS";
         SType = "Text";
         Label = "Message";
         Index = "1";
     }

     INOUT MIR-MSG-OPT-CD-T[50]
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

     INOUT MIR-CVG-ID-T[50]
     {
         Length = "2";
         FieldGroup = "Table3";
         SType = "Text";
         Label = "Coverage ID";
         Index = "1";
     }

     INOUT MIR-CLM-REQIR-ID-T[50]
     {
         Length = "30";
         FieldGroup ="Table3";
         CodeSource = "EDIT";
         CodeType = "DCRQT";
         SType = "Text";
         Label = "Requirement";
         Index = "1";
     }

     INOUT MIR-CLM-REQIR-OPT-CD-T[50]
     {
         Length = "1";
         FieldGroup = "Table3";
         CodeSource = "DataModel";
         CodeType = "DCLM-REQIR-OPT-CD";
         SType = "Text";
         Label = "Requirement Level";
         Index = "1";
     }

     INOUT MIR-REQIR-SEQ-NUM-T[50]
     {
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

     INOUT MIR-PREV-UPDT-USER-ID-T[50]
     {
        Length = "8";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Last Updated User ID";
        Index = "1";
     }

    INOUT MIR-OTHR-CVG-NUM-T[50]
    {
        Length = "2";
        FieldGroup = "Table4";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-OTHR-PLAN-ID-T[50]
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

    INOUT MIR-OTHR-ISS-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Effective Date";
        Index = "1";
    }

    INOUT MIR-OTHR-MAT-XPRY-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage Maturity/Expiry Date";
        Index = "1";
    }

    INOUT MIR-OTHR-CSTAT-CD-T[50]
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

    INOUT MIR-OTHR-SUB-STAT-CD-T[50]
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

    INOUT MIR-OTHR-FACE-AMT-T[50]
    {
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

     INOUT MIR-OTHR-RFND-AMT-T[50]
     {
         Length = "15";
         FieldGroup = "Table4";
         DBTableName = "TDCBD";
         SType = "Currency";
         Label = "Other Refund Amount";
         Index = "1";
     }

     INOUT MIR-OTHR-PAYE-T[50]
     {
         Length = "51";
         FieldGroup = "Table4";
         SType = "Text";
         Label = "Payee";
         Index ="1";
     }

     INOUT MIR-OTHR-DECID-CD-T[50]
     {
         Length = "2";
         FieldGroup = "Table4";
         CodeSource = "DataModel";
         CodeType = "BNFT-DECID-CD";
         DBTableName = "TDCBD";
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
         DBTableName = "TDCBD";
         SType = "Selection";
         Label = "Decline Reason";
         Index = "1";
     }

  # IPCA03 CHANGES STARTS HERE.

     INOUT MIR-OTHR-INSRD-CLI-NM-T[50]
     {
        Length = "51";
        DisplayOnly;
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
     }

    INOUT MIR-OTHR-INSRD-AGE-T[50]
    {
        Length = "03";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Issue Age";
        Index = "1";
     }

    INOUT MIR-OTHR-SEX-CD-T[50]
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

#M271O1 CHANGES START HERE      
      INOUT MIR-PREM-CRCY-CD
      {
        
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
      }
#M271O1 CHANGES END HERE
}
