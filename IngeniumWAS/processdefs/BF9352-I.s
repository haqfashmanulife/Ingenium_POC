#*******************************************************************************
#*  Component:   BF9352-I.s                                                    *
#*  Description: Major Question Update                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9352-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		FocusField = "MIR-INCID-TYP-CD";
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

	INOUT MIR-BNFT-CAT-CD
	{
		DisplayOnly;
		Label = "Benefit Category";
		Length = "05";
                CodeSource = "EDIT";
                CodeType = "BNCAT";
		SType = "Text";
	}

	INOUT MIR-BNFT-NM-ID
	{
		DisplayOnly;
		Label = "Benefit Name";
		Length = "05";
                CodeSource = "EDIT";
                CodeType = "BENNM";
		SType = "Text";
		SType = "Text";
	}

	INOUT MIR-DIS-TYP-CD
	{
		DisplayOnly;
		Label;
		Length = "02";
		SType = "YesNoUnanswered";
	}

	INOUT MIR-DIS-MEDC-ID
	{
		DisplayOnly;
		Label = "Code";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-DIS-GRP-MEDC-ID
	{
		DisplayOnly;
		Label = "Major Code";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-DIS-MEDC-CAT-CD
	{
		DisplayOnly;
		Label = "Category";
		Length = "05";
                CodeSource = "DataModel";
                CodeType = "MEDIC-CAT-CD";
		SType = "Text";
	}

	INOUT MIR-SUR-TYP-CD
	{
		DisplayOnly;
		Label;
		Length = "02";
		SType = "YesNoUnanswered";
	}

	INOUT MIR-SUR-MEDC-ID
	{
		DisplayOnly;
		Label = "Code";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-SUR-GRP-MEDC-ID
	{
		DisplayOnly;
		Label = "Major Code";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-SUR-MEDC-CAT-CD
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

	INOUT MIR-QSTN-ID-T[50]
	{
		FieldGroup = "Table1";
		Index = "1";
		Label;
		Length = "09";
		SType = "Text";
	}

}
