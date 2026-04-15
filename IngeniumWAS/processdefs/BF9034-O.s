# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

S-STEP BF9034-O
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

	INOUT MIR-UWRT-TBL-TYP-CD 
	{
		Key;
		Length = "5";
		Decimals = "0";
		CodeSource = "EDIT";
		CodeType = "UWRT";
		SType = "Text";
		Label = "Table Type";
	}

	INOUT MIR-UWRT-MAX-AGE 
	{
		Key;
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
		SType = "Text";
		Label = "Sex";
	}

	INOUT MIR-UWRT-UW-TBL-RNG-1-QTY 
	{
		Key;
		Length = "4";
		Decimals = "1";
		SType = "Number";
                Signed;
		DefaultConstant = "-999";
		Label = "Range 1 Maximum";
	}

	INOUT MIR-UWRT-UW-TBL-RNG-2-QTY 
	{
		Key;
		Length = "4";
		Decimals = "1";
		SType = "Number";
                Signed;
		DefaultConstant = "-999";
		Label = "Range 2 Maximum";
	}

	IN MIR-UWRT-TBL-TYP-CD-T[20] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table20";
		Index = "1";
		SType = "Text";
		Label = "Table Type";
	}

	IN MIR-UWRT-MAX-AGE-T[20] 
	{
		DisplayOnly;
		Length = "3";
		FieldGroup = "Table20";
		Index = "1";
		SType = "Text";
		Label = "Maximum Age";
	}

	IN MIR-UWRT-SEX-CD-T[20] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table20";
		Index = "1";
		SType = "Text";
		Label = "Sex";
	}

	IN MIR-UWRT-UW-TBL-RNG-1-QTY-T[20] 
	{
		DisplayOnly;
		Length = "4";
		FieldGroup = "Table20";
		Index = "1";
		SType = "Text";
		Label = "Range 1 Maximum";
	}

	IN MIR-UWRT-UW-TBL-RNG-2-QTY-T[20] 
	{
		DisplayOnly;
		Length = "4";
		FieldGroup = "Table20";
		Index = "1";
		SType = "Text";
		Label = "Range 2 Maximum";
	}

	IN MIR-UWRT-PASS-FAIL-IND-T[20] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table20";
		Index = "1";
		SType = "Text";
		Label = "Pass/Fail";
	}

	IN MIR-UWRT-SCORE-NUM-T[20] 
	{
		DisplayOnly;
		Length = "3";
		FieldGroup = "Table20";
		Index = "1";
		SType = "Text";
		Label = "Score:";
	}


	IN MIR-UWRT-TBL-TYP-CD-H[20] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table20";
		Index = "1";
		SType = "Text";
		Label = "Table Type";
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
        
}
