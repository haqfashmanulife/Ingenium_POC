# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9270-I.s                                                    *
#*  Description: Adjudicator Inquiry Summary - Input                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   Initial Version                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9270-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Input";
		FocusField = "MIR-CLM-ID";
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

	INOUT MIR-FCN-CD
	{
		Length = "1";
		SType = "Hidden";
		Label = "Function Code";
	}

	INOUT MIR-CLM-ID
	{
		Key;
		Mandatory;
		Length = "8";
		DefaultSession = "MIR-CLM-ID";
		SType = "Text";
		Label = "Claim ID";
	}
}
