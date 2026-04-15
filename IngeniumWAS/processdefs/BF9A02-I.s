# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9A02-I.p                                                    *
#*  Description: For Updating a New Plan Payout Method                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPU  CTS      NEW PLAN PAYOUT METHOD UPDATE                             *
#*******************************************************************************

S-STEP BF9A02-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		FocusField = "MIR-PLAN-MTHD-DFLT-IND";
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

	INOUT MIR-PLAN-MTHD-DFLT-IND
	{
		Label = "Default";
		Length = "1";
		SType = "Indicator";
	}

	INOUT MIR-PAYO-PLAN-LEAD-MTHD-CD
	{
		CodeSource = "EDIT";
		CodeType = "LTMD";
		Label = "Lead Time Method";
		Length = "2";
		SType = "Selection";
	}

	INOUT MIR-PAYO-PLAN-LEAD-DUR
	{
		Label = "Lead Time";
		Length = "3";
		SType = "Text";
	}

	INOUT MIR-LEAD-TIME-TYP-CD
	{
		CodeSource = "EDIT";
		CodeType = "POTYP";
		Label = "Lead Time Type";
		Length = "2";
		SType = "Selection";
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
