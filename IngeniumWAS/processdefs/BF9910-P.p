#*******************************************************************************
#*  Component:   BF9910-P.p                                                    *
#*  Description: CUSTOMER INQUIRY                                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS      Initial version                                           *
#*******************************************************************************
P-STEP BF9910-P
{
	ATTRIBUTES
	{
		BusinessFunctionId = "9910";
		BusinessFunctionType = "Inquiry";
		MirName = "CCWM9910";
	}
	OUT LSIR-RETURN-CD;
	OUT MIR-RETRN-CD;

	IN MIR-DV-CLI-NM-KA
	{
		MixedCase;
		DBTableName = "Derived";
		Label = "Name Kana";
		Length = "17";
		SType = "Text";
	}

	OUT MIR-PRCES-DT
	{
		DefaultSession = "LSIR-PRCES-DT";
		Label = "Date";
		Length = "10";
		SType = "Date";
	}
	IN MIR-DV-RO-SO-CD
	{
		DBTableName = "Derived";
		Label = "RO-SO Code";
		Length = "10";
		SType = "Text";
	}
	IN MIR-AGT-ID
	{
		DBTableName = "TAG";
		DefaultSession = "MIR-AGT-ID";
		Label = "PA Code";
		Length = "6";
		SType = "Text";
	}
	IN MIR-AGT-NM
	{
		DBTableName = "TCLNC";
		Label = "PA Name";
		Length = "50";
		SType = "Text";
	}
	OUT MIR-DV-CLI-NM-KJ
	{
		MixedCase;
		DBTableName = "Derived";
		Label = "Name Kanji";
		Length = "33";
		SType = "Text";
	}
	INOUT MIR-CLI-BTH-DT
	{
		DBTableName = "TCUST";
		Label = "Date of Birth";
		Length = "10";
		SType = "Date";
	}
	OUT MIR-DV-CLI-AGE
	{
		DBTableName = "Derived";
		Label = "Age";
		Length = "3";
		SType = "Text";
	}
	OUT MIR-CLI-SEX-CD
	{
		CodeSource = "DataModel";
		CodeType = "FT-CLI-SEX-CD";
		DBTableName = "Derived";
		Label = "Sex";
		Length = "1";
		SType = "Text";
	}
	OUT MIR-CLI-PSTL-CD
	{
		DBTableName = "Derived";
		Label = "Zip Code";
		Length = "16";
		SType = "Text";
	}
	OUT MIR-CLI-ADDR-CD
	{
		DBTableName = "Derived";
		Label = "Address Code";
		Length = "8";
		SType = "Text";
	}
	OUT MIR-CLI-ADDR-TXT
	{
		DBTableName = "Derived";
		Label = "Address";
		Length = "50";
		SType = "Text";
	}
	OUT MIR-CLI-ADDR-TXT-KA
	{
		DBTableName = "Derived";
		Label = "Address Description(Kana)";
		Length = "72";
		SType = "Text";
	}
	OUT MIR-CLI-ADDR-TXT-KJ
	{
		DBTableName = "Derived";
		Label = "Address Description(Kanji)";
		Length = "64";
		SType = "Text";
	}
	OUT MIR-CLI-PHON-NUM
	{
		DBTableName = "TCLIC";
		Label = "TEL NO";
		Length = "50";
		SType = "Text";
	}
	OUT MIR-CLI-EMAIL-ID
	{
		DBTableName = "TCLIC";
		Label = "E-Mail";
		Length = "50";
		SType = "Text";
	}
	OUT MIR-CLI-OCCP-CLAS-CD
	{
                CodeSource = "EDIT";
                CodeType = "OCCCD";
		DBTableName = "TCLI";
		Label = "Job Code";
		Length = "02";
		SType = "Text";
	}
	OUT MIR-CLI-INCM-EARN-CD
	{
		DBTableName = "TCLII";
		Label = "Annual Salary";
		Length = "13";
                Decimals = "0";
		SType = "Currency";
	}
	OUT MIR-CLI-SMKR-CD
	{
		CodeSource = "DataModel";
		CodeType = "CLI-SMKR-CD";
		DBTableName = "TCLI";
		Label = "Smoke status";
		Length = "1";
		SType = "Text";
	}
	OUT MIR-CLI-MARIT-STAT-CD
	{
		CodeSource = "EDIT";
		CodeType = "MARST";
		DBTableName = "TCLI";
		Label = "Marital Status";
		Length = "1";
		SType = "Text";
	}
	INOUT MIR-CLI-MARIT-DT
	{
		DBTableName = "TCVST";
		Label = "Marriage Date";
		Length = "10";
		SType = "Date";
	}
	OUT MIR-PROD-CD-T[50]
	{
		DBTableName = "TCUST";
		FieldGroup = "Table5";
		Index = "1";
		Label = "Product Code";
		Length = "3";
		SType = "Text";
	}
	OUT MIR-POL-ID-T[50]
	{
		DBTableName = "TCUST";
		FieldGroup = "Table5";
		Index = "1";
		Label = "Policy Id";
		Length = "10";
		SType = "Text";
	}
	OUT MIR-CVG-NUM-T[50]
	{
		DBTableName = "TNYSE";
		FieldGroup = "Table5";
		Index = "1";
		Label = "Coverage No.";
		Length = "2";
		SType = "Text";
	}
	OUT MIR-DV-PROD-NM-T[50]
	{
		CodeSource = "DataModel";
		CodeType = "FT-PROD-CD";
		DBTableName = "Derived";
		FieldGroup = "Table5";
		Index = "1";
		Label = "Product Name";
		Length = "3";
		SType = "Text";
	}
	OUT MIR-FT-REL-TYP-CD-T[50]
	{
		CodeSource = "DataModel";
		CodeType = "FT-REL-TYP-CD";
		DBTableName = "Derived";
		FieldGroup = "Table5";
		Index = "1";
		Label = "Relation Type";
		Length = "1";
		SType = "Text";
	}
	OUT MIR-POL-CSTAT-CD-T[50]
	{
		CodeSource = "DataModel";
		CodeType = "FT-POL-CSTAT-CD";
		DBTableName = "Derived";
		FieldGroup = "Table5";
		Label = "Status";
		Length = "4";
		SType = "Text";
	}
	
# Code changes for MP2601	
	INOUT MIR-FMLY-GIV-NM-KA-T[10]
	{
		MixedCase;
		DBTableName = "TFMLY";
		FieldGroup = "Table8";
		Index = "1";
		Label = "First Name Kana";
		Length = "16";
		SType = "Text";
	}
	INOUT MIR-FMLY-SUR-NM-KA-T[10]
	{
		MixedCase;
		DBTableName = "TFMLY";
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
		DBTableName = "TFMLY";
		FieldGroup = "Table8";
		Index = "1";
		Label = "First Name Kanji";
		Length = "16";
		SType = "Text";
	}
	INOUT MIR-FMLY-SUR-NM-KJ-T[10]
	{
		MixedCase;
		DBTableName = "TFMLY";
		FieldGroup = "Table8";
		Index = "1";
		Label = "Last Name Kanji";
		Length = "16";
		SType = "Text";
	}
	INOUT MIR-FMLY-BTH-DT-T[10]
	{
		DBTableName = "TFMLY";
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
		DBTableName = "TFMLY";
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
		DBTableName = "TFMLY";
		FieldGroup = "Table8";
		Index = "1";
		Label = "Relation";
		Length = "1";
		SType = "Selection";
	}
	INOUT MIR-CLI-VST-DT-1
	{
		DBTableName = "TCVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-CLI-VST-DT-2
	{
		DBTableName = "TCVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-CLI-VST-DT-3
	{
		DBTableName = "TCVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-CLI-VST-DT-4
	{
		DBTableName = "TCVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-CLI-VST-DT-5
	{
		DBTableName = "TCVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-COMNT-TXT-1
	{
		MixedCase;
		DBTableName = "TCVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-COMNT-TXT-2
	{
		MixedCase;
		DBTableName = "TCVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-COMNT-TXT-3
	{
		MixedCase;
		DBTableName = "TCVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-COMNT-TXT-4
	{
		MixedCase;
		DBTableName = "TCVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-COMNT-TXT-5
	{
		MixedCase;
		DBTableName = "TCVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-OTHR-COMNT-TXT
	{
		MixedCase;
		DBTableName = "TCVST";
		Label = "Others";
		Length = "1000";
		SType = "TextArea";
	}

}
