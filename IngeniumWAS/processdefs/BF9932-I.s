#*******************************************************************************
#*  Component:   BF9932-I.s                                                    *
#*  Description: Adjudicator ID Update                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN000388   CTS     Initial Version                                         *
#*                                                                             *
#*******************************************************************************
S-STEP BF9932-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		FocusField = "MIR-ADJ-USER-ID";
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

	IN MIR-BR-ID 
	{
		DisplayOnly;
		Key;
		Label = "RO";
		Length = "5";
		SType = "Text";
	}

	IN MIR-SO-ID 
	{
		DisplayOnly;
		Key;
		Label = "SO";
		Length = "5";
		SType = "Text";
	}

	INOUT MIR-ADJ-USER-ID
	{
		Label = "Adjudicator User ID";
		Length = "8";
		SType = "Text";
	}
}
