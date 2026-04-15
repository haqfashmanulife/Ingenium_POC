# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9882-I.s                                                    *
#*  Description: Medical Category Retrieve Update screen                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9882-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		Type = "Input";
		FocusField = "MIR-MEDIC-CAT-CD";
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

	IN MIR-MEDIC-CAT-CD 
	{
		Key;
		DisplayOnly;
		Length = "5";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CAT-CD";
		SType = "Text";
		Label = "Category";
	}

	INOUT MIR-MCAT-TYP-CD
	{
		Mandatory;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "MCAT-TYP-CD";
		SType = "Selection";
		Label = "Category Type";
	}

	INOUT MIR-MEDIC-CD
	{
		Mandatory;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CD";
		SType = "Selection";
		Label = "Disease/Surgery";
	}

	INOUT MIR-MEDC-TYP-CD
	{
		Mandatory;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MEDC-TYP-CD";
		SType = "Selection";
		Label = "Defined By";
	}
}
