# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

S-STEP BF9677-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		Type = "Input";
		FocusField = "MIR-CLI-ID";
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

	IN MIR-CLI-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Client ID";
	}

	INOUT MIR-CLIM-MORAL-RISK-CD
	{
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "MORAL";
		SType = "Selection";
		Label = "Client Moral Risk Category";
	}

	INOUT MIR-CLIM-PREV-UPDT-USER-ID
	{
		Length = "8";
		SType = "Text";
		Label = "Last Updated By";
	}

	INOUT MIR-CLIM-PREV-UPDT-DT
	{
		Length = "10";
		SType = "Text";
		Label = "Date Updated";
	}
}
