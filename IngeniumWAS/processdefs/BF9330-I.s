# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9330-O.s                                                    *
#*  Description: Claim Payment Inquiry                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   HIN/EC CLAIM PAYMENT                                      *
#*                                                                             *
#*******************************************************************************
S-STEP BF9330-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
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

        INOUT MIR-DV-PRCES-STATE-CD
        {
            Length = "1";
            SType = "Hidden";
            Label = "process code";
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
