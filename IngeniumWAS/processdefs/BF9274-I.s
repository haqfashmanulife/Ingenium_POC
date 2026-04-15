# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9274-I.s                                                    *
#*  Description: Claim Requirement Create                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   INITIAL VERSION                                           *
#*  HCCL05  HIN/CL   Pick-up Facility                                          *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

S-STEP BF9274-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		Type = "Input";
		FocusField = "MIR-CLM-REQIR-OPT-CD";
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
		Label = "Claim ID";
	}

	IN MIR-CLMA-CLM-STAT-CD 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLMA-CLM-STAT-CD";
		SType = "Text";
		Label = "Master Claim Status";
	}

	IN MIR-POL-ID 
	{
		Key;
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Policy ID";
	}

	IN MIR-CVG-NUM 
	{
		Key;
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Coverage Number";
	}

	IN MIR-BNFT-NM-ID 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "BENNM";
		SType = "Text";
		Label = "Benefit Name";
	}

	IN MIR-PLAN-ID 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Rider Name";
	}

	IN MIR-CLMA-ASSOC-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Associated Master Claim";
	}

        IN MIR-CLMA-HIST-CLM-IND  
        {
            Key;
            DisplayOnly;
            Length = "1";
            SType = "Indicator";
            Label = "Historical Claim";
        }
#UYSDMC CHANGES STARTS HERE
        IN MIR-CLMA-USYS-CLM-IND  
        {
            DisplayOnly;
            Length = "1";
            SType = "Indicator";
            Label = "Unisys Claim";
        }
#UYSDMC CHANGES ENDS HERE
	INOUT MIR-CLM-REQIR-OPT-CD
	{
		Length = "1";
		SType = "YesNoUnanswered";
		Label = "Claim Requirement Level";
	}

	INOUT MIR-CLM-REQIR-ID
	{
                Mandatory;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "CMRTC";
		SType = "Selection";
		Label = "Requirement";
	}

	INOUT MIR-CRQT-STAT-CD
	{
                Mandatory;
		Length = "3";
		CodeSource = "DataModel";
		CodeType = "CRQT-STAT-CD";
		SType = "Selection";
		Label = "Requirement Status";
	}

	INOUT MIR-CRQT-ORDR-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Ordered Date";
	}

	INOUT MIR-CRQT-RECV-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Received Date";
	}
}
