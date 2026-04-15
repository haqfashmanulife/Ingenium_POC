# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   DisSearch-I.s                                                 *
#*  Description: Disease Search Screen - Input                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   INITIAL VERSION                                           *
#*  143C45           CHANGES TO ADD KANJI NAME SEARCH IN 'DISEASE CODE SEARCH' *
#*  143C45           SCREEN IN MEDICAL CLAIM CREATE AND UPDATE SCREEN          *
#*                                                                             *
#*******************************************************************************

S-STEP DisSearch-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Input";
		FocusField = "MIR-LANG-DESC-1-TXT";
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

	INOUT MIR-LANG-DESC-1-TXT
	{
		Key;
		Length = "60";
		SType = "Text";
		Label = "Disease Minor Code Katakana Name";
	}

#143C45 CHANGES STARTS HERE 
	INOUT MIR-LANG-DESC-2-TXT
	{
		Key;
		Length = "60";
		SType = "Text";
		Label = "Disease Minor Code Kanji Name";
	}	
#143C45 CHANGES ENDS HERE 	
}
