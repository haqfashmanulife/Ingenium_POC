#*******************************************************************************
#*  Component:   BF9304-I.s                                                    *
#*  Description: Created for Advance Payment Management Screen                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#* M271B2   19AUG15  INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF9304-I
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

	INOUT MIR-PRCES-DT
	{
		DefaultSession = "LSIR-PRCES-DT";
		Label = "Processing Date";
		Length = "10";
		SType = "Date";
	}

}
