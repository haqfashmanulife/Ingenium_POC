# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9869-O.s                                                    *
#*  Description: BENM Discharge Multiplier List - Output                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9869-O
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

	INOUT MIR-BENM-MULTR-ID 
	{
		Key;
		Length = "10";
		SType = "Text";
		Label = "Discharge Multiplier Code";
	}

	IN MIR-BENM-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Multiplier Type";
	}

	IN MIR-MULTR-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Multiplier Category";
	}
	
	IN MIR-BENM-MULTR-ID-T[100] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Benefir Multiplier Code";
	}

	IN MIR-BENM-MULTR-FCT-T[100] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Multiplier Amount";
	}

	IN MIR-BENM-DUR-T[100] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Number";
		Label = "Duration";
	}

}
