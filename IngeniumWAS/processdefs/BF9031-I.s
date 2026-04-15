# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

S-STEP BF9031-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
		Type = "Input";
		FocusField = "MIR-UWRT-TBL-TYP-CD";
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

	INOUT MIR-UWRT-TBL-TYP-CD
	{
		Key;
		Mandatory;
		Length = "5";
		Decimals = "0";
		CodeSource = "EDIT";
		CodeType = "UWRT";
		SType = "Selection";
		Label = "Table Type";
	}

	INOUT MIR-UWRT-MAX-AGE
	{
		Key;
		Mandatory;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Maximum Age";
	}

	INOUT MIR-UWRT-SEX-CD
	{
		Key;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "RAT-STD-SEX-CD";
		SType = "Selection";
		Label = "Sex";
	}

	INOUT MIR-UWRT-UW-TBL-RNG-1-QTY
	{
		Key;
		Mandatory;
		Length = "4";
		Decimals = "1";
		SType = "Number";
                Signed;
		Label = "Range 1 Maximum";
	}

	INOUT MIR-UWRT-UW-TBL-RNG-2-QTY
	{
		Key;
		Length = "4";
		Decimals = "1";
		SType = "Number";
                Signed;
		Label = "Range 2 Maximum";
	}
}
