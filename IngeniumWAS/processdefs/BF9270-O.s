# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9270-O.s                                                    *
#*  Description: Adjudicator Inquiry Summary - Output                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   Initial Version                                           *
#*  HCCL05  HIN/CL   Pick-up Facility                                          *
#*  M242M1  CTS      Addition of two new fields-Subtable2 and Subtable4        *
#*  MP302M  CTS      Addition of new field for Survival Benefit Chargeback Amt *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  UY3070  CTS      STREAM 3 CANCER LUMP PAYMENT
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT                                     *
#*******************************************************************************

S-STEP BF9270-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Output";
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
		SType = "Hidden";
	}

	IN MIR-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		DefaultSession = "MIR-CLM-ID";
		SType = "Text";
		Label = "Claim ID";
	}

	IN MIR-DV-INS-CLI-NM 
	{
		DisplayOnly;
		Length = "75";
		SType = "Text";
		Label = "Insured Name";
	}

	IN MIR-CLMA-CLM-STAT-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLMA-CLM-STAT-CD";
		SType = "Text";
		Label = "Master Claim Status";
	}

	IN MIR-CLMA-INSRD-CLI-ID 
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
		Label = "Birth Date";
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

	IN MIR-INS-MORAL-RISK-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Insured Moral Risk";
	}

	IN MIR-CLAIM-NOTE-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Claim Note";
	}

	IN MIR-LIFE-INS-CLM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Life Insurance Claim In Progress";
	}

	IN MIR-CLMA-ASSOC-CLM-ID 
	{
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

	IN MIR-POL-ID-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Policy ID";
	}

	IN MIR-CVG-NUM-T[100] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Coverage Number";
	}
#UY3070 CHANGES STARTS HERE	
        IN MIR-PLAN-CD-T[100] 
	{
		DisplayOnly;
		Length = "3";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Plan Code";
	}
#UY3070 CHANGES ENDS HERE	
        IN MIR-PLAN-ID-T[100] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Rider Name";
	}

	IN MIR-CVG-ISS-EFF-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Date";
		Label = "Issue Date";
	}

	IN MIR-CVG-CSTAT-CD-T[100] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CVG-CSTAT-CD";
		SType = "Text";
		Label = "Coverage Status";
	}

#*M242M1 CHANGES START 
#*Label name "Sub Table 2" is Added
#*Label name "Sub Table 4" is Added

	IN MIR-CVG-STBL-2-CD-T[100] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "STB2";
		SType = "Text";
		Label = "Sub Table 2";
	}
	
	IN MIR-CVG-STBL-4-CD-T[100] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "STB4";
		SType = "Text";
		Label = "Sub Table 4";
	}
	
#*M242M1 CHANGES END	
	
	IN MIR-LAPS-STRT-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Date";
		Label = "Lapse Start Date";
	}

	IN MIR-CVG-REINST-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Date";
		Label = "Reinstatement Date";
	}

	IN MIR-CVG-FACE-AMT-T[100] 
	{
		DisplayOnly;
		Signed;
		Length = "16";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Face Amount";
	}

	IN MIR-BNFT-NM-ID-T[100] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		KeyColumn;
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "BENNM";
		Link;
		SType = "Text";
		Label = "Benefit Name";
		Action = "SelectItem";
	}

	IN MIR-BNFT-PAYBL-AMT-T[100] 
	{
		DisplayOnly;
		Signed;
		Length = "16";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Payable Amount";
	}
#** CS0008 CHANGES STARTS HERE
#*      IN MIR-BNFT-STAT-CD-T[100] 
#*      {
#*      	DisplayOnly;
#*      	Length = "4";
#*      	FieldGroup = "Table1";
#*      	Index = "1";
#*      	CodeSource = "DataModel";
#*      	CodeType = "CLBN-BNFT-STAT-CD";
#*      	SType = "Text";
#*      	Label = "Benefit Claim Status";
#*      }
#** CS0008 CHANGES ENDS HERE
        IN MIR-BNFT-DECSN-CD-T[100] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLBN-BNFT-DECSN-CD";
		SType = "Text";
		Label = "Decision";
	}
#** CS0008  CHANGES START HERE	
        IN MIR-NON-PMT-REASN-TXT-T[100]
        {
                DisplayOnly;
                Length = "08";
	        CodeSource = "DataModel";
	        CodeType = "NON-PMT-REASN-TXT";
	        DBTableName = "TCLBD";
	        SType = "Text";
                Label = "Non-payment reason code";
     }
#** CS0008  CHANGES END HERE     

	IN MIR-BNFT-DECSN-REASN-CD-T[100] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "BNFT-DECSN-REASN-CD";
		SType = "Text";
		Label = "Decline Reason";
	}
	
#*MP302M CHANGES STARTS
       IN MIR-SRVBEN-CHRGBCK-AMT
       {
                DisplayOnly;
	        Length = "15";
                DBTableName = "Derived";
                SType = "Currency";
# UY323A CHANGES STARTS 
#         Label = "Survival Benefit Chargeback Amount";
          Label = "Benefit Chargeback Amount";
# UY323A CHANGES ENDS		 		 
       }
#*MP302M CHANGES ENDS

	IN MIR-CLM-REQIR-ID-T[100] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table2";
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
		FieldGroup = "Table2";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-REQIR-OPT-CD";
		SType = "Text";
		Label = "Requirement Level";
	}

	IN MIR-CRQT-STAT-CD-T[100] 
	{
		DisplayOnly;
		Length = "3";
		FieldGroup = "Table2";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CRQT-STAT-CD";
		SType = "Text";
		Label = "Requirement Status";
	}

	IN MIR-CRQT-ORDR-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Date";
		Label = "Ordered Date";
	}

	IN MIR-CRQT-RECV-DT-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Date";
		Label = "Received Date";
	}

	IN MIR-PREV-UPDT-USER-ID-T[100] 
	{
		DisplayOnly;
		Length = "8";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Text";
		Label = "Previous Update User ID";
	}

	IN MIR-MSG-TXT-T[100] 
	{
		DisplayOnly;
		Length = "120";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Text";
		Label = "Message";
	}

	IN MIR-MSG-OPT-CD-T[100] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table3";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-REQIR-OPT-CD";
		SType = "Text";
		Label = "Required For";
	}
#UY323A CHANGES STARTS HERE
	IN MIR-HLTBEN-CHRGBCK-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Health Congratulatory Benefit Chargeback Amount";
    }  
	
	IN MIR-NO-ACCDNT-CHRGBCK-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Non-accidental benefit Chargeback Amount";
    } 
#UY323A CHANGES ENDS HERE		
}
