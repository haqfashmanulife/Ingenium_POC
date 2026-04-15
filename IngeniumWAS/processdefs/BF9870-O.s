# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:12 PM EDT

#*******************************************************************************
#*  Component:   BF9870-O.s                                                    *
#*  Description: Disease/Surgery Major Code Retrieve - Output                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

S-STEP BF9870-O
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

	OUT index
	{
		SType="Hidden";
	}
	
	IN MIR-MEDIC-CD 
	{
		Key;
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CD";
		SType = "Text";
		Label = "Medical Type";
	}

	IN MIR-MEDC-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Major Code";
	}

	IN MIR-MEDC-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Group Medical Type";
	}

	IN MIR-LANG-DESC-1-TXT 
	{
		DisplayOnly;
		Length = "60";
		SType = "Text";
		Label = "Katakana Name";
	}

	IN MIR-LANG-DESC-2-TXT 
	{
		DisplayOnly;
		Length = "60";
		SType = "Text";
		Label = "Kanji Name";
	}

	IN MIR-T1-MEDIC-CAT-CD-T[20] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table1";
		KeyColumn;
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CAT-CD";
		SType = "Text";
		Label = "Category Name";
	}

	IN MIR-T1-MCAT-TYP-CD-T[20] 
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

	IN MIR-T1-SELECT-T[20] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Indicator";
		Label = "Select";
	}

	IN MIR-T2-MEDIC-CAT-CD-T[20] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table2";
		KeyColumn;
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CAT-CD";
		SType = "Text";
		Label = "Category Name";
	}

	IN MIR-T2-MCAT-TYP-CD-T[20] 
	{
		DisplayOnly;
		Length = "2";
		FieldGroup = "Table2";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MCAT-TYP-CD";
		SType = "Text";
		Label = "Category Type";
	}

	IN MIR-T2-SELECT-T[20] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Indicator";
		Label = "Select";
	}
    
        IN MIR-T3-MULTR-TYP-CD-T[20]
        {
		DisplayOnly;
                Length = "1";
                FieldGroup = "Table3";
                KeyColumn;
                CodeSource = "EDIT";
                CodeType = "BNMLT";
                SType = "Text";
                Label = "Multiplier Category";
                Index = "1";
        }    

        IN MIR-T3-BENM-MULTR-FCT-T[20]
        {
		DisplayOnly;
                Length = "5";
                FieldGroup = "Table3";
                SType = "Number";
                Label = "Multiplier Amount";
                Index = "1";
        }    

}
