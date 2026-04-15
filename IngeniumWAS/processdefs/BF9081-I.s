
#*******************************************************************************
#*  Component:   BF9081-I.s                                                    *
#*  Description: Benefit Category-Name Table (CQBC) Create step                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395    CTS    Initial Version                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9081-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
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

	INOUT MIR-BNFT-NM-ID
	{
		Key;
		Mandatory;
		CodeSource = "EDIT";
		CodeType = "BENNM";
		Label = "Benefit Name";
		Length = "05";
		SType = "Selection";
	}

	INOUT MIR-BNFT-CAT-CD
	{
		Key;
		Mandatory;
		CodeSource = "EDIT";
		CodeType = "BNCAT";
		Label = "Benefit Category";
		Length = "05";
		SType = "Selection";
	}
}
