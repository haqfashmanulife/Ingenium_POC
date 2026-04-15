#*******************************************************************************
#*  Component:   BF9C24-I.s                                                    *
#*  Description: TD Reinstatement Information List Screen                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*******************************************************************************

S-STEP BF9C24-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
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
		Key;
		Label = "Processing Date";
		Length = "10";
		SType = "Date";
	}

}
