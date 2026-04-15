# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9273-I.s                                                    *
#*  Description: Adjudicator Decision Details                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   Initial Version                                           *
#*  HCCL05  HIN/CL   Pick-up Facility                                          *
#*                                                                             *
#*  M280P1  CTS      CHANGES DONE FOR ARM III                                  *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  S20982  CTS      CHANGES FOR BUG ID 982 - MEDICAL CLAIM                    *
#*  UY3023  CTS      STREAM 3 MEDICAL CLAIM                                    *
#*******************************************************************************

S-STEP BF9273-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Input";
		DelEmptyRows;
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
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
                SType="Hidden";
        }

	IN MIR-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		DefaultSession = "MIR-CLM-ID";
		SType = "Text";
		Label = "Master Claim ID";
	}

	IN MIR-DV-INS-CLI-NM 
	{
		Key;
		DisplayOnly;
		Length = "75";
		SType = "Text";
		Label = "Insured Name";
	}

	IN MIR-CLMA-CLM-STAT-CD 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLMA-CLM-STAT-CD";
		SType = "Text";
		Label = "Master Claim Status";
	}

	IN MIR-CLMA-INSRD-CLI-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Insured Client ID";
	}

	IN MIR-CLI-BTH-DT 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Birth Date";
	}

	IN MIR-CLI-SEX-CD 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLI-SEX-CD";
		SType = "Text";
		Label = "Sex";
	}

	IN MIR-INS-MORAL-RISK-IND 
	{
		Key;
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Insured Moral Risk";
	}

	IN MIR-CLAIM-NOTE-IND 
	{
		Key;
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Claim Note";
	}

	IN MIR-LIFE-INS-CLM-IND 
	{
		Key;
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Life Insurance Claim In Progress";
	}

	IN MIR-CLMA-ASSOC-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Associated Master Claim";
	}

	IN MIR-CLMA-HIST-CLM-IND  
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Historical Claim";
	}
#UYSDMC CHANGES STARTS HERE
	IN MIR-CLMA-USYS-CLM-IND  
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Unisys Claim";
	}
#UYSDMC CHANGES ENDS HERE

	IN MIR-POL-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Policy ID";
	}

	IN MIR-CVG-NUM 
	{
		Key;
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Coverage Number";
	}
#UY3023 CHANGES STARTS	
        IN MIR-RIDER-CD 
	{
		Key;
		DisplayOnly;
		Length = "3";
		CodeSource = "TTAB";
		SType = "Text";
		Label = "Rider Code";
	}	
#UY3023 CHANGES END	
	IN MIR-PLAN-ID 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Rider Name";
	}

	IN MIR-BNFT-NM-ID 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "BENNM";
		SType = "Text";
		Label = "Benefit Name";
	}

	IN MIR-BNFT-STAT-CD 
	{
		Key;
		DisplayOnly;
		Length = "4";
		CodeSource = "DataModel";
		CodeType = "CLBN-BNFT-STAT-CD";
		SType = "Text";
		Label = "Benefit Claim Status";
	}

	IN MIR-SERV-BR-ID 
	{
		Key;
		DisplayOnly;
		Length = "5";
		CodeSource = "XTAB";
		CodeType = "BRCH";
		SType = "Text";
		Label = "Servicing Branch";
	}

	IN MIR-BNFT-PMT-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "BENS-PMT-TYP-CD";
		SType = "Text";
		Label = "Unit Category";
	}

	IN MIR-CVG-FACE-AMT 
	{
		DisplayOnly;
		Signed;
		Length = "16";
		SType = "Currency";
		Label = "Face Amount";
	}

	IN MIR-BNFT-PAYBL-UNIT-QTY 
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		SType = "Number";
		Label = "Payable Units";
	}

	IN MIR-BNFT-MULTR-FCT 
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		SType = "Number";
		Label = "Multiplier";
	}

	IN MIR-BNFT-PAYBL-AMT 
	{
		DisplayOnly;
		Signed;
		Length = "16";
		SType = "Currency";
		Label = "Total Payable Amount";
	}

	IN MIR-CLBN-FINAL-MAJ-CD 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Final Disease/Accident Code";
	}
#S20982 CHANGES STARTS HERE
#	IN MIR-SUMM-AGG-NUM-T[50] 
	IN MIR-SUMM-AGG-NUM-T[80]
	{
		DisplayOnly;
		Length = "4";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Agg. No.";
	}

#	IN MIR-TOT-BEFORE-AGG-QTY-T[50] 
	IN MIR-TOT-BEFORE-AGG-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Total Before Aggregation";
	}

#	IN MIR-TOT-AGG-QTY-T[50] 
	IN MIR-TOT-AGG-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Aggregated Total";
	}

#	IN MIR-OVERLAP-QTY-T[50] 
	IN MIR-OVERLAP-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Overlap Units";
	}

#	IN MIR-BELOW-MIN-HOSP-QTY-T[50] 
	IN MIR-BELOW-MIN-HOSP-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Below Min. Hospital";
	}

#	IN MIR-OTHR-EXCL-QTY-T[50] 
	IN MIR-OTHR-EXCL-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Other Excluded Units";
	}

#	IN MIR-EXCL-INIT-DED-QTY-T[50] 
	IN MIR-EXCL-INIT-DED-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Initial Deductible Units";
	}

#	IN MIR-EXCL-XCES-QTY-T[50] 
	IN MIR-EXCL-XCES-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Excess Units";
	}

#	IN MIR-INELIG-XCES-QTY-T[50] 
	IN MIR-INELIG-XCES-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Excess Units";
	}

