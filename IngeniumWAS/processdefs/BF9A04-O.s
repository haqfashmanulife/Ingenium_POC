# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9A04-O.s                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPU  CTS      NEW PLAN PAYOUT METHOD LIST                               *
#*******************************************************************************

S-STEP BF9A04-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
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
	
	OUT index
	{
		SType = "Hidden";
	}

	IN MIR-LOC-GR-ID 
	{
		CodeSource = "EDIT";
		CodeType = "LOCGP";
		DisplayOnly;
		Label = "Location Group";
		Length = "3";
		SType = "Text";
	}

	IN MIR-PAYO-PLAN-MTHD-CD 
	{
		CodeSource = "DataModel";
		CodeType = "PAYO-PLAN-MTHD-CD";
		DisplayOnly;
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

	IN MIR-LOC-GR-ID-T[12]
	{
		CodeSource = "EDIT";
		KeyColumn;
		CodeType = "LOCGP";
		DisplayOnly;
		FieldGroup = "Table12";
		Index = "1";		
		Label = "Location Group";
		Length = "3";
		Link;
		Action = "SelectItem";
		SType = "Text";
	}

	IN MIR-PAYO-PLAN-MTHD-CD-T[12]
	{
		CodeSource = "DataModel";
		CodeType = "PAYO-PLAN-MTHD-CD";
		DisplayOnly;
		FieldGroup = "Table12";
		Index = "1";		
		Label = "Payout Method";
		Length = "2";
		SType = "Text";
	}

	IN MIR-PLAN-MTHD-DFLT-IND-T[12] 
	{
		DisplayOnly;
		FieldGroup = "Table12";
		Index = "1";
		Label = "Default";
		Length = "1";
		SType = "Indicator";
	}

	IN MIR-PAYO-PLAN-LEAD-MTHD-CD-T[12] 
	{
		CodeSource = "EDIT";
		CodeType = "LTMD";
		DisplayOnly;
		FieldGroup = "Table12";
		Index = "1";
		Label = "Lead Time Method";
		Length = "2";
		SType = "Text";
	}

	IN MIR-PAYO-PLAN-LEAD-DUR-T[12] 
	{
		DisplayOnly;
		FieldGroup = "Table12";
		Index = "1";
		Label = "Lead Time";
		Length = "3";
		SType = "Text";
	}

	IN MIR-LEAD-TIME-TYP-CD-T[12] 
	{
		CodeSource = "EDIT";
		CodeType = "POTYP";
		DisplayOnly;
		FieldGroup = "Table12";
		Index = "1";
		Label = "Lead Time Type";
		Length = "2";
		SType = "Text";
	}
}
