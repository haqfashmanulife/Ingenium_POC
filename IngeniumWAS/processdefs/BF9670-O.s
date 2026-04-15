# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

S-STEP BF9670-O
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

	IN MIR-FTXT-TEXT-KEY 
	{
		Key;
		DisplayOnly;
		Length = "20";
		SType = "Text";
		Label = "Free Format Text Key";
	}

	IN MIR-FTXT-TEXT-TYP-CD 
	{
		Key;
		DisplayOnly;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "FTXT-TEXT-TYP-CD";
		SType = "Text";
		Label = "Free Format Text Type";
	}

	IN MIR-FTXT-TEXT-SEQ-NBR 
	{
		Key;
		DisplayOnly;
		Length = "4";
		SType = "Number";
		Label = "Free Format Text Sequence Number";
	}

	IN MIR-FTXT-CMNT-INFO
	{
		DisplayOnly;
		Length = "500";
		SType = "Text";
		Label = "Free Format Text";
	}

	IN MIR-PREV-UPDT-USER-ID 
	{
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Last Updated By";
	}

	IN MIR-PREV-UPDT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Date Updated";
	}
}
