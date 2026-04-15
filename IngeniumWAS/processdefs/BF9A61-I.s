# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9A61-I.s                                                    *
#*  Description: Requirement Create                                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAAD  CTS      Initial Version                                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A61-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		Type = "Input";
		FocusField = "MIR-DTH-CLM-REQIR-ID";
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

	IN MIR-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Master Claim ID";
	}

	IN MIR-CLM-STAT-CD 
	{
		Key;
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-STAT-CD";
		SType = "Text";
		Label = "Death Master Claim Status";
	}

	IN MIR-POL-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Policy ID";
	}

	
	INOUT MIR-DTH-CLM-REQIR-OPT-CD
	{
		Length = "1";
		SType = "YesNoUnanswered";
		Label = "Policy Requirement";
	}

	INOUT MIR-CVG-NUM
	{
	        Length = "2";
	        SType = "Text";	        
	        Label = "Coverage Number";
	}        
	
		
	INOUT MIR-DTH-CLM-REQIR-ID
	{
                Mandatory;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "DCRQT";
		SType = "Selection";
		Label = "Requirement";
	}

	INOUT MIR-DTH-CRQT-STAT-CD
	{
                Mandatory;
		Length = "3";
		CodeSource = "DataModel";
		CodeType = "CRQT-STAT-CD";		
		SType = "Selection";
		Label = "Requirement Status";
	}

	INOUT MIR-DTH-CRQT-ORDR-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Ordered Date";
	}

	INOUT MIR-DTH-CRQT-RECV-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Received Date";
	}
}
