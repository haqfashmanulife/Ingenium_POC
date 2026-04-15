# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

S-STEP BF9044-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Input";
		FocusField = "MIR-POL-ID-BASE";
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

	INOUT MIR-POL-ID-BASE
	{
		Key;
		Length = "9";
		DefaultSession = "MIR-POL-ID-BASE";
		SType = "Text";
		Label = "Policy Id";
	}

	INOUT MIR-POL-ID-SFX
	{
		Key;
		Length = "1";
		DefaultSession = "MIR-POL-ID-SFX";
		SType = "Text";
		Label = "Suffix";
	}

	INOUT MIR-POL-APP-FORM-ID
	{
		Key;
		Length = "15";
		SType = "Text";
		Label = "Application Form ID";
	}
}
