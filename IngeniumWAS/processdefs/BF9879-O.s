# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9879-O.s                                                    *
#*  Description: Claim Payment Protected Update                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   HIN/EC CLAIM PAYMENT PROTECTED UPDATE                     *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************
S-STEP BF9879-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
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

        INOUT MIR-DV-PRCES-STATE-CD
        {
            Length = "1";
            SType = "Hidden";
            Label = "process code";
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
		Label = "Date of Birth";
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

	IN MIR-CLMA-HO-ACPT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Head Office Claim Form Acceptance Date";
	}

	IN MIR-LIFE-INS-CLM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Life Insurance Claim Involved";
	}

	IN MIR-CLMA-HIST-CLM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Historical Claim:";
	}

#UYSDMC CHANGES STARTS HERE
	IN MIR-CLMA-USYS-CLM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Unisys Claim:";
	}
#UYSDMC CHANGES ENDS HERE

	IN MIR-CLAP-KEY-T[50] 
	{
		DisplayOnly;
		Length = "14";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "CLAP Record Key";
	}

	IN MIR-POL-ID-T[50] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		KeyColumn;
		Index = "1";
		SType = "Text";
		Label = "Policy ID";
	}

	IN MIR-PAYEE-NM-TXT-T[50] 
	{
		DisplayOnly;
		Length = "50";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Payee";
	}

	IN MIR-FINAL-APROV-DT-T[50] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Date";
		Label = "Journal Date";
	}

	IN MIR-BNFT-PMT-AMT-T[50] 
	{
		DisplayOnly;
		Signed;
		Length = "15";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Payment Amount";
	}

	IN MIR-PREM-DED-AMT-T[50] 
	{
		DisplayOnly;
		Signed;
		Length = "11";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Premium Deducted";
	}

	IN MIR-DLAY-INT-AMT-T[50] 
	{
		DisplayOnly;
		Signed;
		Length = "11";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Interest Paid";
	}

	IN MIR-REMIT-AMT-T[50] 
	{
		DisplayOnly;
		Signed;
		Length = "15";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Currency";
		Label = "Adjusted Payment Amount";
	}

# Payment Information by Benefit

	IN MIR-POL-ID-3-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table3";
		KeyColumn;
		Index = "1";
		SType = "Text";
		Label = "Policy ID";
	}

	IN MIR-PLAN-ID-T[100] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table3";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Rider Name";
	}

	IN MIR-BNFT-NM-ID-T[100] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table3";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "BENNM";
		SType = "Text";
		Label = "Benefit Name";
	}

	IN MIR-BNFT-DECSN-CD-T[100] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table3";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLBN-BNFT-DECSN-CD";
		SType = "Text";
		Label = "Decision";
	}

	IN MIR-BNFT-DECSN-CD-2-T[100] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Text";
		Label = "Decision Code Itself";
	}

	IN MIR-CLBN-ACRU-AMT-2-T[100] 
	{
		DisplayOnly;
		Signed;
		Length = "15";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Currency";
		Label = "Payment Amount";
	}

	IN MIR-FINAL-APROV-DT-2-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Date";
		Label = "Final Approval Date";
	}

	IN MIR-CLRL-SEQ-NUM-2-T[100] 
	{
		DisplayOnly;
		Length = "50";
		FieldGroup = "Table3";
                CodeSource = "CSOM9335";
                FilterFields = "1";
                FilterField1 = "MIR-CLM-ID";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Text";
		Label = "Payee";
	}

	IN MIR-PAYEE-NM-TXT-3-T[100] 
	{
		DisplayOnly;
		Length = "50";
		FieldGroup = "Table3";
		Index = "1";
		SType = "Text";
		Label = "Payee";
	}

}
