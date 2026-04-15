#*******************************************************************************
#*  Component:   BF9354-O.s                                                    *
#*  Description: Major Question List                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9354-O
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

	IN MIR-INCID-TYP-CD 
	{
		CodeSource = "DataModel";
		CodeType = "QSTN-INCID-TYP-CD";
		DisplayOnly;
		Key;
		Label = "Incident Type";
		Length = "01";
		SType = "Text";
	}

	IN MIR-BNFT-TYP-CD 
	{
		DisplayOnly;
		Label;
		Length = "02";
		SType = "YesNoUnanswered";
	}

	IN MIR-BNFT-CAT-CD 
	{
		CodeSource = "EDIT";
		CodeType = "BNCAT";
		DisplayOnly;
		Label = "Benefit Category";
		Length = "05";
		SType = "Text";
	}

	IN MIR-BNFT-NM-ID 
	{
		CodeSource = "EDIT";
		CodeType = "BENNM";
		DisplayOnly;
		Label = "Benefit Name";
		Length = "05";
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

	IN MIR-HID-INCID-TYP-CD 
	{
		CodeSource = "DataModel";
		CodeType = "QSTN-INCID-TYP-CD";
		DisplayOnly;
		Key;
		Label = "Incident Type";
		Length = "01";
		SType = "Hidden";
	}

	IN MIR-HID-BNFT-CAT-CD 
	{
		CodeSource = "EDIT";
		CodeType = "BNCAT";
		DisplayOnly;
		Label = "Benefit Category";
		Length = "05";
		SType = "Hidden";
	}

	IN MIR-HID-BNFT-NM-ID 
	{
		CodeSource = "EDIT";
		CodeType = "BENNM";
		DisplayOnly;
		Label = "Benefit Name";
		Length = "05";
		SType = "Hidden";
	}

	IN MIR-HID-DIS-MEDC-ID 
	{
		DisplayOnly;
		Label = "Code";
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-HID-DIS-GRP-MEDC-ID 
	{
		DisplayOnly;
		Label = "Major Code";
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-HID-DIS-MEDC-CAT-CD 
	{
		DisplayOnly;
		Label = "Category";
		Length = "05";
                CodeSource = "DataModel";
                CodeType = "MEDIC-CAT-CD";
		SType = "Hidden";
	}

	IN MIR-HID-SUR-MEDC-ID 
	{
		DisplayOnly;
		Label = "Code";
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-HID-SUR-GRP-MEDC-ID 
	{
		DisplayOnly;
		Label = "Major Code";
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-HID-SUR-MEDC-CAT-CD 
	{
		DisplayOnly;
		Label = "Category";
		Length = "05";
                CodeSource = "DataModel";
                CodeType = "MEDIC-CAT-CD";
		SType = "Hidden";
	}

	IN MIR-HID-QSTN-DTRMN-ID
	{
		DisplayOnly;
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-INCID-TYP-CD-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Key;
		Label = "Incident Type";
		Length = "01";
		CodeSource = "DataModel";
		CodeType = "QSTN-INCID-TYP-CD";
		SType = "Text";
	}

	IN MIR-BNFT-CAT-CD-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Benefit Category";
		Length = "05";
		CodeSource = "EDIT";
		CodeType = "BNCAT";
		SType = "Text";
	}

	IN MIR-BNFT-NM-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Benefit Name";
		Length = "05";
		CodeSource = "EDIT";
		CodeType = "BENNM";
		SType = "Text";
	}

	IN MIR-DIS-MEDC-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Disease Code";
		Length = "10";
		SType = "Text";
	}

	IN MIR-DIS-GRP-MEDC-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Disease Major Code";
		Length = "10";
		SType = "Text";
	}

	IN MIR-DIS-MEDC-CAT-CD-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Disease Category";
		Length = "05";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CAT-CD";
		SType = "Text";
	}

	IN MIR-SUR-MEDC-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Surgery Code";
		Length = "10";
		SType = "Text";
	}

	IN MIR-SUR-GRP-MEDC-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Surgery Major Code";
		Length = "10";
		SType = "Text";
	}

	IN MIR-SUR-MEDC-CAT-CD-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Surgery Category";
		Length = "05";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CAT-CD";
		SType = "Text";
	}

	IN MIR-HID-QSTN-DTRMN-ID-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Key;
		Label;
		Length = "10";
		SType = "Hidden";
	}
}
