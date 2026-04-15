# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9254-I.s                                                    *
#*  Description: Run Auto Adjudication                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   Initial version.                                          *
#*                                                                             *
#*******************************************************************************
S-STEP BF9254-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
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

	INOUT MIR-CLM-ID
	{
		Key;
		Length = "8";
                DefaultSession = "MIR-CLM-ID";
		SType = "Text";
		Label = "Master Claim ID";
	}
}
