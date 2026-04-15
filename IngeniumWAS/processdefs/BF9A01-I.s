# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF9A01-I.s                                                    *
#*  Description: For Creating a New Plan Payout Method                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPU  CTS      NEW PLAN PAYOUT METHOD CREATE                             *
#*******************************************************************************

S-STEP BF9A01-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
		FocusField = "MIR-LOC-GR-ID";
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

	INOUT MIR-LOC-GR-ID
	{
		CodeSource = "EDIT";
		CodeType = "LOCGP";
		Key;
		Label = "Location Group";
		Length = "3";
		Mandatory;
		SType = "Selection";
	}

	INOUT MIR-PAYO-PLAN-MTHD-CD
	{
		CodeSource = "DataModel";
		CodeType = "PAYO-PLAN-MTHD-CD";
		Key;
		Label = "Payout Method";
		Length = "2";
		Mandatory;
		SType = "Selection";
	}

	INOUT MIR-PLAN-ID
	{
		CodeSource = "EDIT";
		CodeType = "PLAN";
		Key;
		Label = "Plan";
		Length = "6";
		Mandatory;
		SType = "Selection";
	}
}
