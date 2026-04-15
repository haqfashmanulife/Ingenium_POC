#*******************************************************************************
#*  Component:   BF9944-O.s                                                    *
#*  Description: Question Rule List Output Screen                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*  AFU015  CTS    Change to increase the length of question description to 200*
#*                                                                             *
#*******************************************************************************
S-STEP BF9944-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		DelEmptyRows;
		FocusField = "MIR-MAJ-QSTN-ID";
		FocusFrame = "ContentFrame";
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
	
	OUT index
	{
		SType = "Hidden";
	}

	INOUT MIR-MAJ-QSTN-ID 
	{
		DisplayOnly;
		Key;
		Label = "Major Question ID";
		Length = "09";
		SType = "Text";
	}

	INOUT MIR-PRNT-QSTN-ID 
	{
		DisplayOnly;
		Key;
		Label = "Parent Question ID";
		Length = "09";
		SType = "Text";
	}

	INOUT MIR-QSTN-ID 
	{
		DisplayOnly;
		Key;
		Label = "Question ID";
		Length = "09";
		SType = "Text";
	}

	INOUT MIR-HID-USER-TYP-CD 
	{
		CodeSource = "DataModel";
		CodeType = "USER-TYP-CD";
		DisplayOnly;
		Key;
		Label = "User Type";
		Length = "03";
		SType = "Hidden";
	}

	IN MIR-HID-MAJ-QSTN-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Major Question ID";
		Length = "09";
		SType = "Hidden";
	}

	IN MIR-MAJ-QSTN-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Major Question ID";
		Length = "09";
		SType = "Text";
	}

	IN MIR-PRNT-QSTN-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Parent Question ID";
		Length = "09";
		SType = "Text";
	}

	IN MIR-RESP-TYP-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Trigger";
		Length = "10";
		SType = "Text";
	}


        IN MIR-ACTV-CD-T[50]
        {
		DisplayOnly;
                CodeSource = "DataModel";
                CodeType = "ACTV-TYP-CD";
                FieldGroup = "Table1";
                Index = "1";
                Label = "Action";
                Length = "05";
                SType = "Text";
        }

	IN MIR-ACTV-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Resultant";
		Length = "10";
		SType = "Text";
	}

	IN MIR-ACTV-DESC-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Description";
#AFU015 CHANGES START
#               Length = "100";
                Length = "200";
#AFU015 CHANGES END
		SType = "Text";
	}

	IN MIR-HID-LVL-NUM-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Length = "03";
		SType = "Hidden";
	}

	IN MIR-HID-USER-TYP-CD-T[50] 
	{
		CodeSource = "DataModel";
		CodeType = "USER-TYP-CD";
		DisplayOnly;
		Length = "03";
		SType = "Hidden";
	}
}
