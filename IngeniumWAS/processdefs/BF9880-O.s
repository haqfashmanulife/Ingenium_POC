# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9880-O.s                                                    *
#*  Description: Medical Category Retrieve - Output                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9880-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		Type = "Output";
		DelEmptyRows;
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
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

	IN MIR-MCAT-TYP-CD 
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "MCAT-TYP-CD";
		SType = "Text";
		Label = "Category Type";
	}

	IN MIR-MEDIC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CD";
		SType = "Text";
		Label = "Disease/Surgery";
	}

	IN MIR-MEDC-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MEDC-TYP-CD";
		SType = "Text";
		Label = "Defined By";
	}
}
