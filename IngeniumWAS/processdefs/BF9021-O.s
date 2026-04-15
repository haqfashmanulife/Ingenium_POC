# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

S-STEP BF9021-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
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

	IN MIR-SO-ID 
	{
		Key;
		DisplayOnly;
		Length = "5";
		CodeSource = "XTAB";
		CodeType = "SALE";
		SType = "Text";
		Label = "Sales Office Number";
	}
       
	IN MIR-BR-ID 
	{
		Key;
		DisplayOnly;
		Length = "5";
		CodeSource = "XTAB";
		CodeType = "BRCH";
		SType = "Text";
		Label = "Branch Number";
	}
       
}
