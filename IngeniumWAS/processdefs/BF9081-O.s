
#*******************************************************************************
#*  Component:   BF9081-O.s                                                    *
#*  Description: Benefit Category-Name Table (CQBC) Create step                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395    CTS    Initial Version                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9081-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
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

	IN MIR-BNFT-CAT-CD 
	{
		CodeSource = "EDIT";
		CodeType = "BNCAT";
		DisplayOnly;
		Key;
		Label = "Benefit Category";
		Length = "05";
		SType = "Text";
	}
}
