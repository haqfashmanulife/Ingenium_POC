# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9035-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP162A   CTS      OWL SERVER ENHANCEMENTS                                  *
#*******************************************************************************



S-STEP BF9035-O
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
#       MP162A Changes Starts Here
#		SType = "Text";
                SType = "Selection";
#       MP162A  Changes Ends Here   
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
#       MP162A Changes Starts Here
#		SType = "Text";
                SType = "Selection";
#       MP162A  Changes Ends Here                   
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
