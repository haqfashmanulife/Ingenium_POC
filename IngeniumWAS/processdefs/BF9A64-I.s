# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A64-I.s                                                    *
#*  Description: Manual Modification Screen                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAAD  CTS      Intial Version                                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF9A64-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
		FocusField = "MIR-PLAN-ID";
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
	
	IN MIR-PLAN-ID
	{
	       Length = "5";
	       CodeSource = "EDIT";
	       CodeType = "PLAN";
	       SType = "Text";
	       Label = "Rider Name";
	 }
	 
	 IN MIR-CVG-FACE-AMT
	 {
	#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
	       Length = "15";
	       SType = "Currency";
	       DBTableName = "TCVG";
	       Label = "Face Amount";
	 }

	 INOUT MIR-BNFT-DED-AMT
	 {
	#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
		Length = "15";
		SType = "Currency";
		Label = "Head Office Notification Date";		
	 }

	 INOUT MIR-DTH-MTHLY-BNFT-AMT
	 {
	#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
		Length = "15";
		SType = "Currency";
		Label = "Amount to be Deducted";               
	 }

	INOUT MIR-BNFT-DED-REASN-CD
	{
		Length = "02";
		SType = "Text";
		CodeSource = "DataModel";
		CodeType = "DED-REASN-CD";
		SType = "Selection";
		Label = "Deduction Reason";		
	}

	INOUT MIR-BNFT-ADDL-AMT
	{
	#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
		Length = "15";
		SType = "Currency";
		Label = "Additional Amount";		
	}

	INOUT MIR-BNFT-ADDL-REASN-CD
	{
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "ADDL-REASN-CD";		
		SType = "Selection";
		Label = "Additional Reason";		
	}

	INOUT MIR-OTHR-RFND-AMT
	{
	#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
		Length = "15";
		SType = "Currency";
		Label = "Other Refund Amount";		
	}

	INOUT MIR-OTHR-RFND-REASN-CD
	{
	        Length = "02";
		CodeSource = "DataModel";		
		CodeType = "OTHR-RFND-REASN-CD";
		SType = "Selection";
		Label = "Other Refund Reason";
	}

	INOUT MIR-PREM-CHNG-REASN-CD
	{
                Length = "02";
		CodeSource = "DataModel";		
		CodeType = "MODIF-REASN-CD";
		SType = "Selection";
		Label = "Modification Reason";		
	}

	INOUT MIR-LN-TC-INT-AMT
	{
	#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
	       Length = "15";
	       SType = "Currency";
	       Label = "Interest";
	}
	
	
	INOUT MIR-LN-TC-PREM-AMT
	{
	#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
		Length = "15";
		SType = "Currency";
		Label = "Premium(next 6 months)";		
		
	}
#M245B2 CHANGES START HERE	
	INOUT MIR-POL-CRCY-CD
	     {
	        
	         Length = "2";
	         SType = "Hidden";
	         Label = "Currency";
	     } 
#M245B2 CHANGES END HERE

	
}
