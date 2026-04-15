#*******************************************************************************
#*  Component:   BF9920-O.s                                                    *
#*  Description: PROSPECT INQUIRY                                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS  INITIAL VERSION                                               *
#*  MP0054  CTS  ADDED FIELD FOR PROSPECT ID                                   *                                                                           *
#*******************************************************************************
S-STEP BF9920-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Inquiry";
		DelEmptyRows;
		FocusField = "OKButton";
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

	IN MIR-DV-ILST-NM-KA 
	{
		DisplayOnly;
		Label = "Name Kana";
		Length = "101";
		MixedCase;
		SType = "Text";
	}

	IN MIR-PRCES-DT 
	{
		DefaultSession = "LSIR-PRCES-DT";
		DisplayOnly;
		Label = "Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-DV-RO-SO-CD 
	{
		DisplayOnly;
		Label = "RO-SO Code";
		Length = "10";
		SType = "Text";
	}

	IN MIR-AGT-ID 
	{
		DefaultSession = "MIR-AGT-ID";
		DisplayOnly;
		Label = "PA Code";
		Length = "6";
		SType = "Text";
	}

	IN MIR-AGT-NM 
	{
		DisplayOnly;
		Label = "PA Name";
		Length = "50";
		SType = "Text";
	}

	IN MIR-DV-ILST-NM-KJ 
	{
		DisplayOnly;
		Label = "Name Kanji";
		Length = "101";
		MixedCase;
		SType = "Text";
	}

	IN MIR-ILST-BTH-DT 
	{
		DisplayOnly;
		Label = "Date of Birth";
		Length = "10";
		SType = "Date";
	}

	IN MIR-DV-ILST-AGE 
	{
		DisplayOnly;
		Label = "Age";
		Length = "3";
		SType = "Text";
	}

	IN MIR-ILST-SEX-CD 
	{
		CodeSource = "DataModel";
		CodeType = "FT-CLI-SEX-CD";
		DisplayOnly;
		Label = "Sex";
		Length = "1";
		SType = "Text";
	}

	IN MIR-ILST-PSTL-CD 
	{
		DisplayOnly;
		Label = "Zip Code";
		Length = "09";
		SType = "Text";
	}

	IN MIR-ILST-ADDR-CD 
	{
		DisplayOnly;
		Label = "Address Code";
		Length = "8";
		SType = "Text";
	}

	IN MIR-ILST-ADDR-TXT 
	{
		DisplayOnly;
		Label = "Address";
		Length = "50";
		SType = "Text";
	}

	IN MIR-ILST-ADDR-TXT-KA 
	{
		DisplayOnly;
		Label = "Address Description(Kana)";
		Length = "150";
		SType = "Text";
	}

	IN MIR-ILST-ADDR-TXT-KJ 
	{
		DisplayOnly;
		Label = "Address Description(Kanji)";
		Length = "150";
		SType = "Text";
	}

	IN MIR-ILST-PHON-NUM 
	{
		DisplayOnly;
		Label = "TEL NO";
		Length = "30";
		SType = "Text";
	}

	IN MIR-ILST-EMAIL-ID 
	{
		DisplayOnly;
		Label = "E-Mail";
		Length = "100";
		SType = "Text";
	}

	IN MIR-ILST-JOB-CD 
	{
                CodeSource = "EDIT";
                CodeType = "TTOCC";
		DisplayOnly;
		Label = "Job Code";
		Length = "05";
		SType = "Text";
	}

	IN MIR-ILST-ANUL-SLRY 
	{
		DisplayOnly;
		Label = "Annual Salary";
		Length = "20";
		SType = "Text";
	}

	IN MIR-ILST-SMKR-STAT-CD 
	{
		CodeSource = "DataModel";
		CodeType = "FT-CLI-SMKR-CD";
		DisplayOnly;
		Label = "Smoke status";
		Length = "1";
		SType = "Text";
	}

	INOUT MIR-ILST-MARIT-STAT-CD 
	{
		CodeSource = "DataModel";
		CodeType = "FT-CLI-MAR-STS";
		DisplayOnly;
		Label = "Marital Status";
		Length = "1";
		SType = "Selection";
	}

	INOUT MIR-ILST-MARIT-DT 
	{
		DisplayOnly;
		Label = "Marriage Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-ILST-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Illustrator No.";
		Length = "30";
		SType = "Text";
	}

	IN MIR-APPL-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Application No.";
		Length = "30";
		SType = "Text";
	}

	IN MIR-DV-PROD-NM-T[50] 
	{
		CodeSource = "DataModel";
		CodeType = "FT-PROD-CD";
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Product Name";
		Length = "10";
		SType = "Text";
	}

	IN MIR-ILST-REL-TYP-CD-T[50]
	{
		CodeSource = "DataModel";
		CodeType = "FT-ILST-REL-TYP-CD";
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Relation Type";
		Length = "04";
		SType = "Text";
	}

	IN MIR-ILST-POL-STAT-CD-T[50] 
	{
		CodeSource = "DataModel";
		CodeType = "ILST-POL-CSTAT-CD";
		DisplayOnly;
		FieldGroup = "Table5";
		Label = "Status";
		Length = "1";
		SType = "Text";
	}

	IN MIR-PREV-UPDT-TS-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Last Update";
		Length = "26";
		SType = "Text";
	}
	
