#*******************************************************************************
#*  Component:   BF9352-O.s                                                    *
#*  Description: Major Question Update                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*  AFU015  CTS    Change to increase the length of question description to 200*
#*                                                                             *
#*******************************************************************************

S-STEP BF9352-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
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

	IN MIR-INCID-TYP-CD 
	{
		DisplayOnly;
		Key;
		Label = "Incident Type";
		Length = "01";
                CodeSource = "DataModel";
                CodeType = "QSTN-INCID-TYP-CD";
		SType = "Text";
	}

	INOUT MIR-BNFT-TYP-CD 
	{
		DisplayOnly;
		Label;
		Length = "02";
		SType = "YesNoUnanswered";
	}

	IN MIR-BNFT-CAT-CD 
	{
		DisplayOnly;
		Label = "Benefit Category";
		Length = "05";
                CodeSource = "EDIT";
                CodeType = "BNCAT";
		SType = "Text";
	}

	IN MIR-BNFT-NM-ID 
	{
		DisplayOnly;
		Label = "Benefit Name";
		Length = "05";
                CodeSource = "EDIT";
                CodeType = "BENNM";
		SType = "Text";
	}

	IN MIR-DIS-TYP-CD 
	{
		DisplayOnly;
		Label;
		Length = "02";
		SType = "YesNoUnanswered";
	}

	IN MIR-DIS-MEDC-ID 
	{
		DisplayOnly;
		Label = "Code";
		Length = "10";
		SType = "Text";
	}

	IN MIR-DIS-GRP-MEDC-ID 
	{
		DisplayOnly;
		Label = "Major Code";
		Length = "10";
		SType = "Text";
	}

	IN MIR-DIS-MEDC-CAT-CD 
	{
		DisplayOnly;
		Label = "Category";
		Length = "05";
                CodeSource = "DataModel";
                CodeType = "MEDIC-CAT-CD";
		SType = "Text";
	}

	IN MIR-SUR-TYP-CD 
	{
		DisplayOnly;
		Label;
		Length = "02";
		SType = "YesNoUnanswered";
	}

	IN MIR-SUR-MEDC-ID 
	{
		DisplayOnly;
		Label = "Code";
		Length = "10";
		SType = "Text";
	}

	IN MIR-SUR-GRP-MEDC-ID 
	{
		DisplayOnly;
		Label = "Major Code";
		Length = "10";
		SType = "Text";
	}

	IN MIR-SUR-MEDC-CAT-CD 
	{
		DisplayOnly;
		Label = "Category";
		Length = "05";
                CodeSource = "DataModel";
                CodeType = "MEDIC-CAT-CD";
		SType = "Text";
	}

	IN MIR-HID-QSTN-DTRMN-ID 
	{
		DisplayOnly;
		Key;
		Label;
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-QSTN-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label;
		Length = "09";
		SType = "Text";
	}

	IN MIR-QSTN-DESC-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label;
#AFU015 CHANGES START
#               Length = "100";
                Length = "200";
#AFU015 CHANGES END

		SType = "Text";
	}
}
