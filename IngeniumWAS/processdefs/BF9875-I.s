# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9875-I.s                                                    *
#*  Description: Associated Disease/Surgery List Screen - Input                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9875-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Input";
		FocusField = "MIR-MEDIC-CD";
		FocusFrame = "ContentFrame";
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

	INOUT MIR-MEDIC-CD
	{
		Key;
		Mandatory;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CD";
		SType = "Selection";
		Label = "Medical Type";
	}

	INOUT MIR-GRP-MEDC-ID
	{
		Key;
		Mandatory;
		Length = "10";
		SType = "Text";
		Label = "Major Code";
	}

	INOUT MIR-MEDIC-CAT-CD
	{
		Key;
		Length = "5";
		CodeSource = "DataModel";
		CodeType = "DV-SURG-BNFT-CAT-CD";
		SType = "Selection";
		Label = "Category Name";
	}

}
