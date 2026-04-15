#******************************************************************************
#*  Component:   BF9831-I.s                                                    *
#*  Description: Question Description Create Screen                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS    Initial Version                                             *
#*  AFF024  CTS    Fix for Unable to retrieve the value of the session variable*
#*  AFU013  CTS    Change for user type flow                                   *
#*                                                                             *
#*******************************************************************************

S-STEP BF9831u-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Create";
		FocusField = "MIR-USER-TYP-CD";
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
#AFF024                DefaultSession = "MIR-QSTN-ID";
	}

	INOUT MIR-MAJ-QSTN-IND
	{
		Label = "Major Question Indicator";
		Length = "01";
		SType = "Hidden";
	}

	INOUT MIR-USER-TYP-CD
	{
		CodeSource = "DataModel";
		CodeType = "USER-TYP-CD";
		Key;
		Label = "User Type";
		Length = "03";
#AFU013 CHANGES START
#          	Mandatory;
#AFU013 CHANGES END
		SType = "Selection";
	}

	INOUT MIR-HID-QSTN-ID
	{
		Key;
		Length = "09";
		SType = "Hidden";
	}
}
