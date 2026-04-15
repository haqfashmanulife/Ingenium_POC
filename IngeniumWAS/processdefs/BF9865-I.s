# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9865-I.s                                                    *
#*  Description: BENM Discharge Multiplier Retrieve - Input                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9865-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		Type = "Input";
		FocusField = "MIR-BENM-MULTR-ID";
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

	INOUT MIR-BENM-MULTR-ID
	{
		Key;
		Mandatory;
		Length = "10";
		SType = "Text";
		Label = "Discharge Multiplier Code";
	}

	OUT MIR-BENM-TYP-CD
	{
		SType="Hidden";
	}

	OUT MIR-MULTR-TYP-CD
	{
		SType="Hidden";
	}	
}
