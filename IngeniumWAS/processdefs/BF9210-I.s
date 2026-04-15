# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

S-STEP BF9210-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		Type = "Input";
		FocusField = "MIR-BUS-CAL-DT-YR";
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

	INOUT MIR-BUS-CAL-DT-YR
	{
		Key;
		Mandatory;
		Length = "4";
		SType = "Text";
		Label = "Year";
	}

	INOUT MIR-BUS-CAL-DT-MO
	{
		Key;
		Mandatory;
		Length = "2";
		SType = "Text";
		Label = "Month";
	}

	INOUT MIR-BUS-CAL-DT-MTH-TXT
	{
		Key;
		Mandatory;
		Length = "10";
		SType = "Text";
		Label = "Name";
	}
}
