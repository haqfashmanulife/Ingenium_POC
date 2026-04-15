
#*******************************************************************************
#*  Component:   BF9931-I.s                                                    *
#*  Description: Adjudicator ID Create                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release      Description                                          *
#*  EN000388   CTS      INITIAL VERSION                                        *
#*                                                                             *
#*******************************************************************************

S-STEP BF9931-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
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

	INOUT MIR-BR-ID
	{
		Key;
		Label = "RO";
		Length = "5";
		Mandatory;
		SType = "Text";
	}

	INOUT MIR-SO-ID
	{
		Key;
		Label = "SO";
		Length = "5";
		Mandatory;
		SType = "Text";
	}
}
