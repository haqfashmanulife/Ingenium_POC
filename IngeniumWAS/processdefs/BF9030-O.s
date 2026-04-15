# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

S-STEP BF9030-O
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

	IN MIR-UWRT-TBL-TYP-CD 
	{
		Key;
		DisplayOnly;
		Length = "5";
		Decimals = "0";
		CodeSource = "EDIT";
		CodeType = "UWRT";
		SType = "Text";
		Label = "Table Type";
	}

	IN MIR-UWRT-MAX-AGE 
	{
		Key;
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Maximum Age";
	}

	IN MIR-UWRT-SEX-CD 
	{
		Key;
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "RAT-STD-SEX-CD";
		SType = "Text";
		Label = "Sex";
	}

	IN MIR-UWRT-UW-TBL-RNG-1-QTY 
	{
		Key;
		DisplayOnly;
		Length = "4";
		Decimals = "1";
		SType = "Number";
                Signed;
		Label = "Range 1 Maximum";
	}

	IN MIR-UWRT-UW-TBL-RNG-2-QTY 
	{
		Key;
		DisplayOnly;
		Length = "4";
		Decimals = "1";
		SType = "Number";
                Signed;
		Label = "Range 2 Maximum";
	}

	IN MIR-DV-UW-TBL-RNG1 
	{
		DisplayOnly;
		Length = "15";
		SType = "Text";
		Label = "XXXXXXrg1";
	}

	IN MIR-DV-UW-TBL-RNG2 
	{
		DisplayOnly;
		Length = "15";
		SType = "Text";
		Label = "XXXXXXrg2";
	}

	IN MIR-UWRT-PASS-FAIL-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "Pass/Fail";
	}

	IN MIR-UWRT-SCORE-NUM 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
                Signed;
		Label = "Score";
	}
}
