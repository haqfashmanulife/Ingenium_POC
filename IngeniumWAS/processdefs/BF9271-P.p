# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9271-P.p                                                    *
#*  Description: Adjudicator Inquiry Summary                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   Initial Version                                           *
#*  HCCL05  HIN/CL   Pick-up Facility                                          *
#*  RP2CLA  CTS      CHANGES FOR CANCER LUMPSUM AUTOMATION                     *
#*                                                                             *
#*  M280P1  CTS      CHANGES DONE FOR ARM III                                  *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  UY3023  CTS    STREAM 3 MEDICAL CLAIM                                      *
#*  UY3001  CTS      STREAM 3 CHANGES                                          * 
#*******************************************************************************

P-STEP BF9271-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9271";
        BusinessFunctionName = "Adjudicator Inquiry Details";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9271";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DefaultSession = "MIR-CLM-ID";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }
    INOUT MIR-DV-INS-CLI-NM
    {
        Key;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    INOUT MIR-CLMA-CLM-STAT-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    INOUT MIR-CLMA-INSRD-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
    }
    INOUT MIR-CLI-BTH-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }
    INOUT MIR-CLI-SEX-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    INOUT MIR-INS-MORAL-RISK-IND   
    {
        Key;
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    INOUT MIR-CLAIM-NOTE-IND     
    {
        Key;
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }
    INOUT MIR-LIFE-INS-CLM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Life Insurance Claim In Progress";
    }
    INOUT MIR-CLMA-ASSOC-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    INOUT MIR-CLMA-HIST-CLM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }
#UYSDMC CHANGES STARTS HERE
    INOUT MIR-CLMA-USYS-CLM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
#UYSDMC CHANGES ENDS HERE
    INOUT MIR-POL-ID
    {
        Key;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
#UY3001 CHANGES STARTS
	INOUT MIR-LRG-PROD-CD
    {
        Key;
        Length = "03";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Large Product Type";
    }
#UY3001 CHANGES ENDS
    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }
    
#UY3023 CHANGES STARTS
    INOUT MIR-RIDER-CD
    {
        Key;
        Length = "3";
        DBTableName = "TETAB";
        SType = "Text";
        Label = "Rider Code";
    }
