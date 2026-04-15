
#*******************************************************************************
#*  Component:   BF9900-I.s                                                    *
#*  Description: QSTNtion Description Inquiry Screen                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS    Initial Version                                             *
#*                                                                             *
#*******************************************************************************

S-STEP BF9900-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Inquiry";
		FocusField = "MIR-QSTN-ID";
		FocusFrame = "ContentFrame";
		Type = "Input";
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

	INOUT MIR-QSTN-ID
	{
		Key;
		Label = "QSTNtion ID";
		Length = "09";
		SType = "Text";
	}

	INOUT MIR-MAJ-QSTN-IND
	{
		Label = "Major Question Indicator";
		Length = "01";
		SType = "Indicator";
	}

	INOUT MIR-USER-TYP-CD
	{
		CodeSource = "DataModel";
		CodeType = "USER-TYP-CD";
		Key;
		Label = "User Type";
		Length = "03";
		SType = "Selection";
	}
}
