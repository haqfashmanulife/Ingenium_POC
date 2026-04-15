#*******************************************************************************
#*  Component:   BF9222-I.s                                                    *
#*  Description: UL MEDICAL CLAIM SUMMARY INPUT S-STEP                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN000388   CTS     Initial Version                                         *
#*                                                                             *
#*******************************************************************************

S-STEP BF9222-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		FocusField = "MIR-CLM-ID";
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

	INOUT MIR-CLM-ID
	{
		DefaultSession = "MIR-CLM-ID";
		Key;
		Label = "Master Claim ID";
		Length = "8";
		Mandatory;
		SType = "Text";
	}
}
