# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9867-I.s                                                    *
#*  Description: BENM Discharge Multiplier Update screen                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9867-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
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

	IN MIR-BENM-MULTR-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Discharge Multiplier Code";
	}

	IN MIR-BENM-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Multiplier Type";
	}

	IN MIR-MULTR-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Multiplier Category";
	}

	INOUT MIR-BENM-MULTR-FCT
	{
		Length = "5";
		SType = "Number";
		Label = "Multiplier Amount";
	}

	INOUT MIR-BENM-DUR
	{
		Length = "5";
		SType = "Number";
		Label = "Duration";
	}	
}
