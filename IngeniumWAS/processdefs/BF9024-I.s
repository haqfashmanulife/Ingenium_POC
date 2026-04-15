# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

S-STEP BF9024-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Input";
		FocusField = "MIR-SO-ID";
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

	INOUT MIR-SO-ID
	{
		Key;
		Length = "5";
		CodeSource = "XTAB";
		CodeType = "SALE";
		SType = "Selection";
		Label = "Sales Office Number";
	}

	INOUT MIR-BR-ID
	{
		Key;
		Length = "5";
		CodeSource = "XTAB";
		CodeType = "BRCH";
		SType = "Selection";
		Label = "Branch Number";
	}
}
