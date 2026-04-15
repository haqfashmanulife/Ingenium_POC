# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

S-STEP BF9334-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Output";
		DelEmptyRows;
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
	
	OUT index
	{
		SType = "Hidden";
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
		SType = "Text";
		Label = "Master Claim ID";
	}
	
        IN MIR-PRIOR-PREV-UPDT-USER-ID
        {
                SType = "Hidden";
        }     
	    
        IN MIR-PRIOR-STATUS-CD
        {
                SType = "Hidden";
        }     
	
        IN MIR-PRIOR-CLM-ID
        {
                SType = "Hidden";
        }     
	
        IN MIR-MORE-CLM-ID
        {
                SType = "Hidden";
        }  

	IN MIR-CLM-ID-T[20] 
	{
		DisplayOnly;
		Length = "8";
		FieldGroup = "Table1";
		KeyColumn;
		Index = "1";
		Link;
		SType = "Text";
		Label = "Master Claim ID";
		Action = "SelectItem";
	}

        IN MIR-DV-INS-CLI-NM-T[20]
        {
		DisplayOnly;
                FieldGroup = "Table1";
                Length = "75";
                SType = "Text";
                Label = "Insured Full Name";
                Index = "1";
        }    	
	
        IN MIR-BNFT-PMT-AMT-T[20]
        {
		DisplayOnly;
                FieldGroup = "Table1";
                Length = "15";
                SType = "Currency";
                Label = "Payment Amount";
                Index = "1";
        }     
    
        IN MIR-REMIT-AMT-T[20]
        {
		DisplayOnly;
                FieldGroup = "Table1";
                Length = "15";
                SType = "Currency";
                Label = "Adjusted Payment Amount";
                Index = "1";
        }     

        IN MIR-PREV-UPDT-DT-T[20]
        {
 		DisplayOnly;
                FieldGroup = "Table1";
                Length = "10";
                SType = "Date";
                Label = "Previous Update Date";
                Index = "1";
        }

        IN MIR-PREV-UPDT-USER-ID-T[20]
        {
		DisplayOnly;
                FieldGroup = "Table1";
                Length = "8";
                SType = "Text";
                Label = "Previous Update User ID";
                Index = "1";
        }     

        IN MIR-CLMA-CLM-STAT-CD-T[20]
        {
		DisplayOnly;
                FieldGroup = "Table1";
                Length = "01";
                SType = "Text";
                CodeSource = "DataModel";
                CodeType = "CLMA-CLM-STAT-CD";        
                Label = "Master Claim Status";
                Index = "1";
        }

        IN MIR-CLMA-HO-ACPT-DT-T[20]
        {
		DisplayOnly;
                FieldGroup = "Table1";
                Length = "10";
                SType = "Date";
                Label = "Head Office Claim Form Acceptance Date";
                Index = "1";
        }   
}