# Code changes for MP0054 	
	IN MIR-PRPS-ID
	{
	        
	        DBTableName = "TPROS";
		Label = "Prospect Id";
		Length = "9";
	        SType = "hidden";
	}
	
# Code changes for MP2601
	INOUT MIR-FMLY-GIV-NM-KA-T[10]
	{
		FieldGroup = "Table8";
		Index = "1";
		Label = "First Name Kana";
		Length = "16";
		MixedCase;
		SType = "Text";
	}

	INOUT MIR-FMLY-SUR-NM-KA-T[10]
	{
		FieldGroup = "Table8";
		Index = "1";
		Label = "Last Name Kana";
		Length = "16";
		MixedCase;
		SType = "Text";
	}
# Code changes for MP2601

	INOUT MIR-FMLY-GIV-NM-KJ-T[10]
	{
		FieldGroup = "Table8";
		Index = "1";
		Label = "First Name Kanji";
		Length = "16";
		MixedCase;
		SType = "Text";
	}
	INOUT MIR-FMLY-SUR-NM-KJ-T[10]
	{
		FieldGroup = "Table8";
		Index = "1";
		Label = "Last Name Kanji";
		Length = "16";
		MixedCase;
		SType = "Text";
	}
	INOUT MIR-FMLY-BTH-DT-T[10]
	{
		FieldGroup = "Table8";
		Index = "1";
		Label = "Date of Birth";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-FMLY-SEX-CD-T[10]
	{
		CodeSource = "DataModel";
		CodeType = "FT-FML-SEX-CD";
		FieldGroup = "Table8";
		Index = "1";
		Label = "Sex";
		Length = "1";
		SType = "Selection";
	}
	INOUT MIR-FMLY-REL-TYP-CD-T[10]
	{
		CodeSource = "DataModel";
		CodeType = "FT-FMLY-REL-TYP-CD";
		FieldGroup = "Table8";
		Index = "1";
		Label = "Relation";
		Length = "1";
		SType = "Selection";
	}

	INOUT MIR-ILST-VST-DT-1 
	{
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}

	INOUT MIR-ILST-VST-DT-2 
	{
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}

	INOUT MIR-ILST-VST-DT-3 
	{
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}

	INOUT MIR-ILST-VST-DT-4 
	{
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}

	INOUT MIR-ILST-VST-DT-5 
	{
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}

	INOUT MIR-COMNT-TXT-1 
	{
		MixedCase;
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}

	INOUT MIR-COMNT-TXT-2 
	{
		MixedCase;
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}

	INOUT MIR-COMNT-TXT-3 
	{
		MixedCase;
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}

	INOUT MIR-COMNT-TXT-4 
	{
		MixedCase;
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}

	INOUT MIR-COMNT-TXT-5 
	{
		MixedCase;
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}

	INOUT MIR-OTHR-COMNT-TXT 
	{
		MixedCase;
		Label = "Others";
		Length = "1000";
		SType = "TextArea";
	}
	INOUT MIR-ILST-GIV-NM-KA
	{
		DBTableName = "TPROS";
		Label = "Given Name Kana";
		Length = "50";
		MixedCase;
		SType = "Hidden";
	}

	INOUT MIR-ILST-SUR-NM-KA
	{
		DBTableName = "TPROS";
		Label = "Sur Name Kana";
		Length = "50";
		MixedCase;
		SType = "Hidden";
	}
	
}
