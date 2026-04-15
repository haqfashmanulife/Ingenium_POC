# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

S-STEP BF9213-O
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

	IN MIR-BUS-CAL-DT-YR 
	{
		Key;
		DisplayOnly;
		Length = "4";
		SType = "Text";
		Label = "Year";
	}

	IN MIR-BUS-CAL-DT-MO 
	{
		Key;
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Month";
	}
}
