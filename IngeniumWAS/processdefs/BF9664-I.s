# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

S-STEP BF9664-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Input";
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

	INOUT MIR-PLAN-ID
	{
		Key;
		Mandatory;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Selection";
		Label = "Plan Name";
	}

	INOUT MIR-BNFT-NM-ID
	{
		Key;
		Mandatory;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "BENNM";
		SType = "Selection";
		Label = "Benefit Name";
	}

	INOUT MIR-STBL-2-CD
	{
		Key;
		Mandatory;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "STB2";
		SType = "Selection";
		Label = "Sub-table 2";
	}

	INOUT MIR-STBL-4-CD
	{
		Key;
		Mandatory;
		Length = "02";
		CodeSource = "EDIT";
		CodeType = "STB4";
		SType = "Selection";
		Label = "Sub-table 4";
	}

}
