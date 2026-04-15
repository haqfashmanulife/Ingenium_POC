# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9894-I.s                                                    *
#*  Description: Disease/Surgery List Screen - Input                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  MP143R           CHANGES FOR KANJI NAME SEARCH                             *
#*******************************************************************************

S-STEP BF9894-I
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
		Label = "Medical Table";
	}

	INOUT MIR-MEDC-ID
	{
		Key;
		Length = "10";
		SType = "Text";
		Label = "Minor Code";
	}

	INOUT MIR-LANG-DESC-1-TXT
	{
		Key;
		Length = "60";
		SType = "Text";
		Label = "Katakana Name";
	}
	
#MP143R Changes Starts here	
	INOUT MIR-LANG-DESC-2-TXT
	{
		Key;
		Length = "60";
		SType = "Text";
		Label = "Kanji Name";
	}
#MP143R Changes Ends here

}
