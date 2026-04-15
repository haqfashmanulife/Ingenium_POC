# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

S-STEP BF9022-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		Type = "Input";
		FocusField = "MIR-CLI-ADDR-TYP-CD";
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

	INOUT MIR-CLI-ADDR-TYP-CD
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "ADTYP";
		SType = "Selection";
		Label = "Address Type";
	}

	INOUT MIR-CLI-ID
	{
		Mandatory;
		Length = "10";
		SType = "Text";
		Label = "Client Number";
	}

	IN MIR-SO-ID 
	{
		Key;
		DisplayOnly;
		Length = "5";
		CodeSource = "XTAB";
		CodeType = "SALE";
		SType = "Text";
		Label = "Sales office Number";
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
