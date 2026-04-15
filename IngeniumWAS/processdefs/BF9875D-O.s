# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9875D-O.s                                                   *
#*  Description: Associated Disease/Surgery List Screen - Output (Disease)     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9875D-O
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

	INOUT MIR-MEDIC-CD 
	{
		Key;
		Mandatory;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CD";
		SType = "Selection";
		Label = "Medical Table";
	}

	INOUT MIR-GRP-MEDC-ID
	{
		Key;
		Length = "10";
		SType = "Text";
		Label = "Major Code";
	}

	INOUT MIR-MEDIC-CAT-CD
	{
		Key;
		Length = "5";
		CodeSource = "DataModel";
		CodeType = "DV-SURG-BNFT-CAT-CD";
		SType = "Selection";
		Label = "Category Name";
	}
	
	INOUT MIR-MEDC-ID
	{
		Length = "10";
		SType = "Hidden";
		Label = "Minor Code";
	}
	
	IN MIR-GRP-LANG-DESC-1-TXT 
	{
		Length = "60";
		SType = "Text";
		Label = "Katakana Name";
	}

	IN MIR-MEDC-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Code Medical Type";
	}

	IN MIR-GRP-MEDC-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Group Medical Type";
	}
	
	IN MIR-MEDC-ID-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Disease Code";
	}
	
	IN MIR-LANG-DESC-1-TXT-T[100] 
	{
		DisplayOnly;
		Length = "60";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Katakana Name";
	}

	IN MIR-LANG-DESC-2-TXT-T[100] 
	{
		DisplayOnly;
		Length = "60";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Katakana Name";
	}

}
