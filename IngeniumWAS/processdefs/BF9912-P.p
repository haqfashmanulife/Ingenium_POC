#*******************************************************************************
#*  Component:   BF9912-P.p                                                    *
#*  Description: CUSTOMER UPDATE                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS      Initial version                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9912-P
{
	ATTRIBUTES
	{
		BusinessFunctionId = "9912";
		BusinessFunctionName = "Customer Update";
                BusinessFunctionType = "Update";
		MirName = "CCWM9912";
	}
        OUT LSIR-RETURN-CD;
        OUT MIR-RETRN-CD;

	IN MIR-AGT-ID
	{
		DBTableName = "TAG";
		DefaultSession = "MIR-AGT-ID";
		Label = "PA Code";
		Length = "6";
		SType = "Text";
	}     

	IN MIR-DV-CLI-NM-KA
	{
		DBTableName = "Derived";
		Label = "Name Kana";
		Length = "17";
		MixedCase;
		SType = "Hidden";
	}

	IN MIR-CLI-BTH-DT
	{
		DBTableName = "TCUST";
		Label = "Date of Birth";
		Length = "10";
		SType = "Date";
	}

	INOUT MIR-CLI-MARIT-DT
	{
		DBTableName = "TCVST";
		Label = "Marriage Date";
		Length = "10";
		SType = "Date";
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

