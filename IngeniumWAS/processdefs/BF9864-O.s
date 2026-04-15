# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

S-STEP BF9864-O
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

	INOUT MIR-CLM-REQIR-ID 
	{
		Key;
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "CMRTC";
		SType = "Selection";
		Label = "Claim Requirement Code";
	}

	IN MIR-CLM-REQIR-OPT-CD-T[11] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table11";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-REQIR-OPT-CD";
		SType = "Text";
		Label = "Claim Requirement Level";
	}

	IN MIR-FOLWUP-1-DOC-ID-T[11] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table11";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "DOCM";
		SType = "Text";
		Label = "1st Follow-up Reminder: Name of Document";
	}

	IN MIR-FOLWUP-1-DY-DUR-T[11] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table11";
		Index = "1";
		SType = "Text";
		Label = "1st Follow-up Reminder: Number of Days";
	}

	IN MIR-FOLWUP-2-DOC-ID-T[11] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table11";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "DOCM";
		SType = "Text";
		Label = "2nd Follow-up Reminder: Name of Document";
	}

	IN MIR-FOLWUP-2-DY-DUR-T[11] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table11";
		Index = "1";
		SType = "Text";
		Label = "2nd Follow-up Reminder: Number of Days";
	}

	IN MIR-FOLWUP-3-DOC-ID-T[11] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table11";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "DOCM";
		SType = "Text";
		Label = "3rd Follow-up Reminder: Name of Document";
	}

	IN MIR-FOLWUP-3-DY-DUR-T[11] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table11";
		Index = "1";
		SType = "Text";
		Label = "3rd Follow-up Reminder: Number of Days";
	}

	IN MIR-CLM-REQIR-ID-T[11] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table11";
		KeyColumn;
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "CMRTC";
		Link;
		SType = "Text";
		Label = "Claim Requirement Code";
		Action = "SelectItem";
	}
}