#	IN MIR-ALREADY-PD-QTY-T[50] 
	IN MIR-ALREADY-PD-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Already Paid";
	}

#	IN MIR-MULTR-TO-PAY-QTY-T[50] 
	IN MIR-MULTR-TO-PAY-QTY-T[80]
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Multiplier To Be Paid";
	}

#	IN MIR-SUMM-PAYBL-AMT-T[50] 
	IN MIR-SUMM-PAYBL-AMT-T[80]
	{
		DisplayOnly;
		Signed;
		Length = "16";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Payable Amount";
	}

#	IN MIR-PD-CLM-END-DT-T[50] 
	IN MIR-PD-CLM-END-DT-T[80]
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Date";
		Label = "Paid Claim End Date";
	}
#*S20982 CHANGES END HERE
#*CS0008 CHANGES START HERE
	IN MIR-SEQ-NUM-1-T[100] 
	{
		DisplayOnly;
		Length = "4";
                Decimals = "0";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Number";
		Label = "#";
	}
#*CS0008 CHANGES ENDS HERE
	IN MIR-DTL-STRT-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Date";
		Label = "Start Date";
	}

	IN MIR-DTL-END-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Date";
		Label = "End Date";
	}

	IN MIR-DTL-END-STAT-CD-T[100] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table2";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLEV-HOSP-STAT-CD";
		SType = "Text";
		Label = "End Date Status";
	}

	IN MIR-DTL-AGG-NUM-T[100] 
	{
		DisplayOnly;
		Length = "4";
                Decimals = "0";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Number";
		Label = "Agg. No.";
	}

	IN MIR-DTL-SEQ-NUM-T[100] 
	{
		DisplayOnly;
		Length = "4";
                Decimals = "0";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Number";
		Label = "Hosp No.";
	}

	IN MIR-DTL-HOSP-DAYS-QTY-T[100] 
	{
		DisplayOnly;
		Length = "7";
                Decimals = "0";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Number";
		Label = "Hosp Days";
	}

	IN MIR-DTL-DAYS-SINCE-QTY-T[100] 
	{
		DisplayOnly;
		Length = "8";
                Decimals = "0";
                Signed;
		FieldGroup = "Table2";
		Index = "1";
		SType = "Number";
		Label = "Days Since Disch. Or Acc";
	}

	IN MIR-DTL-EXCL-QTY-T[100] 
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Number";
		Label = "Excluded Units";
	}

	IN MIR-DTL-REASN-CD-T[100] 
	{
		DisplayOnly;
		Length = "15";
		FieldGroup = "Table2";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "CLBRN";
		SType = "Text";
		Label = "Reason";
	}

	IN MIR-DTL-PAYBL-QTY-T[100] 
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Number";
		Label = "Payable Units";
	}

	IN MIR-DTL-MULTR-FCT-T[100] 
	{
		DisplayOnly;
		Length = "6";
                Decimals = "0";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Number";
		Label = "Multiplier";
	}

	IN MIR-DTL-SURG-CD-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Text";
		Label = "Surgery Code";
	}
#*CS0008 CHANGES START HERE
	IN MIR-SEQ-NUM-2-T[100] 
	{
		DisplayOnly;
		Length = "4";
                Decimals = "0";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Number";
		Label = "#";
	}
        INOUT MIR-NON-PMT-REASN-TXT-T[100]
        {
                Length = "08";
                CodeSource = "CSOM9277";
                FilterFields = "1";
                FilterField1 = "MIR-BNFT-NM-ID";
                SType = "Selection";
                Label = "Non-payment reason code";
                FieldGroup = "Table2";
                Index = "1";
        }
        INOUT MIR-NON-PMT-SURGY-NM-T[100]
        {
                Length = "200";
                FieldGroup = "Table2";
                SType = "Text";
                Label = "Surgery Name";
                Index = "1";
        }  
#*CS0008 CHANGES END HERE
	IN MIR-CLM-REQIR-ID-T[100] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table3";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "CMRTC";
		SType = "Text";
		Label = "Requirement";
	}

	IN MIR-CLM-REQIR-OPT-CD-T[100] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table3";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-REQIR-OPT-CD";
		SType = "Text";
		Label = "Requirement Level";
	}

	INOUT MIR-CRQT-STAT-CD-T[100] 
	{
		Length = "3";
		FieldGroup = "Table3";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CRQT-STAT-CD";
		SType = "Selection";
		Label = "Requirement Status";
	}

	INOUT MIR-CRQT-ORDR-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Date";
		Label = "Ordered Date";
	}

	INOUT MIR-CRQT-RECV-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Date";
		Label = "Received Date";
	}

	IN MIR-PREV-UPDT-USER-ID-T[100] 
	{
		DisplayOnly;
		Length = "8";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Text";
		Label = "Previous Update User ID";
	}

	IN MIR-CRQT-SEQ-NUM-T[100] 
	{
		DisplayOnly;
		Length = "3";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Hidden";
		Label = "Sequence Number";
	}

	IN MIR-MSG-TXT-T[100] 
	{
		DisplayOnly;
		Length = "120";
		FieldGroup = "Table4";
		Index = "1";
		SType = "Text";
		Label = "Message";
	}

	IN MIR-MSG-OPT-CD-T[100] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table4";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-REQIR-OPT-CD";
		SType = "Text";
		Label = "Required For";
	}
#M280P1 Changes starts	
	IN MIR-SUB-BNFT-NM-ID-T[100]
	{
		Length = "2";
		FieldGroup = "Table2";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "SUB-BNFT-NM-ID";
		SType = "Selection";
		Label = "Disease Payment Reason code";
	}	
#M280P1 Changes Ends		
}
