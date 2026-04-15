#*******************************************************************************
#*  Component:   BF9933-O.s                                                    *
#*  Description: Adjudicator ID List                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  EN000388  CTS      INITIAL VERSION                                         *
#*                                                                             *
#*******************************************************************************



S-STEP BF9934-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
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
	
	OUT index
	{
		SType = "Hidden";
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

 	IN MIR-ADJ-USER-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Adjudicator User ID";
		Length = "8";
		SType = "Text";
	}

	IN MIR-BR-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "RO";
		Length = "5";
		SType = "Text";
	}

	IN MIR-SO-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "SO";
		Length = "5";
		SType = "Text";
	}

}
