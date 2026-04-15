 # Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9892D-I.s                                                   *
#*  Description: Disease/Surgery Update Screen (Disease)                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  MP143R  CTS        ADDED ADDED  EFFECTIVE AND EXPIRY DATE                  *
#*                                            FOR THE DISEASE/SURGERIES        *                                                                          
#*******************************************************************************

S-STEP BF9892D-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
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

	IN MIR-MEDIC-CD 
	{
		Key;
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MEDIC-CD";
		SType = "Text";
		Label = "Medical Table";
	}

	IN MIR-MEDC-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Medical ID";
	}

	IN MIR-MEDC-TYP-CD
	{
		Length = "1";
		SType = "Hidden";
		Label = "Code Medical Type";
	}

	INOUT MIR-LANG-DESC-1-TXT
	{
		Length = "60";
		SType = "Text";
		Label = "Katakana Name";
	}

	INOUT MIR-LANG-DESC-2-TXT
	{
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

	INOUT MIR-GRP-MEDC-ID
	{
		Length = "10";
		SType = "Text";
		Label = "Major Code";
	}

	IN MIR-GRP-LANG-DESC-1-TXT
	{
		Length = "60";
		SType = "Text";
		Label = "Major Code Name";
	}

	IN MIR-T1-MEDIC-CAT-CD-T[20]
	{
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
		Length = "2";
		FieldGroup = "Table1";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MCAT-TYP-CD";
		SType = "Text";
		Label = "Category Type";
	}

	INOUT MIR-T1-SELECT-T[20]
	{
		Length = "1";
		FieldGroup = "Table1";
		Index = "1";
		SType = "Indicator";
		Label = "Select";
	}

	IN MIR-T2-MEDIC-CAT-CD-T[20]
	{
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
		Length = "2";
		FieldGroup = "Table2";
		Index = "1";
		CodeSource = "DataModel";
		CodeType = "MCAT-TYP-CD";
		SType = "Text";
		Label = "Category Type";
	}

	INOUT MIR-T2-SELECT-T[20]
	{
		Length = "1";
		FieldGroup = "Table2";
		Index = "1";
		SType = "Indicator";
		Label = "Select";
	}
	
#MP143R CHANGES START HERE
     INOUT  MIR-EFF-DT
       {
           Length = "10";
           DBTableName = "TMEDC";
            SType = "Text";
             Label = "Effective Date";
        }
        
         INOUT  MIR-XPRY-DT
          {
               Length = "10";
               DBTableName = "TMEDC";
               SType = "Text";
                Label = "Expiry Date";
            }
#MP143R CHANGES END HERE            	
}
