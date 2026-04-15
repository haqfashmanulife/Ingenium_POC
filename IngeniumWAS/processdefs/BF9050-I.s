# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

S-STEP BF9050-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		Type = "Input";
		FocusField = "MIR-CLI-ID";
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

	INOUT MIR-CLI-ID
	{
		Key;
		Mandatory;
		Length = "10";
		SType = "Text";
		Label = "Client Number";
	}

	INOUT MIR-POL-ID-BASE
	{
		Key;
		Mandatory;
		Length = "10";
		SType = "Text";
		Label = "Policy ID";
	}

	INOUT MIR-POL-ID-SFX
	{
		Key;
		Length = "1";
		SType = "Text";
		Label = "Suffix";
	}
}
