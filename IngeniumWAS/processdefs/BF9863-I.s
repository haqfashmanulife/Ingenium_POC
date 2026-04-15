# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

S-STEP BF9863-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Delete";
		Type = "Input";
		FocusField = "MIR-CLM-REQIR-ID";
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

	INOUT MIR-CLM-REQIR-ID
	{
		Key;
		Mandatory;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "CMRTC";
		SType = "Selection";
		Label = "Claim Requirement Code";
	}
}
