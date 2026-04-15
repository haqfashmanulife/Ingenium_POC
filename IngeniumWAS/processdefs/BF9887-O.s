# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9887-O.s                                                    *
#*  Description: Protected Claim Summary List                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104B HIN/IH   Initial version                                           *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

S-STEP BF9887-O
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
		Key;
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

	IN MIR-BNFT-STAT-CD-T[100] 
	{
		DisplayOnly;
		Length = "4";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLBN-BNFT-STAT-CD";
		SType = "Text";
		Label = "Benefit Claim Status";
	}

}
