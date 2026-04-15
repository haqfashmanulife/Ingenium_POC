# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9A03-O.s                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPU  CTS      NEW PLAN PAYOUT METHOD DELETE                             *
#*******************************************************************************

S-STEP BF9A03-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Delete";
		DelEmptyRows;
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
		Type = "Output";
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

	IN MIR-LOC-GR-ID 
	{
		CodeSource = "EDIT";
		CodeType = "LOCGP";
		DisplayOnly;
		Key;
		Label = "Location Group";
		Length = "3";
		SType = "Text";
	}

	IN MIR-PAYO-PLAN-MTHD-CD 
	{
		CodeSource = "DataModel";
		CodeType = "PAYO-PLAN-MTHD-CD";
		DisplayOnly;
		Key;
		Label = "Payout Method";
		Length = "2";
		SType = "Text";
	}

	IN MIR-PLAN-ID 
	{
		CodeSource = "EDIT";
		CodeType = "PLAN";
		DisplayOnly;
		Key;
		Label = "Plan";
		Length = "6";
		SType = "Text";
	}
}
