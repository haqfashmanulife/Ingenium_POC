#*******************************************************************************
#*  Component:   BF9930-O.s                                                    *
#*  Description: Adjudicator ID Inquiry                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#      Release     Description                                          *
#*  EN000388    CTS      INITIAL VERSION                                       *
#*                                                                             *
#*******************************************************************************
S-STEP BF9930-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Inquiry";
		DelEmptyRows;
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
		Type = "Output";
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

	IN MIR-ADJ-USER-ID 
	{
		DisplayOnly;
		Label = "Adjudicator User ID";
		Length = "8";
		SType = "Text";
	}
}
