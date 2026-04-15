# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9270-P.p                                                    *
#*  Description: Adjudicator Inquiry Summary                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   Initial Version                                           *
#*  HCCL05  HIN/CL   Pick-up Facility                                          *
#*  M242M1  CTS      Addition of two new Fields- Subtable2 and Subtable4       *
#*  MP302M  CTS      Addition of new field for Survival Benefit Chargeback Amt *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  UY3070  CTS      STREAM 3 CANCER LUMP PAYMENT                              *
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT                                     *
#*******************************************************************************

P-STEP BF9270-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9270";
        BusinessFunctionName = "Adjudicator Inquiry Summary";
        BusinessFunctionType = "List";
        MirName = "CCWM9270";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-FCN-CD
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
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Claim ID";
    }
    OUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    OUT MIR-CLMA-CLM-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    OUT MIR-CLMA-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
    }
    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
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
    OUT MIR-INS-MORAL-RISK-IND   
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    OUT MIR-CLAIM-NOTE-IND     
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }
    OUT MIR-LIFE-INS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Life Insurance Claim In Progress";
    }
    OUT MIR-CLMA-ASSOC-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    OUT MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }
#UYSDMC CHANGES STARTS HERE
    OUT MIR-CLMA-USYS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
#UYSDMC CHANGES ENDS HERE
    OUT MIR-POL-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
#S15226 CHANGES STARTS HERE
	OUT MIR-LRG-PROD-CD-T[100]
    {
        Length = "03";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Large Product Type";
        Index = "1";
    }
#S15226 CHANGES ENDS HERE
    OUT MIR-CVG-NUM-T[100]
    {
        Length = "2";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
#UY3070 CHANGES STARTS HERE    
    OUT MIR-PLAN-CD-T[100]
    {
        FieldGroup = "Table1";
        Length = "3";
        DBTableName = "TETAB";
        SType = "Text";
        Label = "Plan Code";
        Index = "1";
    }  
#UY3070 CHANGES ENDS HERE   
    OUT MIR-PLAN-ID-T[100]
    {
        FieldGroup = "Table1";
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
    OUT MIR-CVG-ISS-EFF-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }
    OUT MIR-CVG-CSTAT-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }
    
#*M242M1 CHANGES START 
#*Label name "Sub Table 2" is Added
#*Label name "Sub Table 4" is Added

    OUT MIR-CVG-STBL-2-CD-T[100]
        {
            Length = "40";
            FieldGroup = "Table1";
            CodeSource = "EDIT";
            CodeType = "STB2";
            DBTableName = "TCVG";
            SType = "Text";
            Label = "Sub Tabl2 2";
            Index = "1";
    }
    
    OUT MIR-CVG-STBL-4-CD-T[100]
            {
                Length = "40";
                FieldGroup = "Table1";
                CodeSource = "EDIT";
                CodeType = "STB4";
                DBTableName = "TCVG";
                SType = "Text";
                Label = "Sub Tabl2 4";
                Index = "1";
    }
    
#*M242M1 CHANGES END	
	    
    OUT MIR-LAPS-STRT-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
        Index = "1";
    }
    OUT MIR-CVG-REINST-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Reinstatement Date";
        Index = "1";
    }
    OUT MIR-CVG-FACE-AMT-T[100]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }
    OUT MIR-BNFT-NM-ID-T[100]
    {
        KeyColumn;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
    OUT MIR-BNFT-PAYBL-AMT-T[100]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payable Amount";
        Index = "1";
    }
#** CS0008 CHANGES STARTS HERE
#*  OUT MIR-BNFT-STAT-CD-T[100]
#*  {
#*      Length = "4";
#*      FieldGroup = "Table1";
#*      CodeSource = "DataModel";
#*      CodeType = "CLBN-BNFT-STAT-CD";
#*      DBTableName = "TCLBN";
#*      SType = "Text";
#*      Label = "Benefit Claim Status";
#*      Index = "1";
#*  }
#** CS0008 CHANGES ENDS HERE
    OUT MIR-BNFT-DECSN-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-DECSN-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Decision";
        Index = "1";
    }
#* CS0008 CHANGES STARTS HERE
    INOUT MIR-NON-PMT-REASN-TXT-T[100] 
    {
        Length = "08";  
        CodeSource = "DataModel";
        CodeType = "NON-PMT-REASN-TXT";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Non-payment reason code";
        FieldGroup = "Table1";      
      }
#* CS0008 CHANGES END HERE            
    OUT MIR-BNFT-DECSN-REASN-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "BNFT-DECSN-REASN-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Decline Reason";
        Index = "1";
    }
#*MP302M CHANGES STARTS
    OUT MIR-SRVBEN-CHRGBCK-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
# UY323A CHANGES STARTS 
#         Label = "Survival Benefit Chargeback Amount";
		 Label = "Benefit Chargeback Amount";
# UY323A CHANGES ENDS	
    }
#*MP302M CHANGES ENDS
    OUT MIR-CLBN-FINAL-MAJ-CD-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCLBN";
        SType = "Hidden";
        Label = "Final Major Code";
        Index = "1";
    }
    OUT MIR-CLM-REQIR-ID-T[100]
    {
        Length = "5";
	FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "CMRTC";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }
    OUT MIR-CLM-REQIR-OPT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLM-REQIR-OPT-CD";
        DBTableName = "TCRQT";
        SType = "Text";
        Label = "Requirement Level";
        Index = "1";
    }
    OUT MIR-CRQT-STAT-CD-T[100]
    {
        Length = "3";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CRQT-STAT-CD";
        DBTableName = "TCRQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
     }
     OUT MIR-CRQT-ORDR-DT-T[100]
     {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCRQT";
        SType = "Date";
        Label = "Ordered Date";
        Index = "1";
     }
     OUT MIR-CRQT-RECV-DT-T[100]
     {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCRQT";
        SType = "Date";
        Label = "Received Date";
        Index = "1";
     }
     OUT MIR-PREV-UPDT-USER-ID-T[100]
     {
        Length = "8";
        FieldGroup = "Table2";
        DBTableName = "TCRQT";
        SType = "Text";
        Label = "Previous Update User ID";
        Index = "1";
     }
     OUT MIR-CRQT-SEQ-NUM-T[100]
     {
        Length = "3";
        FieldGroup = "Table2";
        DBTableName = "TCRQT";
        SType = "Hidden";
        Label = "Sequence Number";
        Index = "1";
     }
     OUT MIR-MSG-TXT-T[100]
     {
        Length = "120";
	FieldGroup = "Table3";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message";
        Index = "1";
     }
     OUT MIR-MSG-OPT-CD-T[100]
     {
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "CLM-REQIR-OPT-CD";
        DBTableName = "TCLKO";
        SType = "Text";
        Label = "Required For";
        Index = "1";
     }
#UY323A CHANGES STARTS HERE
	OUT MIR-HLTBEN-CHRGBCK-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Health Congratulatory Benefit Chargeback Amount";
    }  
	
	OUT MIR-NO-ACCDNT-CHRGBCK-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Non-accidental benefit Chargeback Amount";
    } 
#UY323A CHANGES ENDS HERE		 
}
