#*******************************************************************************
#*  Component:   BF9933-I.s                                                    *
#*  Description: Adjudicator ID List                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  EN000388  CTS      INITIAL VERSION                                         *
#*                                                                             *
#*******************************************************************************


S-STEP BF9934-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		FocusField = "MIR-BR-ID";
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

	INOUT MIR-SO-ID
	{
		Key;
		Label = "SO";
		Length = "5";
		SType = "Text";
	}

	INOUT MIR-BR-ID
	{
		Key;
		Label = "RO";
		Length = "5";
		SType = "Text";
	}

}
