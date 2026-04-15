# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A50-O.s                                                    *
#*  Description: Death Master Claim Retrieve                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*  M213M2  CTS      CHANGES DONE TO ADD A CANCER TYPE AND TRANSPLANT TYPE     * 
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF9A50-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		DelEmptyRows;
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
		Type = "Output";
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
		DefaultSession = "MIR-CLM-ID";
		Length = "8";
		SType = "Text";		
		Label = "Death Master Claim ID";
	}

	IN MIR-INSRD-CLI-NM 
	{
		DisplayOnly;
		Length = "51";
		SType = "Text";		
		Label = "Insured Name";
	}

	IN MIR-CLM-STAT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-STAT-CD";		
		SType = "Text";		
		Label = "Death Master Claim Status";
	}

	IN MIR-INSRD-CLI-ID 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";		
		Label = "Insured Client ID";
	}

	IN MIR-POL-ID 
	{
		DisplayOnly;
		Length = "10";
		SType = "Text";		
		Label = "Policy ID";
	}
	
	IN MIR-CLI-BTH-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";		
		Label = "Date of Birth";
	}

	IN MIR-CLI-SEX-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLI-SEX-CD";		
		SType = "Text";		
		Label = "Sex";
	}

	IN MIR-PREV-AUTO-ADJC-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";		
		Label = "Last Auto Adjudication Date";
	}

	IN MIR-PREV-UPDT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";		
		Label = "Last Updated Date";
	}

	IN MIR-PREV-UPDT-USER-ID 
	{
		DisplayOnly;
		Length = "8";
		SType = "Text";		
		Label = "Last Update User ID";
	}

	IN MIR-CLM-HO-NOTI-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";		
		Label = "Head Office Notification Date";
	}

	IN MIR-CLM-HO-ACPT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";		
		Label = "Head Office Claim Form Acceptance Date";
	}

	IN MIR-CLM-AGT-ACPT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";		
		Label = "Agent Claim Form Acceptance Date";
	}

	IN MIR-CLM-SO-ACPT-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";		
		Label = "Sales Office Claim Form Acceptance Date";
	}

	IN MIR-CLM-TYP-CD 
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "CLM-TYP-CD";		
		SType = "Text";		
		Label = "Claim Type";
	}

	IN MIR-CLM-EFF-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";		
		Label = "Effective Date";
	}

	IN MIR-CLI-DTH-REASN-CD 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";		
		Label = "Cause Code";
	}

	IN MIR-CAUSE-DESC-TXT 
	{
		DisplayOnly;
		Label = "Cause Description";
		Length = "40";
		SType = "Text";
	}

	IN MIR-LNB-CLM-TYP-CD 
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "Edit";
		CodeType = "LTAMT";		
		SType = "Text";
		Label = "Living Needs Claim Type";
	}

	IN MIR-LNB-CLM-AMT 
	{
    #	M245B2 CHANGES START HERE    
#M271P2 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271P2 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE 
                DisplayOnly;
		Length = "15";
		SType = "Currency";		
		Label = "Living Needs Claim Amount";
	}

	IN MIR-TCB-CLM-TYP-CD 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";		
		CodeSource = "Edit";
		CodeType = "LTAMT";		
		Label = "Terminal Care Claim Type";
	}

	IN MIR-TCB-CLM-AMT 
	{
    #	M245B2 CHANGES START HERE    
#M271P2 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271P2 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE 
                DisplayOnly;
		Length = "15";
		SType = "Currency";		
		Label = "Terminal Care Claim Amount";
	}
	
#* M213M2 CHANGES BEGIN
      
        IN MIR-CANCER-TYP-CD 
        {
                DisplayOnly;
                Length = "1";
                SType = "Text";
                CodeSource = "Edit";
                CodeType = "CANCD";
                Label = "Cancer Type";
        }
     
        IN MIR-TRANSPLT-TYP-CD
        {
        
                DisplayOnly; 
                Length = "2";
                SType = "Text";
                CodeSource = "Edit";
                CodeType = "TRSTY";
                Label = "Transplant Type";
        }
      
#* M213M2 CHANGES END
#M245B2 CHANGES START HERE    
        INOUT MIR-POL-CRCY-CD
	{
	        
	        Length = "2";
	        SType = "Hidden";
	        Label = "Currency";
         }
#M245B2 CHANGES END HERE   
#M271O1 CHANGES START HERE  
     
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
}
