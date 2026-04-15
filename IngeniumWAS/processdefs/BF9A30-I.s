S-STEP BF9A30-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		FocusField = "MIR-CLM-ID";
		FocusFrame = "ContentFrame";
		Type = "Input";
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

	INOUT MIR-DV-PRCES-STATE-CD
	{
		Label = "process code";
		Length = "1";
		SType = "Hidden";
	}

	INOUT MIR-CLM-ID
	{
		DefaultSession = "MIR-CLM-ID";	
		Key;
		Label = "Death Master Claim ID";
		Length = "8";
		SType = "Text";
	}
}
