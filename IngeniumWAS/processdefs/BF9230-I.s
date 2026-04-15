# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9230-I.s                                                    *
#*  Description: Policy's bank detail enquiry / confirmation frontscreen.      *
#*                                                                             *
#*******************************************************************************
#* Date... Who.  Chg#  Release   Description                                   *
#*                                                                             *
#* 17Sep02 DvdC  NB001 ManuLife  Original version.                             *
#*                                                                             *
#*******************************************************************************

S-STEP BF9230-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
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
		Label = "Policy ID";
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
		Label = "Application Number";
	}
}
