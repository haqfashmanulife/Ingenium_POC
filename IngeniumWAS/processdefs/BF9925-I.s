#*******************************************************************************
#*  Component:   BF9925-I.s                                                    *
#*  Description: AGENT INQUIRY                                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS  INITIAL VERSION                                               *
#*                                                                             *
#*******************************************************************************
S-STEP BF9925-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Inquiry";
		FocusField = "MIR-AGT-ID";
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

	INOUT MIR-AGT-ID
	{
		Key;
		Label = "Agent Id";
		Length = "6";
		Mandatory;
		SType = "Text";
	}
}
