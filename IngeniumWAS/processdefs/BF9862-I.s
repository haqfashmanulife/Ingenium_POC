# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

S-STEP BF9862-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		Type = "Input";
		FocusField = "MIR-CLM-REQIR-OPT-CD";
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

	INOUT MIR-CLM-REQIR-OPT-CD
	{
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-REQIR-OPT-CD";
		SType = "Selection";
		Label = "Claim Requirement Level";
	}

	INOUT MIR-FOLWUP-1-DOC-ID
	{
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "DOCM";
		SType = "Selection";
		Label = "1st Follow-up Reminder: Name of Document";
	}

	INOUT MIR-FOLWUP-1-DY-DUR
	{
		Length = "2";
		SType = "Text";
		Label = "1st Follow-up Reminder: Number of Days";
	}

	INOUT MIR-FOLWUP-2-DOC-ID
	{
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "DOCM";
		SType = "Selection";
		Label = "2nd Follow-up Reminder: Name of Document";
	}

	INOUT MIR-FOLWUP-2-DY-DUR
	{
		Length = "2";
		SType = "Text";
		Label = "2nd Follow-up Reminder: Number of Days";
	}

	INOUT MIR-FOLWUP-3-DOC-ID
	{
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "DOCM";
		SType = "Selection";
		Label = "3rd Follow-up Reminder: Name of Document";
	}

	INOUT MIR-FOLWUP-3-DY-DUR
	{
		Length = "2";
		SType = "Text";
		Label = "3rd Follow-up Reminder: Number of Days";
	}

	IN MIR-CLM-REQIR-ID 
	{
		Key;
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "CMRTC";
		SType = "Text";
		Label = "Claim Requirement Code";
	}
}
