# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

S-STEP BF9863-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Delete";
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