#UY3023 CHANGES ENDS

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
    }
    INOUT MIR-BNFT-NM-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
    }
    INOUT MIR-BNFT-STAT-CD
    {
        Key;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-STAT-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Claim Status";
    }
    OUT MIR-SERV-BR-ID
    {
        Key;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Branch";
    }
    OUT MIR-BNFT-PMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BENS-PMT-TYP-CD";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Unit Category";
    }
    INOUT MIR-CVG-FACE-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "TCLBN";
        SType = "Currency";
        Label = "Face Amount";
    }
    OUT MIR-BNFT-PAYBL-UNIT-QTY
    {
        Length = "6";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Payable Units";
    }
    OUT MIR-BNFT-MULTR-FCT
    {
#*RP2CLA-Changed Decimals ="1"    
        Length = "6";
        Decimals = "1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Multiplier";
    }
    INOUT MIR-BNFT-PAYBL-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payable Amount";
    }
    INOUT MIR-CLBN-FINAL-MAJ-CD
    {
        Length = "10";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Final Disease/Accident Code";
    }
    OUT MIR-SUMM-AGG-NUM-T[50]
    {
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Agg. No.";
        Index = "1";
    }
    OUT MIR-TOT-BEFORE-AGG-QTY-T[50]
    {
#*RP2CLA-Changed Decimals ="1"    
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Total Before Aggregation";
        Index = "1";
    }
    OUT MIR-TOT-AGG-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Aggregated Total";
        Index = "1";
    }
    OUT MIR-OVERLAP-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Overlap Units";
        Index = "1";
    }
    OUT MIR-BELOW-MIN-HOSP-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Below Min. Hospital";
        Index = "1";
    }
    OUT MIR-OTHR-EXCL-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Other Excluded Units";
        Index = "1";
    }
    OUT MIR-EXCL-INIT-DED-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Initial Deductible Units";
        Index = "1";
    }
    OUT MIR-EXCL-XCES-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Excess Units";
        Index = "1";
    }
    OUT MIR-INELIG-XCES-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Excess Units";
        Index = "1";
    }
    OUT MIR-ALREADY-PD-QTY-T[50]
    {
#*RP2CLA-Changed Decimals ="1"   
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Already Paid";
        Index = "1";
    }
    OUT MIR-MULTR-TO-PAY-QTY-T[50]
    {
#*RP2CLA-Changed Decimals ="1"    
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Multiplier To Be Paid";
        Index = "1";
    }
    OUT MIR-SUMM-PAYBL-AMT-T[50]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payable Amount";
        Index = "1";
    }
    OUT MIR-PD-CLM-END-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Paid Claim End Date";
        Index = "1";
    }
    OUT MIR-DTL-STRT-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Start Date";
        Index = "1";
    }
    OUT MIR-DTL-END-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }
    OUT MIR-DTL-END-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLEV-HOSP-STAT-CD";
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "End Date Status";
        Index = "1";
    }
    OUT MIR-DTL-AGG-NUM-T[100]
    {
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Agg. No.";
        Index = "1";
    }
    OUT MIR-DTL-SEQ-NUM-T[100]
    {
        Length = "4";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "No.";
        Index = "1";
        Decimals = "0";
    }
    OUT MIR-DTL-HOSP-DAYS-QTY-T[100]
    {
        Length = "7";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Hosp Days";
        Index = "1";
    }
    OUT MIR-DTL-DAYS-SINCE-QTY-T[100]
    {
        Length = "8";
        Decimals = "0";
        Signed;
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Days Since Disch. Or Acc";
        Index = "1";
    }
    OUT MIR-DTL-EXCL-QTY-T[100]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Excluded Units";
        Index = "1";
    }
    OUT MIR-DTL-REASN-CD-T[100]
    {
        Length = "15";
	FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "CLBRN";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }
    OUT MIR-DTL-PAYBL-QTY-T[100]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Payable Units";
        Index = "1";
    }
    OUT MIR-DTL-MULTR-FCT-T[100]
    {
#*RP2CLA-Changed Decimals ="1"    
#UY3023 - CHANGES STARTS    
        Signed;
#UY3023 - CHANGES ENDS
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Multiplier";
        Index = "1";
    }
    OUT MIR-DTL-SURG-CD-T[100]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Surgery Code";
        Index = "1";
    }
    OUT MIR-CLM-REQIR-ID-T[100]
    {
        Length = "5";
	FieldGroup = "Table3";
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
        FieldGroup = "Table3";
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
        FieldGroup = "Table3";
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
        FieldGroup = "Table3";
        DBTableName = "TCRQT";
        SType = "Date";
        Label = "Ordered Date";
        Index = "1";
     }
     OUT MIR-CRQT-RECV-DT-T[100]
     {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "TCRQT";
        SType = "Date";
        Label = "Received Date";
        Index = "1";
     }
     OUT MIR-PREV-UPDT-USER-ID-T[100]
     {
        Length = "8";
        FieldGroup = "Table3";
        DBTableName = "TCRQT";
        SType = "Text";
        Label = "Previous Update User ID";
        Index = "1";
     }
     OUT MIR-CRQT-SEQ-NUM-T[100]
     {
        Length = "3";
        FieldGroup = "Table3";
        DBTableName = "TCRQT";
        SType = "Hidden";
        Label = "Sequence Number";
        Index = "1";
     }
     OUT MIR-MSG-TXT-T[100]
     {
        Length = "120";
	FieldGroup = "Table4";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message";
        Index = "1";
     }
     OUT MIR-MSG-OPT-CD-T[100]
     {
        Length = "1";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CLM-REQIR-OPT-CD";
        DBTableName = "TCLKO";
        SType = "Text";
        Label = "Required For";
        Index = "1";
     }
#M280P1 Changes starts	
	OUT MIR-SUB-BNFT-NM-ID-T[100]
	{
		Length = "2";
		FieldGroup = "Table2";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "SUB-BNFT-NM-ID";
		SType = "Text";
		Label = "Disease Payment Reason code";
	}	
#M280P1 Changes Ends	     
}
