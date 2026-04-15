# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9884-O.s                                                    *
#*  Description: Medical Category List - Output                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9884-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
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
	
	OUT index
	{
		SType = "Hidden";
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

	IN MIR-MCAT-TYP-CD-T[100] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MCAT-TYP-CD";
		SType = "Text";
		Label = "Category Type";
	}

	IN MIR-MEDIC-CD-T[100] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CD";
		SType = "Text";
		Label = "Disease/Surgery";
	}

	IN MIR-MEDIC-CAT-CD-T[100] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CAT-CD";
		SType = "Text";
		Label = "Category";
	}

	IN MIR-MEDC-TYP-CD-T[100] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MEDC-TYP-CD";
		SType = "Text";
		Label = "Defined By";
	}
}
