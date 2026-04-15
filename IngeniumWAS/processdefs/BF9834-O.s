#*******************************************************************************
#*  Component:   BF9834-O.s                                                    *
#*  Description: Question Description List Screen                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS      Initial Version                                           *
#*  AFU015  CTS    Change to increase the length of question description to 200*
#*                                                                             *
#*******************************************************************************


S-STEP BF9834-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
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
	
	OUT index
	{
		SType = "Hidden";
	}

	INOUT MIR-QSTN-ID 
	{
		Key;
		Label = "Question ID";
		Length = "09";
		SType = "Text";
	}

	IN MIR-MAJ-QSTN-IND 
	{
		Length = "01";
		SType = "Hidden";
	}

	IN MIR-USER-TYP-CD 
	{
		Key;
		Length = "03";
		SType = "Hidden";
	}

	IN MIR-QSTN-ID-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Key;
		Label = "Question ID";
		Length = "09";
		SType = "Text";
	}

	IN MIR-MAJ-QSTN-IND-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Key;
		Label = "Major Question Indicator";
		Length = "01";
		SType = "Text";
	}

	IN MIR-USER-TYP-CD-T[30] 
	{
		CodeSource = "DataModel";
		CodeType = "USER-TYP-CD";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Key;
		Label = "User Type";
		Length = "03";
		SType = "Text";
	}

	IN MIR-QSTN-DESC-TXT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Question Description";
#AFU015 CHANGES START
#               Length = "100";
                Length = "200";
#AFU015 CHANGES END
		SType = "Text";
	}
}
