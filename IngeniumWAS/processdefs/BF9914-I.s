#*******************************************************************************
#*  Component:   BF9914-I.s                                                    *
#*  Description: CUSTOMER/PROSPECT SEARCH CRITERIAS                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS  INITIAL VERSION                                               *
#*  MP0054  CTS  YEAR,MONTH AND DAY FIELDS ADDED                               *
#*******************************************************************************
S-STEP BF9914-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		FocusField = "MIR-PRCES-DT";
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
		SType = "Hidden";
	}
	IN MIR-PRCES-DT
	{
		DefaultSession = "LSIR-PRCES-DT";
		DisplayOnly;
		Key;
		Label = "Date";
		Length = "10";
		SType = "Date";
	}
	IN MIR-DV-RO-SO-CD
	{
		DisplayOnly;
		Key;
		Label = "RO-SO Code";
		Length = "10";
		SType = "Text";
	}
	IN MIR-AGT-ID
	{
		DefaultSession = "MIR-AGT-ID";
		DisplayOnly;
		Key;
		Label = "PA Code";
		Length = "6";
		SType = "Text";
	}
	IN MIR-AGT-NM
	{
		DisplayOnly;
		Key;
		Label = "PA Name";
		Length = "50";
		SType = "Text";
	}
	INOUT MIR-SRCH-TYP-CD
	{
		Label;
		Length = "1";
		SType = "YesNo";
	}
	INOUT MIR-SRCH-CD
	{
		Label;
		Length = "1";
		SType = "YesNoUnanswered";
	}
	INOUT MIR-GIV-NM-KA
	{
		MixedCase;
		Label = "First Name Kana";
		Length = "50";
		SType = "Text";
	}
	INOUT MIR-SUR-NM-KA
	{
		MixedCase;
		Label = "Last Name Kana";
		Length = "50";
		SType = "Text";
	}
	INOUT MIR-GIV-NM-KJ
	{
		MixedCase;
		Label = "First Name Kanji";
		Length = "50";
		SType = "Text";
	}
	INOUT MIR-SUR-NM-KJ
	{
		MixedCase;
		Label = "Last Name Kanji";
		Length = "50";
		SType = "Text";
	}
	
	# Code changes for MP0054 starts here
	
	INOUT MIR-DV-CLI-BTH-YR-FROM
	{
		
		Label = "YYYY";
		Length = "4";
		SType = "Text";
	}
	
	INOUT MIR-DV-CLI-BTH-YR-TO
	{
		
		Label = "YYYY";
		Length = "4";
		SType = "Text";
	}
	
	INOUT MIR-DV-CLI-BTH-MO-FROM
	{
		CodeSource = "DataModel";
		CodeType = "FT-SRCH-MOB";
		Label = "MM";
		Length = "2";
		SType = "Selection";
	}
	
	INOUT MIR-DV-CLI-BTH-MO-TO
	{
		CodeSource = "DataModel";
		CodeType = "FT-SRCH-MOB";
		Label = "MM";
		Length = "2";
		SType = "Selection";
	}
	INOUT MIR-DV-CLI-BTH-DY-FROM
	{
	        CodeSource = "DataModel";
		CodeType = "FT-SRCH-DOB";
	        Label = "DD";
	        Length = "2";
	        SType = "Selection";
	}
	INOUT MIR-DV-CLI-BTH-DY-TO
	{
	        CodeSource = "DataModel";
		CodeType = "FT-SRCH-DOB";
	        Label = "DD";
	        Length = "2";
	        SType = "Selection";
        }
        
        # Code changes for MP0054 ends here
        
	INOUT MIR-PRT1-CLI-PSTL-CD
	{
		Label = "Postal Code";
		Length = "3";
		SType = "Text";
	}
	INOUT MIR-PRT2-CLI-PSTL-CD
	{
		Label = "Postal Code";
		Length = "7";
		SType = "Text";
	}
	INOUT MIR-PROD-CD
	{
		Label = "Product Code";
		Length = "30";
		SType = "Text";
	}
	INOUT MIR-POL-ID
	{
		Label = "Policy Id";
		Length = "30";
		SType = "Text";
	}
	INOUT MIR-HID-GIV-NM-KA
	{
		MixedCase;
		Label = "";
		Length = "50";
		SType = "Hidden";
	}
	INOUT MIR-HID-SUR-NM-KA
	{
		MixedCase;
		Label = "";
		Length = "50";
		SType = "Hidden";
	}
	INOUT MIR-CLI-BTH-DT
	{
		MixedCase;
		Label = "";
		Length = "10";
		SType = "Hidden";
	}
	IN MIR-SEQ-NUM
	{
		Label = "";
		Length = "3";
		SType = "Hidden";
	}

}
