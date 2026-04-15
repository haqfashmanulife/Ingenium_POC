# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A52-I.s                                                    *
#*  Description: Death Master Claim Update                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*  ABF420  CTS      Changes done for Focus Field and Cause Description        *
#*                                                                             *
#*  M213M2  CTS      CHANGES DONE TO ADD A CANCER TYPE AND TRANSPLANT TYPE     *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF9A52-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		FocusField = "MIR-CLM-HO-NOTI-DT";
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
		SType="Hidden";
	}

	OUT index
	{
		SType="Hidden";
	}

	IN LSIR-PRCES-DT
	{
		SType="Hidden";
		DefaultSession = "LSIR-PRCES-DT";
	}
	
	INOUT MIR-DV-PRCES-STATE-CD
	{
		Label = "process code";
		Length = "1";
		SType = "Hidden";
	}

	IN MIR-CLM-ID
	{
		Label = "Death Master Claim ID";
		Length = "8";
		SType = "Text";
	}

	IN MIR-INSRD-CLI-NM
	{
		Label = "Insured Name";
		Length = "51";
		SType = "Text";
	}

	IN MIR-CLM-STAT-CD
	{
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-STAT-CD";		
		SType = "Text";	
		Label = "Death Master Claim Status";
	}

	IN MIR-INSRD-CLI-ID
	{
		Length = "10";
		SType = "Text";	
		Label = "Insured Client ID";
	}

	IN MIR-POL-ID
	{
		Length = "10";
		SType = "Text";	
		Label = "Policy ID";
	}
	
	IN MIR-CLI-BTH-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Date of Birth";		
	}

	IN MIR-CLI-SEX-CD
	{
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLI-SEX-CD";		
		SType = "Text";
		Label = "Sex";		
	}

	IN MIR-PREV-AUTO-ADJC-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Last Auto Adjudication Date";		
	}

	IN MIR-PREV-UPDT-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Last Updated Date";		
	}

	IN MIR-PREV-UPDT-USER-ID
	{
		Length = "8";
		SType = "Text";	
		Label = "Last Update User ID";
	}

	INOUT MIR-CLM-HO-NOTI-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Head Office Notification Date";		
	}

	INOUT MIR-CLM-HO-ACPT-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Head Office Claim Form Acceptance Date";		
	}

	INOUT MIR-CLM-AGT-ACPT-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Agent Claim Form Acceptance Date";		
	}

	INOUT MIR-CLM-SO-ACPT-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Sales Office Claim Form Acceptance Date";		
	}

	INOUT MIR-CLM-TYP-CD
	{
	        Mandatory;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "CLM-TYP-CD";		
		SType = "Selection";
		Label = "Claim Type";		
	}

	INOUT MIR-CLM-EFF-DT
	{
	        Mandatory;
		Length = "10";
		SType = "Date";
		Label = "Effective Date";		
	}

	INOUT MIR-CLI-DTH-REASN-CD
	{
	        Mandatory;
	        Length = "3";
		SType = "Text";		
		Label = "Cause Code";
	}

	INOUT MIR-CAUSE-DESC-TXT
	{
                DisplayOnly;
                Length = "40";
                CodeSource = "CSOM9A38";
                FilterFields = "1";
                FilterField1 = "MIR-CLI-DTH-REASN-CD";
                DefaultConstant = "NO";
                SType = "TextArea";
                Label = "Cause Description";		
	}

	INOUT MIR-LNB-CLM-TYP-CD
	{
		Length = "2";
		CodeSource = "Edit";
		CodeType = "LTAMT";		
		SType = "Selection";
		Label = "Living Needs Claim Type";	
	}

	INOUT MIR-LNB-CLM-AMT
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
 #              Length = "15";
                Length = "16";
 #M245B2 CHANGES END HERE  
		SType = "Currency";
		Label = "Living Needs Claim Amount";		
	}

	INOUT MIR-TCB-CLM-TYP-CD
	{
		Length = "2";
		CodeSource = "Edit";
		CodeType = "LTAMT";		
		SType = "Selection";
		Label = "Terminal Care Claim Type";		
	}

	INOUT MIR-TCB-CLM-AMT
	{
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
 #               Length = "15";
	         Length = "16";
 #M245B2 CHANGES END HERE   
		SType = "Currency";
		Label = "Terminal Care Claim Mount";		
	}
	
#* M213M2 CHANGES BEGIN
	          
	INOUT MIR-CANCER-TYP-CD 
	{
	        Length = "1";
	        CodeSource = "Edit";
	        CodeType = "CANCD";
	        SType = "Selection";
	        Label = "Cancer Type";
	}
	         
        INOUT MIR-TRANSPLT-TYP-CD
	{
	        Length = "2";
	        CodeSource = "Edit";
	        CodeType = "TRSTY";
	        SType = "Selection";
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
}
