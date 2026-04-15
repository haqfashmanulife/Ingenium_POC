#*******************************************************************************
#*  Component:   BF9084-O.s                                                    *
#*  Description: Benefit CATEGORY-NAME Table (CQBC) List step                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9084-O
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

	INOUT MIR-BNFT-CAT-CD 
	{
		CodeSource = "EDIT";
		CodeType = "BNCAT";
		Key;
		Label = "Benefit Category";
		Length = "05";
		SType = "Selection";
	}

	INOUT MIR-BNFT-NM-ID 
	{
		CodeSource = "EDIT";
		CodeType = "BENNM";
		Key;
		Label = "Benefit Name";
		Length = "05";
		SType = "Selection";
	}


	IN MIR-BNFT-CAT-CD-T[50] 
	{
		CodeSource = "EDIT";
		CodeType = "BNCAT";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Benefit Category";
		Length = "05";
		SType = "Text";
	}

	IN MIR-BNFT-NM-ID-T[50] 
	{
		CodeSource = "EDIT";
		CodeType = "BENNM";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Benefit Name";
		Length = "05";
		SType = "Text";
	}

}
