#*******************************************************************************
#*  Component:   BF9354-I.s                                                    *
#*  Description: Major Question List                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS   Initial Version                                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9354-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
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

	INOUT MIR-INCID-TYP-CD
	{
		CodeSource = "DataModel";
		CodeType = "QSTN-INCID-TYP-CD";
		Key;
		Label = "Incident Type";
		Length = "01";
		SType = "Selection";
	}

	INOUT MIR-BNFT-TYP-CD
	{
		Label;
		Length = "02";
		SType = "YesNoUnanswered";
	}

	INOUT MIR-BNFT-CAT-CD
	{
		CodeSource = "EDIT";
		CodeType = "BNCAT";
		Label = "Benefit Category";
		Length = "05";
		SType = "Selection";
	}

	INOUT MIR-BNFT-NM-ID
	{
		CodeSource = "EDIT";
		CodeType = "BENNM";
		Label = "Benefit Name";
		Length = "05";
		SType = "Selection";
	}

	INOUT MIR-DIS-TYP-CD
	{
		Label;
		Length = "02";
		SType = "YesNoUnanswered";
	}

	INOUT MIR-DIS-MEDC-ID
	{
		Label = "Code";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-DIS-GRP-MEDC-ID
	{
		Label = "Major Code";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-DIS-MEDC-CAT-CD
	{
		Label = "Category";
		Length = "05";
                CodeSource = "DataModel";
                CodeType = "MEDIC-CAT-CD";
		SType = "Selection";
	}

	INOUT MIR-SUR-TYP-CD
	{
		Label;
		Length = "02";
		SType = "YesNoUnanswered";
	}

	INOUT MIR-SUR-MEDC-ID
	{
		Label = "Code";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-SUR-GRP-MEDC-ID
	{
		Label = "Major Code";
		Length = "10";
		SType = "Text";
	}

	INOUT MIR-SUR-MEDC-CAT-CD
	{
		Label = "Category";
		Length = "05";
                CodeSource = "DataModel";
                CodeType = "MEDIC-CAT-CD";
		SType = "Selection";
	}

        INOUT MIR-HID-QSTN-DTRMN-ID
        {
                Length = "10";
                DBTableName = "TCQDR";
                SType = "Hidden";
                Label = "";
        }
}
