S-STEP BF9A22-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		FocusField = "MIR-POL-ID";
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

	INOUT MIR-POL-ID
	{
		DefaultSession = "MIR-POL-ID-BASE";
		Key;
		Label = "Policy ID";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-CLI-ID 
	{
		DefaultSession = "MIR-CLI-ID";
		Key;
		Label = "Client Id";
		Length = "10";
		SType = "Text";
	}
}
