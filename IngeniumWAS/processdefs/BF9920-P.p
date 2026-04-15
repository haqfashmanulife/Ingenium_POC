#*******************************************************************************
#*  Component:   BF9920-P.p                                                    *
#*  Description: PROSPECT INQUIRY                                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS      Initial version                                           *
#*  MP0054  CTS      ADDED FIELD FOR PROSPECT ID                               *
#*******************************************************************************
P-STEP BF9920-P
{
	ATTRIBUTES
	{
		BusinessFunctionId = "9920";
		BusinessFunctionType = "Inquiry";
		MirName = "CCWM9920";
	}
	OUT LSIR-RETURN-CD;
	OUT MIR-RETRN-CD;

	INOUT MIR-DV-ILST-NM-KA
	{
		DBTableName = "Derived";
		Label = "Name Kana";
		Length = "101";
		MixedCase;
		SType = "Text";
	}

	INOUT MIR-PRCES-DT
	{
		DefaultSession = "LSIR-PRCES-DT";
		Label = "Date";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-DV-RO-SO-CD
	{
		DBTableName = "Derived";
		Label = "RO-SO Code";
		Length = "10";
		SType = "Text";
	}
	INOUT MIR-AGT-ID
	{
		DBTableName = "TAG";
		DefaultSession = "MIR-AGT-ID";
		Label = "PA Code";
		Length = "6";
		SType = "Text";
	}
	INOUT MIR-AGT-NM
	{
		DBTableName = "TCLNC";
		Label = "PA Name";
		Length = "50";
		SType = "Text";
	}
	OUT MIR-DV-ILST-NM-KJ
	{
		DBTableName = "Derived";
		Label = "Name Kanji";
		Length = "101";
		MixedCase;
		SType = "Text";
	}
	INOUT MIR-ILST-BTH-DT
	{
		DBTableName = "TPROS";
		Label = "Date of Birth";
		Length = "10";
		SType = "Date";
	}
	OUT MIR-DV-ILST-AGE
	{
		DBTableName = "Derived";
		Label = "Age";
		Length = "3";
		SType = "Text";
	}
	OUT MIR-ILST-SEX-CD
	{
		CodeSource = "DataModel";
		CodeType = "FT-CLI-SEX-CD";
		DBTableName = "TPROS";
		Label = "Sex";
		Length = "1";
		SType = "Text";
	}
	OUT MIR-ILST-PSTL-CD
	{
		DBTableName = "TPROS";
		Label = "Zip Code";
		Length = "09";
		SType = "Text";
	}
	OUT MIR-ILST-ADDR-CD
	{
		DBTableName = "TPROS";
		Label = "Address Code";
		Length = "8";
		SType = "Text";
	}
	OUT MIR-ILST-ADDR-TXT
	{
		DBTableName = "TPROS";
		Label = "Address";
		Length = "50";
		SType = "Text";
	}
	OUT MIR-ILST-ADDR-TXT-KA
	{
		DBTableName = "TPROS";
		Label = "Address Description(Kana)";
		Length = "150";
		SType = "Text";
	}
	OUT MIR-ILST-ADDR-TXT-KJ
	{
		DBTableName = "TPROS";
		Label = "Address Description(Kanji)";
		Length = "150";
		SType = "Text";
	}
	OUT MIR-ILST-PHON-NUM
	{
		DBTableName = "TPROS";
		Label = "TEL NO";
		Length = "30";
		SType = "Text";
	}
	OUT MIR-ILST-EMAIL-ID
	{
		DBTableName = "TPROS";
		Label = "E-Mail";
		Length = "100";
		SType = "Text";
	}
	OUT MIR-ILST-JOB-CD
	{
                CodeSource = "EDIT";
                CodeType = "TTOCC";
		DBTableName = "TPROS";
		Label = "Job Code";
		Length = "05";
		SType = "Text";
	}
	OUT MIR-ILST-ANUL-SLRY
	{
		DBTableName = "TPROS";
		Label = "Annual Salary";
		Length = "20";
		SType = "Text";
	}
	OUT MIR-ILST-SMKR-STAT-CD
	{
		CodeSource = "DataModel";
		CodeType = "FT-CLI-SMKR-CD";
		DBTableName = "TPROS";
		Label = "Smoke status";
		Length = "1";
		SType = "Text";
	}
	INOUT MIR-ILST-MARIT-STAT-CD
	{
		CodeSource = "DataModel";
		CodeType = "FT-CLI-MAR-STS";
		DBTableName = "TPROS";
		Label = "Marital Status";
		Length = "1";
		SType = "Selection";
	}
	INOUT MIR-ILST-MARIT-DT
	{
		DBTableName = "TPVST";
		Label = "Marriage Date";
		Length = "10";
		SType = "Date";
	}
	OUT MIR-ILST-ID-T[50]
	{
		DBTableName = "TPROS";
		FieldGroup = "Table5";
		Index = "1";
		Label = "Illustrator No.";
		Length = "30";
		SType = "Text";
	}
	OUT MIR-APPL-ID-T[50]
	{
		DBTableName = "TPROS";
		FieldGroup = "Table5";
		Index = "1";
		Label = "Application No.";
		Length = "30";
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
		Length = "10";
		SType = "Text";
	}
	OUT MIR-ILST-REL-TYP-CD-T[50]
	{
		CodeSource = "DataModel";
		CodeType = "FT-ILST-REL-TYP-CD";
		DBTableName = "TPROS";
		FieldGroup = "Table5";
		Index = "1";
		Label = "Relation Type";
		Length = "04";
		SType = "Text";
	}
	OUT MIR-ILST-POL-STAT-CD-T[50]
	{
		CodeSource = "DataModel";
		CodeType = "ILST-POL-CSTAT-CD";
		DBTableName = "TPROS";
		FieldGroup = "Table5";
		Label = "Status";
		Length = "1";
		SType = "Text";
	}
	OUT MIR-PREV-UPDT-TS-T[50]
	{
		DBTableName = "TPROS";
		FieldGroup = "Table5";
		Index = "1";
		Label = "Last Update";
		Length = "26";
		SType = "Text";
	}

# Code changes for MP0054 	
	INOUT MIR-PRPS-ID
	{
		DBTableName = "TPROS";
	        Label = "Prospect Id";
	        Length = "9";
                SType = "hidden"; 
	}
	
# Code changes for MP2601	
	INOUT MIR-FMLY-GIV-NM-KA-T[10]
	{
		DBTableName = "TFMLY";
		FieldGroup = "Table8";
		Index = "1";
		Label = "First Name Kana";
		Length = "16";
		MixedCase;
		SType = "Text";
	}
	INOUT MIR-FMLY-SUR-NM-KA-T[10]
	{
		DBTableName = "TFMLY";
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
		DBTableName = "TFMLY";
		FieldGroup = "Table8";
		Index = "1";
		Label = "First Name Kanji";
		Length = "16";
		MixedCase;
		SType = "Text";
	}
	INOUT MIR-FMLY-SUR-NM-KJ-T[10]
	{
		DBTableName = "TFMLY";
		FieldGroup = "Table8";
		Index = "1";
		Label = "Last Name Kanji";
		Length = "16";
		MixedCase;
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
	INOUT MIR-ILST-VST-DT-1
	{
		DBTableName = "TPVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-ILST-VST-DT-2
	{
		DBTableName = "TPVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-ILST-VST-DT-3
	{
		DBTableName = "TPVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-ILST-VST-DT-4
	{
		DBTableName = "TPVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-ILST-VST-DT-5
	{
		DBTableName = "TPVST";
		Index = "1";
		Label = "Date of Visit";
		Length = "10";
		SType = "Date";
	}
	INOUT MIR-COMNT-TXT-1
	{
		MixedCase;
		DBTableName = "TPVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-COMNT-TXT-2
	{
		MixedCase;
		DBTableName = "TPVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-COMNT-TXT-3
	{
		MixedCase;
		DBTableName = "TPVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-COMNT-TXT-4
	{
		MixedCase;
		DBTableName = "TPVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-COMNT-TXT-5
	{
		MixedCase;
		DBTableName = "TPVST";
		Index = "1";
		Label = "Comments";
		Length = "80";
		SType = "Text";
	}
	INOUT MIR-OTHR-COMNT-TXT
	{
		MixedCase;
		DBTableName = "TPVST";
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
