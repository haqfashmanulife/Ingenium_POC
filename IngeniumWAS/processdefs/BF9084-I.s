#*******************************************************************************
#*  Component:   BF9084-I.s                                                    *
#*  Description: Benefit CATEGORY-NAME Table (CQBC) List step                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9084-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		FocusField = "MIR-BNFT-CAT-CD";
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


}
