# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9865-O.s                                                    *
#*  Description: BENM Discharge Multiplier Retrieve - Output                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9865-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		Type = "Output";
		DelEmptyRows;
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
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
	
	IN MIR-BENM-MULTR-FCT 
	{
		DisplayOnly;
		Length = "5";
		SType = "Number";
		Label = "Multiplier Amount";
	}
        
	IN MIR-BENM-DUR 
	{
		DisplayOnly;
		Length = "5";
		SType = "Number";
		Label = "Duration";
	}

}
