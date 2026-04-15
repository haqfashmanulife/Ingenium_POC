# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

S-STEP BF9675-O
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

	IN MIR-CLI-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Client ID";
	}

	IN MIR-CLIM-MORAL-RISK-CD 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "MORAL";
		SType = "Text";
		Label = "Client Moral Risk Category";
	}

	IN MIR-CLIM-PREV-UPDT-USER-ID 
	{
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Last Updated By";
	}

	IN MIR-CLIM-PREV-UPDT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Date Updated";
	}
}
