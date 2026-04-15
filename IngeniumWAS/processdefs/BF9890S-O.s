# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9890S-O.s                                                   *
#*  Description: Disease/Surgery Retrieve Screen - Output (Surgery)            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  MP143R  CTS    5.2	ADDED  EFFECTIVE AND EXPIRY DATE                       *
#*                                            FOR THE DISEASE/SURGERIES        *

#*******************************************************************************

S-STEP BF9890S-O
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
		Label = "Minor Code";
	}

	IN MIR-MEDC-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Code Medical Type";
	}

	IN MIR-MEDC-SUBTYP-CD 
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "EDIT";
		CodeType = "SUBTY";
		SType = "Text";
		Label = "Subtype";
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

	IN MIR-GRP-MEDC-TYP-CD 
	{
		Length = "1";
		SType = "Hidden";
		Label = "Group Medical Type";
	}

	IN MIR-GRP-MEDC-ID 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Major Code";
	}

	IN MIR-GRP-LANG-DESC-1-TXT 
	{
		DisplayOnly;
		Length = "60";
		SType = "Text";
		Label = "Major Code Name";
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

	IN MIR-T1-GRP-MEDC-ID-T[20] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Major Code";
	}

	IN MIR-T1-GRP-LANG-DESC-1-TXT-T[20] 
	{
		DisplayOnly;
		Length = "60";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Text";
		Label = "Major Code Name";
	}

	IN MIR-T1-MCAD-REF-CD-T[20] 
	{
		DisplayOnly;
		Length = "5";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MCAD-REF-CD";
		SType = "Text";
		Label = "Eligibility";
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
	
#MP143R CHANGES START HERE
	 IN  MIR-EFF-DT
        {
                Length = "10";
                DBTableName = "TMEDC";
                SType = "Text";
                Label = "Effective Date";
	 }
		        
        IN  MIR-XPRY-DT
	 {
                Length = "10";
                DBTableName = "TMEDC";
                SType = "Text";
                Label = "Expiry Date";
          }

#MP143R CHANGES END HERE	

}
