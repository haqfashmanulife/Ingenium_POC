#*******************************************************************************
#*  Component:   BF9944-I.s                                                    *
#*  Description: Question Rule List Input Screen                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*                                                                             *
#*******************************************************************************
S-STEP BF9944-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		FocusField = "MIR-MAJ-QSTN-ID";
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

	INOUT MIR-MAJ-QSTN-ID
	{
		Key;
		Label = "Major Question ID";
		Length = "09";
		SType = "Text";
	}

	INOUT MIR-PRNT-QSTN-ID
	{
		Key;
		Label = "Parent Question ID";
		Length = "09";
		SType = "Text";
	}

	INOUT MIR-QSTN-ID
	{
		Key;
		Label = "Question ID";
		Length = "09";
		SType = "Text";
	}

	INOUT MIR-HID-USER-TYP-CD
	{
		CodeSource = "DataModel";
		CodeType = "USER-TYP-CD";
		Key;
		Label = "User Type";
		Length = "03";
		SType = "Hidden";
	}
}
