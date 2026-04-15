# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

S-STEP BF9020-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
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

	IN MIR-CLI-ADDR-TYP-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "ADTYP";
		SType = "Text";
		Label = "Address Type";
	}

	IN MIR-CLI-ID 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Client Number";
	}

	IN MIR-DV-CLI-NM 
	{
		DisplayOnly;
		Length = "75";
		SType = "Text";
		Label = "Client Name";
	}
}
