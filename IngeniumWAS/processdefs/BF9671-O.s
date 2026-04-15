# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

S-STEP BF9671-O
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

	INOUT MIR-FTXT-TEXT-KEY 
	{
		Key;
		DisplayOnly;
		Length = "20";
		SType = "Text";
		Label = "Free Format Text Key";
	}

	INOUT MIR-FTXT-TEXT-TYP-CD 
	{
		Key;
		DisplayOnly;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "FTXT-TEXT-TYP-CD";
		SType = "Text";
		Label = "Free Format Text Type";
	}

	INOUT MIR-FTXT-TEXT-SEQ-NBR 
	{
		Key;
		DisplayOnly;
		Length = "4";
		SType = "Number";
		Label = "Free Format Text Sequence Number";
	}
}
