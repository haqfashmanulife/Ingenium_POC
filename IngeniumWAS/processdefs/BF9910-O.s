#*******************************************************************************
#*  Component:   BF9910-O.s                                                    *
#*  Description: CUSTOMER INQUIRY                                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS  INITIAL VERSION                                               *
#*                                                                             *
#*******************************************************************************
S-STEP BF9910-O
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
		SType = "Hidden";
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
	IN MIR-DV-CLI-NM-KA
	{
		DisplayOnly;
		Label = "Name Kana";
		Length = "17";
		SType = "Text";
	}
	IN MIR-DV-CLI-NM-KJ
	{
		DisplayOnly;
		Label = "Name Kanji";
		Length = "33";
		SType = "Text";
	}
	IN MIR-CLI-BTH-DT
	{
		DisplayOnly;
		Label = "Date of Birth";
		Length = "10";
		SType = "Date";
	}
	IN MIR-DV-CLI-AGE
	{
		DisplayOnly;
		Label = "Age";
		Length = "3";
		SType = "Text";
	}
	IN MIR-CLI-SEX-CD
	{
		CodeSource = "DataModel";
		CodeType = "FT-CLI-SEX-CD";
		DisplayOnly;
		Label = "Sex";
		Length = "1";
		SType = "Text";
	}
	IN MIR-CLI-PSTL-CD
	{
		DisplayOnly;
		Label = "Zip Code";
		Length = "16";
		SType = "Text";
	}
	IN MIR-CLI-ADDR-CD
	{
		DisplayOnly;
		Label = "Address Code";
		Length = "8";
		SType = "Text";
	}
	IN MIR-CLI-ADDR-TXT
	{
		DisplayOnly;
		Label = "Address";
		Length = "50";
		SType = "Text";
	}
	IN MIR-CLI-ADDR-TXT-KA
	{
		DisplayOnly;
		Label = "Address Description(Kana)";
		Length = "72";
		SType = "Text";
	}
	IN MIR-CLI-ADDR-TXT-KJ
	{
		DisplayOnly;
		Label = "Address Description(Kanji)";
		Length = "64";
		SType = "Text";
	}
	IN MIR-CLI-PHON-NUM
	{
		DisplayOnly;
		Label = "TEL NO";
		Length = "50";
		SType = "Text";
	}
	IN MIR-CLI-EMAIL-ID
	{
		DisplayOnly;
		Label = "E-Mail";
		Length = "50";
		SType = "Text";
	}
	IN MIR-CLI-OCCP-CLAS-CD
	{
                CodeSource = "EDIT";
                CodeType = "OCCCD";
		DisplayOnly;
		Label = "Job Code";
		Length = "02";
		SType = "Text";
	}
	IN MIR-CLI-INCM-EARN-CD
	{
		DisplayOnly;
		Label = "Annual Salary";
		Length = "13";
                Decimals = "0";
		SType = "Currency";
	}
	IN MIR-CLI-SMKR-CD
	{
		CodeSource = "DataModel";
		CodeType = "CLI-SMKR-CD";
		DisplayOnly;
		Label = "Smoke status";
		Length = "1";
		SType = "Text";
	}
	IN MIR-CLI-MARIT-STAT-CD
	{
		CodeSource = "EDIT";
		CodeType = "MARST";
		DisplayOnly;
		Label = "Marital Status";
		Length = "1";
		SType = "Text";
	}
	INOUT MIR-CLI-MARIT-DT
	{
		Label = "Marriage Date";
		Length = "10";
		SType = "Date";
	}
	IN MIR-PROD-CD-T[50]
	{
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Product Code";
		Length = "3";
		SType = "Text";
	}
	IN MIR-POL-ID-T[50]
	{
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Policy Id";
		Length = "10";
		SType = "Text";
	}
	IN MIR-CVG-NUM-T[50]
	{
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Coverage No.";
		Length = "2";
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
		Length = "3";
		SType = "Text";
	}
	IN MIR-FT-REL-TYP-CD-T[50]
	{
		CodeSource = "DataModel";
		CodeType = "FT-REL-TYP-CD";
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Relation Type";
		Length = "1";
		SType = "Text";
	}
	IN MIR-POL-CSTAT-CD-T[50]
	{
		CodeSource = "DataModel";
		CodeType = "FT-POL-CSTAT-CD";
		DisplayOnly;
		FieldGroup = "Table5";
		Label = "Status";
		Length = "4";
		SType = "Text";
	}
	
# Code changes for MP2601
        INOUT MIR-FMLY-GIV-NM-KA-T[10]
	{
		MixedCase;
		FieldGroup = "Table8";
		Index = "1";
		Label = "First Name Kana";
		Length = "16";
		SType = "Text";
	}
	INOUT MIR-FMLY-SUR-NM-KA-T[10]
	{
		MixedCase;
		FieldGroup = "Table8";
		Index = "1";
		Label = "Last Name Kana";
		Length = "16";
		SType = "Text";
	}
# Code changes for MP2601

	INOUT MIR-FMLY-GIV-NM-KJ-T[10]
	{
		MixedCase;
		FieldGroup = "Table8";
		Index = "1";
		Label = "First Name Kanji";
		Length = "16";
		SType = "Text";
	}
	INOUT MIR-FMLY-SUR-NM-KJ-T[10]
	{
		MixedCase;
		FieldGroup = "Table8";
		Index = "1";
		Label = "Last Name Kanji";
		Length = "16";
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
	INOUT MIR-CLI-VST-DT-1
	{
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-CLI-VST-DT-2
	{
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-CLI-VST-DT-3
	{
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-CLI-VST-DT-4
	{
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-CLI-VST-DT-5
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

}
