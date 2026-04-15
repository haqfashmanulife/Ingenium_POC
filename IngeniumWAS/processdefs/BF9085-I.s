# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

S-STEP BF9085-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
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
		SType = "Text";
		Label = "Policy Id";
	}

	INOUT MIR-POL-ID-SFX
	{
		Key;
		Length = "1";
		SType = "Text";
		Label = "Suffix";
	}

	INOUT MIR-APPL-CTL-PRCES-DT
	{
		Mandatory;
		Length = "10";
		SType = "Date";
		Label = "Create Date";
	}

	INOUT MIR-SEQ-NUM
	{
		Mandatory;
		Length = "3";
		SType = "Number";
		Label = "Seq Number";
	}

	INOUT MIR-DV-PRCES-STATE-CD
	{
		Length = "1";
		SType = "Hidden";
		Label = "Process State";
	}
}
