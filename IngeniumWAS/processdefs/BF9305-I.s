#*******************************************************************************
#*  Component:   BF9305-I.s                                                    *
#*  Description: Created for Advance Payment Management Screen                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLPP6  CTS      INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF9305-I
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

	INOUT MIR-PCHST-EFF-DT
	{
		Length = "10";
		SType = "Hidden";
	}

	INOUT MIR-PCHST-SEQ-NUM
	{
		Length = "3";
		SType = "Hidden";
	}

	INOUT MIR-TH-PREM-PD-DT-NUM
	{
		Length = "10";
		SType = "Hidden";
	}

	INOUT MIR-HID-ADV-PMT-STRT-DT
	{
		Length = "10";
		SType = "Hidden";
	}

	INOUT MIR-HID-ADV-PMT-DUR
	{
		Length = "3";
		SType = "Hidden";
	}

	INOUT MIR-HID-ADV-PMT-END-DT
	{
		Length = "10";
		SType = "Hidden";
	}

	INOUT MIR-HID-ADV-PMT-TYP-CD
	{
		Length = "1";
		SType = "Hidden";
	}

	INOUT MIR-HID-RSDUE-AMT
	{
		Length = "15";
		SType = "Hidden";
	}

	INOUT MIR-HID-SURR-AMT
	{
		Length = "15";
		SType = "Hidden";
	}
}
