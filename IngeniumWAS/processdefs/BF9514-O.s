# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

S-STEP BF9514-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
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
	
	OUT index
	{
		SType = "Hidden";
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
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Selection";
		Label = "Additional Plan Name";
	}

	INOUT MIR-PAXT-RULE-TYP-CD 
	{
		Key;
		Length = "6";
		CodeSource = "DataModel";
		CodeType = "PAXT-RULE-TYP-CD";
		SType = "Selection";
		Label = "Rule";
	}

	INOUT MIR-PAXT-CVG-TYP-CD 
	{
		Key;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PAXT-CVG-TYP-CD";
		SType = "Selection";
		Label = "Coverage Type";
	}

	INOUT MIR-PAXT-SEX-CD 
	{
		Key;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PAXT-SEX-CD";
		SType = "Selection";
		Label = "Sex";
	}

	INOUT MIR-PLAN-DPND-PLAN-ID 
	{
		Key;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Selection";
		Label = "Plan Dependence";
	}

	IN MIR-SBSDRY-CO-ID-T[30] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table100";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "SUBCO";
		SType = "Text";
		Label = "Sub Company";
	}

	IN MIR-LOC-GR-ID-T[30] 
	{
		DisplayOnly;
		Length = "3";
		FieldGroup = "Table100";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "LOCGP";
		SType = "Text";
		Label = "Location Group";
	}

	IN MIR-PAXT-PLAN-ID-T[30] 
	{
		DisplayOnly;
		Length = "6";
		FieldGroup = "Table100";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Plan Name";
	}

	IN MIR-PAXT-ADDL-PLAN-ID-T[30] 
	{
		DisplayOnly;
		Length = "6";
		FieldGroup = "Table100";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Additional Plan Name";
	}

	IN MIR-PAXT-RULE-TYP-CD-T[30] 
	{
		DisplayOnly;
		Length = "6";
		FieldGroup = "Table100";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "PAXT-RULE-TYP-CD";
		SType = "Text";
		Label = "Rule";
	}

	IN MIR-PAXT-CVG-TYP-CD-T[30] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table100";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "PAXT-CVG-TYP-CD";
		SType = "Text";
		Label = "Coverage Type";
	}

	IN MIR-PAXT-SEX-CD-T[30] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table100";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "PAXT-SEX-CD";
		SType = "Text";
		Label = "Sex";
	}

	IN MIR-PLAN-DPND-PLAN-ID-T[30] 
	{
		DisplayOnly;
		Length = "6";
		FieldGroup = "Table100";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Plan Dependence";
	}
}
