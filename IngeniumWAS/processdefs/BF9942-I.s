#*******************************************************************************
#*  Component:   BF9942-I.s                                                    *
#*  Description: Question Rule Update Input Screen                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*  AFU015  CTS    Change to increase the length of question description to 200*
#*                                                                             *
#*******************************************************************************
S-STEP BF9942-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		FocusField = "MIR-YES-ACTV-TYP-CD";
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

	IN MIR-MAJ-QSTN-ID 
	{
		DisplayOnly;
		Key;
		Label = "Major Question ID";
		Length = "09";
		SType = "Text";
	}

	IN MIR-PRNT-QSTN-ID 
	{
		DisplayOnly;
		Key;
		Label = "Parent Question ID";
		Length = "09";
		SType = "Text";
	}

	IN MIR-QSTN-ID 
	{
		DisplayOnly;
		Key;
		Label = "Question ID";
		Length = "09";
		SType = "Text";
	}

	IN MIR-HID-USER-TYP-CD 
	{
		CodeSource = "DataModel";
		CodeType = "USER-TYP-CD";
		DisplayOnly;
		Key;
		Label = "User Type";
		Length = "03";
		SType = "Hidden";
	}

	IN MIR-QUES-DESC
	{
		DisplayOnly;
		Label = "Question Description";
#AFU015 CHANGES START
#               Length = "100";
                Length = "200";
#AFU015 CHANGES END
		SType = "Text";
	}

	INOUT MIR-YES-ACTV-TYP-CD
	{
		CodeSource = "DataModel";
		CodeType = "ACTV-TYP-CD";
		Label = "Action";
		Length = "05";
		SType = "Selection";
	}

	INOUT MIR-YES-ACTV-ID
	{
		Label = "Resultant";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-NO-ACTV-TYP-CD
	{
		CodeSource = "DataModel";
		CodeType = "ACTV-TYP-CD";
		Label = "Action";
		Length = "05";
		SType = "Selection";
	}

	INOUT MIR-NO-ACTV-ID
	{
		Label = "Resultant";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-UNKNWN-ACTV-TYP-CD
	{
		CodeSource = "DataModel";
		CodeType = "ACTV-TYP-CD";
		Label = "Action";
		Length = "05";
		SType = "Selection";
	}

	INOUT MIR-UNKNWN-ACTV-ID
	{
		Label = "Resultant";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-BLNK-ACTV-TYP-CD
	{
		CodeSource = "DataModel";
		CodeType = "ACTV-TYP-CD";
                CodeSubType = "BLNK";
		Label = "Action";
		Length = "05";
		SType = "Selection";
	}

	INOUT MIR-BLNK-ACTV-ID
	{
		Label = "Resultant";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-HID-LVL-NUM
	{
		Length = "03";
		SType = "Hidden";
	}
}
