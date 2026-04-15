# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A51-I.s                                                    *
#*  Description: Death Master Claim Create                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A51-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
		FocusField = "MIR-POL-ID";
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

	INOUT MIR-CLI-ID
	{
		DefaultSession = "MIR-CLI-ID";
		Key;
		Length = "10";			
		SType = "Text";
		Label = "Client ID";		
	}

	INOUT MIR-POL-ID
	{
		Key;
		Length = "10";
                DefaultSession = "MIR-POL-ID-BASE";		
		SType = "Text";		
		Label = "Policy ID";
	}
}
