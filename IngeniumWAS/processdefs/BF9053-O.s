# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

S-STEP BF9053-O
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

	IN MIR-CLI-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Client Number";
	}

	IN MIR-POL-ID-BASE 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Policy ID";
	}

	IN MIR-POL-ID-SFX 
	{
		Key;
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "Suffix";
	}
}
