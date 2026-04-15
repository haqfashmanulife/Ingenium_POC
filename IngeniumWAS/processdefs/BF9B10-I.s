#*******************************************************************************
#*  Component:   BF9B10-I.s                                                    *
#*  Description: Created for Tax Payment Record Information Screen             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M142S2   CTS     INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************
S-STEP BF9B10-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		FocusField = "MIR-POL-ID-BASE";
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

	INOUT MIR-POL-ID-BASE
	{
		DefaultSession = "MIR-POL-ID-BASE";
		Key;
		Label = "Policy ID";
		Length = "9";
		Mandatory;
		SType = "Text";
	}

	INOUT MIR-POL-ID-SFX
	{
		DefaultSession = "MIR-POL-ID-SFX";
		Key;
		Label = "Suffix";
		Length = "1";
		SType = "Text";
	}
}
