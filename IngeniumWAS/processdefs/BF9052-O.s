# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT
#*******************************************************************************
#*  M119NB  CTS      ADDED FLAG FOR AGGREGATE FACE AMOUNT FOR THE INSURED UNDER*
#*                   15 YEARS OLD EXCEEDING 10 MILLION YEN 		       *
#*******************************************************************************

S-STEP BF9052-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
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

	IN MIR-LINC-REG-ID 
	{
		DisplayOnly;
		Length = "12";
		SType = "Text";
		Label = "Registration Number";
	}

	IN MIR-LINC-REG-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Registration Date";
	}
#*M119NB CHANGES STARTS HERE*
	IN MIR-LINC-AGGR-FACE-AMT-IND
	{
	        DisplayOnly;
	        Length = "1";
                SType = "Indicator";
	        Label = "Aggregate Face Amount LINC Indicator for Insured below 15 years";
        }
#*M119NB CHANGES ENDS HERE*

	IN MIR-CLI-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Client Number";
	}

	IN MIR-POL-ID-BASE 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Policy ID";
	}

	IN MIR-POL-ID-SFX 
	{
		Key;
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "Suffix";
	}

	IN MIR-DV-CLI-NM 
	{
		DisplayOnly;
		Length = "75";
		SType = "Text";
		Label = "Client Name";
	}
}
