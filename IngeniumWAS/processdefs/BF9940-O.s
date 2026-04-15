#*******************************************************************************
#*  Component:   BF9940-O.s                                                    *
#*  Description: Question Rule Inquiry OutputScreen                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*  AFU015  CTS    Change to increase the length of question description to 200*
#*                                                                             *
#*******************************************************************************
S-STEP BF9940-O
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

	IN MIR-YES-ACTV-TYP-CD 
	{
		CodeSource = "DataModel";
		CodeType = "ACTV-TYP-CD";
		DisplayOnly;
		Label = "Action";
		Length = "05";
		SType = "Text";
	}

	IN MIR-YES-ACTV-ID 
	{
		DisplayOnly;
		Label = "Resultant";
		Length = "10";
		SType = "Text";
	}

	IN MIR-YES-ACTV-DESC 
	{
		DisplayOnly;
		Label = "Resultant Description";
#AFU015 CHANGES START
#               Length = "100";
                Length = "200";
#AFU015 CHANGES END
		SType = "Text";
	}

	IN MIR-NO-ACTV-TYP-CD 
	{
		CodeSource = "DataModel";
		CodeType = "ACTV-TYP-CD";
		DisplayOnly;
		Label = "Action";
		Length = "05";
		SType = "Text";
	}

	IN MIR-NO-ACTV-ID 
	{
		DisplayOnly;
		Label = "Resultant";
		Length = "10";
		SType = "Text";
	}

	IN MIR-NO-ACTV-DESC 
	{
		DisplayOnly;
		Label = "Resultant Description";
#AFU015 CHANGES START
#               Length = "100";
                Length = "200";
#AFU015 CHANGES END
		SType = "Text";
	}

	IN MIR-UNKNWN-ACTV-TYP-CD 
	{
		CodeSource = "DataModel";
		CodeType = "ACTV-TYP-CD";
		DisplayOnly;
		Label = "Action";
		Length = "05";
		SType = "Text";
	}

	IN MIR-UNKNWN-ACTV-ID 
	{
		DisplayOnly;
		Label = "Resultant";
		Length = "10";
		SType = "Text";
	}

	IN MIR-UNKNWN-ACTV-DESC 
	{
		DisplayOnly;
		Label = "Resultant Description";
#AFU015 CHANGES START
#               Length = "100";
                Length = "200";
#AFU015 CHANGES END
		SType = "Text";
	}

	IN MIR-BLNK-ACTV-TYP-CD 
	{
		CodeSource = "DataModel";
		CodeType = "ACTV-TYP-CD";
                CodeSubType = "BLNK";
		DisplayOnly;
		Label = "Action";
		Length = "05";
		SType = "Text";
	}

	IN MIR-BLNK-ACTV-ID 
	{
		DisplayOnly;
		Label = "Resultant";
		Length = "10";
		SType = "Text";
	}

	IN MIR-BLNK-ACTV-DESC 
	{
		DisplayOnly;
		Label = "Resultant Description";
#AFU015 CHANGES START
#               Length = "100";
                Length = "200";
#AFU015 CHANGES END
		SType = "Text";
	}

	IN MIR-HID-LVL-NUM 
	{
		DisplayOnly;
		Length = "03";
		SType = "Hidden";
	}
}
