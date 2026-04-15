
#*******************************************************************************
#*  Component:   BF9900-O.s                                                    *
#*  Description: Question Description Inquiry Screen                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS    Initial Version                                             *
#*  AFU015  CTS    Change to increase the length of question description to 200*
#*                                                                             *
#*******************************************************************************

S-STEP BF9900-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Inquiry";
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

	IN MIR-QSTN-ID 
	{
		DisplayOnly;
		Key;
		Label = "Question ID";
		Length = "09";
		SType = "Text";
	}

	IN MIR-MAJ-QSTN-IND 
	{
		DisplayOnly;
		Label = "Major Question Indicator";
		Length = "01";
		SType = "Indicator";
	}

	IN MIR-USER-TYP-CD 
	{
		CodeSource = "DataModel";
		CodeType = "USER-TYP-CD";
		DisplayOnly;
		Key;
		Label = "User Type";
		Length = "03";
		SType = "Text";
	}

	IN MIR-QSTN-DESC-TXT 
	{
		DisplayOnly;
		Label = "Question Description";
#AFU015 CHANGES START
#               Length = "100";
                Length = "200";
#AFU015 CHANGES END
		SType = "Text";
	}
}
