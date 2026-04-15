#*******************************************************************************
#*  Component:   BF9923-P.p                                                    *
#*  Description: PROSPECT DELETE                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0054  CTS      Initial version                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9923-P
{
	ATTRIBUTES
	{
		BusinessFunctionId = "9923";
		BusinessFunctionName = "Prospect Delete";
                BusinessFunctionType = "Delete";
		MirName = "CCWM9923";
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

	IN MIR-ILST-BTH-DT
	{
		DBTableName = "TPROS";
		Label = "Date of Birth";
		Length = "10";
		SType = "Date";
	}

	INOUT MIR-ILST-MARIT-DT
	{
		DBTableName = "TPVST";
		Label = "Marriage Date";
		Length = "10";
		SType = "Date";
	}

	INOUT MIR-ILST-MARIT-STAT-CD
	{
		CodeSource = "DataModel";
		CodeType = "FT-ILST-MAR-STS";
		DBTableName = "TPROS";
		Label = "Marital Status";
		Length = "1";
		SType = "Selection";
	}
	

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
	IN MIR-PRPS-ID
	{
		DBTableName = "TPROS";
		Label = "Prospect Id";
		Length = "9";
	        SType = "hidden";
	}
	
}

