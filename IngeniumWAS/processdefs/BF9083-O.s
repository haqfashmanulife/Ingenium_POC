
#*******************************************************************************
#*  Component:   BF9083-O.s                                                    *
#*  Description: Benefit CATEGORY-NAME Table (CQBC) Delete step                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395    CTS    Initial Version                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9083-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Delete";
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

	IN MIR-BNFT-NM-ID 
	{
		CodeSource = "EDIT";
		CodeType = "BENNM";
		DisplayOnly;
		Key;
		Label = "Benefit Name";
		Length = "05";
		SType = "Text";
	}

	IN MIR-BNFT-CAT-ID 
	{
		CodeSource = "EDIT";
		CodeType = "BNCAT";
		DisplayOnly;
		Key;
		Label = "Benifit Category";
		Length = "05";
		SType = "Text";
	}
}
