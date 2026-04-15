# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

S-STEP BF9862-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
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

	IN MIR-CLM-REQIR-OPT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-REQIR-OPT-CD";
		SType = "Text";
		Label = "Claim Requirement Level";
	}

	IN MIR-FOLWUP-1-DOC-ID 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "DOCM";
		SType = "Text";
		Label = "1st Follow-up Reminder: Name of Document";
	}

	IN MIR-FOLWUP-1-DY-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "1st Follow-up Reminder: Number of Days";
	}

	IN MIR-FOLWUP-2-DOC-ID 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "DOCM";
		SType = "Text";
		Label = "2nd Follow-up Reminder: Name of Document";
	}

	IN MIR-FOLWUP-2-DY-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "2nd Follow-up Reminder: Number of Days";
	}

	IN MIR-FOLWUP-3-DOC-ID 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "DOCM";
		SType = "Text";
		Label = "3rd Follow-up Reminder: Name of Document";
	}

	IN MIR-FOLWUP-3-DY-DUR 
	{
		DisplayOnly;
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
