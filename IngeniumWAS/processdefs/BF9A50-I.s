# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A50-I.s                                                    *
#*  Description: Death Master Claim Retrieve                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A50-I
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
		Length = "8";
		SType = "Text";		
		Label = "Death Master Claim ID";
	}

}
