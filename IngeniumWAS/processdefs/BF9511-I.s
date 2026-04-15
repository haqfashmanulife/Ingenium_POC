# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

S-STEP BF9511-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
		Type = "Input";
		FocusField = "MIR-SBSDRY-CO-ID";
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

	INOUT MIR-SBSDRY-CO-ID
	{
		Key;
		Mandatory;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "SUBCO";
		SType = "Selection";
		Label = "Sub Company";
	}

	INOUT MIR-LOC-GR-ID
	{
		Key;
		Mandatory;
		Length = "3";
		CodeSource = "EDIT";
		CodeType = "LOCGP";
		SType = "Selection";
		Label = "Location Group";
	}

	INOUT MIR-PAXT-PLAN-ID
	{
		Key;
		Mandatory;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Selection";
		Label = "Plan Name";
	}

	INOUT MIR-PAXT-ADDL-PLAN-ID
	{
		Key;
		Mandatory;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Selection";
		Label = "Additional Plan Name";
	}

	INOUT MIR-PAXT-RULE-TYP-CD
	{
		Key;
		Mandatory;
		Length = "6";
		CodeSource = "DataModel";
		CodeType = "PAXT-RULE-TYP-CD";
		SType = "Selection";
		Label = "Rule";
	}

	INOUT MIR-PAXT-CVG-TYP-CD
	{
		Key;
		Mandatory;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PAXT-CVG-TYP-CD";
		SType = "Selection";
		Label = "Coverage Type";
	}

	INOUT MIR-PAXT-SEX-CD
	{
		Key;
		Mandatory;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PAXT-SEX-CD";
		SType = "Selection";
		Label = "Sex";
	}

	INOUT MIR-PLAN-DPND-PLAN-ID
	{
		Key;
		Mandatory;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Selection";
		Label = "Plan Dependence";
	}
}
