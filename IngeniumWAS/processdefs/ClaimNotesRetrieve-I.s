# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

S-STEP ClaimNotesRetrieve-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		Type = "Input";
		FocusField = "MIR-CLM-ID";
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

	INOUT MIR-CLM-ID
	{
	      Key;
	      Mandatory;
	      Length = "08";
	      SType = "Text";
              DefaultSession = "MIR-CLM-ID";		
	      Label = "Master Claim ID";
	}

	INOUT MIR-FTXT-TEXT-SEQ-NBR 
	{
	      Key;
	      Length = "4";
	      SType = "Number";
	      Label = "Free Format Text Sequence Number";
	}	
}
