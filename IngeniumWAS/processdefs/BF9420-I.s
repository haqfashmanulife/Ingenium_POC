# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9420-I.s                                                    *
#*  Description: Input step for Monthly MCL GL Account Balance Inquiry         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M00026  12DEC03  New for this release                                      *
#*******************************************************************************
 
S-STEP BF9420-I
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

	INOUT MIR-FROM-ACCT-YR
	{
		Key;
		Mandatory;
		Length = "4";
		SType = "Year";
		Label = "From Year";
	}

	INOUT MIR-FROM-ACCT-MO
	{
		Key;
		Mandatory;
		Length = "2";
		SType = "Month";
		Label = "From Month";
	}

	INOUT MIR-TO-ACCT-YR
	{
		Key;
		Mandatory;
		Length = "4";
		SType = "Year";
		Label = "To Year";
	}

	INOUT MIR-TO-ACCT-MO
	{
		Key;
		Mandatory;
		Length = "2";
		SType = "Month";
		Label = "To Month";
	}
}
