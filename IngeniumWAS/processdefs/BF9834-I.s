#*******************************************************************************
#*  Component:   BF9834-I.s                                                    *
#*  Description: Question Description List Screen                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS      Initial Version                                           *
#*                                                                             *
#*******************************************************************************


S-STEP BF9834-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		FocusField = "MIR-QSTN-ID";
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

	INOUT MIR-QSTN-ID
	{
		Key;
		Label = "Question ID";
		Length = "09";
		SType = "Text";
	}

	INOUT MIR-MAJ-QSTN-IND
	{
		Length = "01";
		SType = "Hidden";
	}

	INOUT MIR-USER-TYP-CD
	{
		Key;
		Length = "03";
		SType = "Hidden";
	}
}
