# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

S-STEP BF9024-O
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

	IN MIR-SO-ID-T[12] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table12";
		Index = "1";
		CodeSource = "XTAB";
		CodeType = "SALE";
		SType = "Text";
		Label = "Sales Office Number";
	}

	IN MIR-BR-ID-T[12] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table12";
		Index = "1";
		CodeSource = "XTAB";
		CodeType = "BRCH";
		SType = "Text";
		Label = "Branch Number";
	}

	IN MIR-CLI-ADDR-TYP-CD-T[12] 
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table12";
		Index = "1";
		CodeSource = "EDIT";
		CodeType = "ADTYP";
		SType = "Text";
		Label = "Address Type";
	}

	IN MIR-CLI-ID-T[12] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table12";
		Index = "1";
		SType = "Text";
		Label = "Client Number";
	}
}
