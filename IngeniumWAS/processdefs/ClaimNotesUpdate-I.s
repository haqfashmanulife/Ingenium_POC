# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

S-STEP ClaimNotesUpdate-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		Type = "Input";
		FocusField = "MIR-FTXT-CMNT-INFO";
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
		Length = "08";
		SType = "Text";
                DefaultSession = "MIR-CLM-ID";		
		Label = "Claim ID";
	}

	IN MIR-FTXT-TEXT-SEQ-NBR 
	{
		Key;
 		DisplayOnly;
		Length = "4";
		SType = "Number";
		Label = "Free Format Text Sequence Number";
	}
	
        IN MIR-CLMA-INSRD-CLI-ID          	  
        {
               DisplayOnly;
               Length = "10";
               SType = "Text";
               Label = "Insured Client ID";
        }
        
        IN MIR-DV-CLI-NM
        {
                DisplayOnly;
                Length = "40";
                SType = "Text";
                Label = "Last Name";
        }

        IN MIR-CLI-BTH-DT
	{
	        DisplayOnly;
	        Length = "10";
	        SType = "Date";
	        Label = "Birth Date";
        }

        IN MIR-CLI-SEX-CD
        {
                DisplayOnly;
                Length = "40";
                CodeSource = "DataModel";
                CodeType = "CLI-SEX-CD";
                SType = "Text";
                Label = "Sex";
        }

	IN MIR-CLMA-HO-ACPT-DT
	{ 
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "HO Acceptance Date";
	}        

	IN MIR-CLMA-CLM-STAT-CD
	{ 
		DisplayOnly;
		Length = "10";
                CodeSource = "DataModel";
                CodeType = "CLMA-CLM-STAT-CD";		
		SType = "Text";
		Label = "Claim Status";
	}	

	IN MIR-PREV-UPDT-USER-ID
	{
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Last Updated By";
	}

	IN MIR-PREV-UPDT-DT
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Date Updated";
	}

        IN MIR-CLMA-HIST-CLM-IND
        {
                Length = "1";
                DBTableName = "TCLMA";
                SType = "Indicator";
                Label = "Historical Claim";
        }
#UYSDMC CHANGES STARTS HERE
        IN MIR-CLMA-USYS-CLM-IND
        {
                Length = "1";
                DBTableName = "TCLMA";
                SType = "Indicator";
                Label = "Unisys Claim";
        }
#UYSDMC CHANGES ENDS HERE
	INOUT MIR-FTXT-CMNT-INFO
	{
		Length = "500";
		SType = "Text";
		Label = "Free Format Text";
	}
}
