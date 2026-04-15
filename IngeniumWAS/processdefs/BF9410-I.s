# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9410-I.s                                                    *
#*  Description: Input step for Daily MCL GL Account Balance Inquiry           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M00026  12DEC03  New for this release                                      *
#*******************************************************************************
 
S-STEP BF9410-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		Type = "Input";
		FocusField = "MIR-MCL-ACCT-BASE-ID";
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

	INOUT MIR-MCL-ACCT-BASE-ID
	{
		Key;
		Mandatory;
		Length = "8";
		CodeSource = "EDIT";
		CodeType = "MCLGL";
		SType = "Selection";
		Label = "GL Account #";
	}

	INOUT MIR-OPER-CAT-CD
	{
		Key;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "AFOC";
		SType = "Selection";
		Label = "Operation Category";
	}

	INOUT MIR-ACCT-YR
	{
		Key;
		Mandatory;
		Length = "4";
		SType = "Year";
		Label = "Year";
	}

	INOUT MIR-ACCT-MO
	{
		Key;
		Mandatory;
		Length = "2";
		SType = "Month";
		Label = "Month";
	}
}
