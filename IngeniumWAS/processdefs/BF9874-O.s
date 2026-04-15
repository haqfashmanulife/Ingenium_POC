# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9874-O.s                                                    *
#*  Description: Disease/Surgery Major Code List Screen - Output               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9874-O
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

	INOUT MIR-MEDC-ID
	{
		Key;
		Length = "10";
		SType = "Text";
		Label = "Major Code";
	}
	
	INOUT MIR-LANG-DESC-1-TXT 
	{
		Key;
		Length = "60";
		SType = "Text";
		Label = "Katakana Name";
	}

	IN MIR-MEDC-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Group Medical Type";
	}
	
	IN MIR-MEDIC-CD-T[100] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CD";
		SType = "Text";
		Label = "Medical Table";
	}

	IN MIR-MEDC-ID-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Medical ID";
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
