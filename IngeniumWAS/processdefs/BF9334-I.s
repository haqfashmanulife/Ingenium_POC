# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

S-STEP BF9334-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Input";
		FocusField = "MIR-PREV-UPDT-USER-ID";
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

	INOUT MIR-PREV-UPDT-USER-ID 
	{
		Key;
		Length = "10";
		SType = "Date";
		Label = "Previous Update User ID";
	}

        INOUT MIR-STATUS-CD
        {
                Key;
                Length = "1";
                SType = "Selection";
                CodeSource = "DataModel";
                CodeType = "CLM-STAT-APROV-CD";        
                Label = "Status";
        }

	INOUT MIR-CLM-ID 
	{
		Key;
		Length = "8";
		DefaultSession = "MIR-CLM-ID";		
		SType = "Text";
		Label = "Master Claim ID";
	}
	
        INOUT MIR-PRIOR-PREV-UPDT-USER-ID
        {
                SType = "Hidden";
        }     
	    
        INOUT MIR-PRIOR-STATUS-CD
        {
                SType = "Hidden";
        }     
	
        INOUT MIR-PRIOR-CLM-ID
        {
                SType = "Hidden";
        }     
	
        INOUT MIR-MORE-CLM-ID
        {
                SType = "Hidden";
        }  
}
