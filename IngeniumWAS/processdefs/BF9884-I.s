# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9884-I.s                                                    *
#*  Description: Medical Category List - Input                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9884-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Input";
		FocusField = "MIR-MCAT-TYP-CD";
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

	INOUT MIR-MCAT-TYP-CD
	{
		Key;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "MCAT-TYP-CD";
		SType = "Selection";
		Label = "Category Type";
	}

	INOUT MIR-MEDIC-CD
	{
		Key;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CD";
		SType = "Selection";
		Label = "Disease/Surgery";
	}

	INOUT MIR-MEDIC-CAT-CD
	{
		Key;
		Length = "5";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CAT-CD";
		SType = "Selection";
		Label = "Category";
	}
}
