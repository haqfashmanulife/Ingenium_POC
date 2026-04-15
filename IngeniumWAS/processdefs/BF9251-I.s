# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9251-I.s                                                    *
#*  Description: Master Claim Create                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   Initial version.                                          *
#*                                                                             *
#*******************************************************************************
S-STEP BF9251-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
		Type = "Input";
		FocusField = "MIR-CLI-ID";
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

	INOUT MIR-CLI-ID
	{
		Key;
		Length = "10";
		DefaultSession = "MIR-CLI-ID";
		SType = "Text";
		Label = "Client ID";
	}
	OUT MIR-CLM-ID
	{
		Length = "8";
		SType = "Text";
		Label = "Master Claim ID";
	}
}
