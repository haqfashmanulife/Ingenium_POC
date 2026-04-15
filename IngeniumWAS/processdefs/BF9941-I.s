#*******************************************************************************
#*  Component:   BF9941-I.s                                                    *
#*  Description: Question Rule Create Input Screen                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*                                                                             *
#*******************************************************************************
S-STEP BF9941-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
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
		Mandatory;
		SType = "Text";
	}

	INOUT MIR-PRNT-QSTN-ID
	{
		Key;
		Label = "Parent Question ID";
		Length = "09";
		Mandatory;
		SType = "Text";
	}

	INOUT MIR-QSTN-ID
	{
		Key;
		Label = "Question ID";
		Length = "09";
		Mandatory;
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

	INOUT MIR-HID-LVL-NUM
	{
		Length = "03";
		SType = "Hidden";
	}
}
