# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   SurgSearch-O.s                                                *
#*  Description: Surgery Search Screen - Output                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   INITIAL VERSION                                           *
#*  143C45           CHANGES TO ADD KANJI NAME SEARCH IN 'SURGERY CODE SEARCH' *
#*  143C45           SCREEN IN MEDICAL CLAIM CREATE AND UPDATE SCREEN          *
#*                                                                             *
#*******************************************************************************

S-STEP SurgSearch-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Output";
		DelEmptyRows;
		FocusField = "MIR-LANG-DESC-1-TXT";
		FocusFrame = "ContentFrame";
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

	INOUT MIR-ORIG-DESC-1-TXT
	{
		SType = "Hidden";
	}

	INOUT MIR-END-DESC-1-TXT
	{
		SType = "Hidden";
	}

	INOUT MIR-LANG-DESC-1-TXT 
	{
		Key;
		Length = "60";
		SType = "Text";
		Label = "Surgery Code Katakana Descriptions:";
	}
#143C45 CHANGES STARTS HERE	
	INOUT MIR-ORIG-DESC-2-TXT
	{
		SType = "Hidden";
	}

	INOUT MIR-END-DESC-2-TXT
	{
		SType = "Hidden";
	}

	INOUT MIR-LANG-DESC-2-TXT 
	{
		Key;
		Length = "60";
		SType = "Text";
		Label = "Surgery Code Kanji Descriptions:";
	}
#143C45 CHANGES ENDS HERE	

	IN MIR-MEDC-ID-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		KeyColumn;
		Index = "1";
		SType = "Text";
		Label = "Minor Code";
	}
	
	IN MIR-LANG-DESC-1-TXT-T[100] 
	{
		DisplayOnly;
		Length = "60";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Minor Code Katakana Descriptions";
	}

	IN MIR-LANG-DESC-2-TXT-T[100] 
	{
		DisplayOnly;
		Length = "60";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Minor Code Kanji Descriptions";
	}

	IN MIR-MEDC-SUBTYP-CD-T[100] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "SUBTY";
		SType = "Text";
		Label = "Surgery Type";
	}

}
