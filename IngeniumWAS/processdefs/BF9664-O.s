# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

S-STEP BF9664-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Output";
		DelEmptyRows;
		FocusField = "MIR-PLAN-ID";
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
	
	OUT index
	{
		SType = "Hidden";
	}

	INOUT MIR-PLAN-ID 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Selection";
		Label = "Plan Name";
	}

	INOUT MIR-BNFT-NM-ID 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "BENNM";
		SType = "Selection";
		Label = "Benefit Name";
	}

	INOUT MIR-STBL-2-CD 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "STB2";
		SType = "Selection";
		Label = "Sub-table 2";
	}

	INOUT MIR-STBL-4-CD 
	{
		Key;
		DisplayOnly;
		Length = "02";
		CodeSource = "EDIT";
		CodeType = "STB4";
		SType = "Selection";
		Label = "Sub-table 4";
	}

	INOUT MIR-EFF-DT 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Effective Date";
	}

	IN MIR-PLAN-ID-T[50] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Plan Name";
	}

	IN MIR-BNFT-NM-ID-T[50] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "BENNM";
		SType = "Text";
		Label = "Benefit Name";
	}

	IN MIR-STBL-2-CD-T[50] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "STB2";
		SType = "Text";
		Label = "Sub-table 2";
	}

	IN MIR-STBL-4-CD-T[50] 
	{
		DisplayOnly;
		Length = "02";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "STB4";
		SType = "Text";
		Label = "Sub-table 4";
	}

	IN MIR-EFF-DT-T[50] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Effective Date";
	}

	IN MIR-INIT-DEDBL-UNITS-T[50] 
	{
		DisplayOnly;
		Length = "4";
		Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "BNFT-AMT-CALC-CD";
	}

	IN MIR-MIN-HOSP-UNITS-T[50] 
	{
		DisplayOnly;
		Length = "4";
		Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Minimum Hospitalisation Units";
	}

	IN MIR-MAX-CLM-UNITS-T[50] 
	{
		DisplayOnly;
		Length = "4";
		Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Maximum Claim Units";
	}

	IN MIR-MAX-RIDER-UNITS-T[50] 
	{
		DisplayOnly;
		Length = "4";
		Decimals = "0";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = " Maximum Rider Units";
	}
}
