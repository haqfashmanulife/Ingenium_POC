# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9339-O.s                                                    *
#*  Description: Final Approval Reversal List                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   HIN/EC CLAIM PAYMENT                                      *
#*  CCL05   HIN/CL   HIN/EC PICK-UP FACILITY                                   *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************
S-STEP BF9339-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
		Type = "Output";
		DelEmptyRows;
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
	
	OUT index
	{
		SType = "Hidden";
	}

	INOUT MIR-CLM-ID 
	{
		Key;
		Length = "8";
		SType = "Text";
		Label = "Master Claim ID";
	}
	
        IN MIR-DV-INS-CLI-NM
        {
		DisplayOnly;
                Length = "75";
                SType = "Text";
                Label = "Insured Full Name";
                Index = "1";
        }    	
        IN MIR-CLMA-CLM-STAT-CD
        {
		DisplayOnly;
                Length = "01";
                SType = "Text";
                CodeSource = "DataModel";
                CodeType = "CLMA-CLM-STAT-CD";        
                Label = "Master Claim Status";
                Index = "1";
        }

        IN MIR-PREV-UPDT-DT
        {
 		DisplayOnly;
                Length = "10";
                SType = "Date";
                Label = "Previous Update Date";
                Index = "1";
        }

        IN MIR-PREV-UPDT-USER-ID
        {
		DisplayOnly;
                Length = "8";
                SType = "Text";
                Label = "Previous Update User ID";
                Index = "1";
        }     
	IN MIR-CLMA-HIST-CLM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Historical Claim:";
	}
#UYSDMC CHANGES STARTS HERE
	IN MIR-CLMA-USYS-CLM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Unisys Claim:";
	}
#UYSDMC CHANGES ENDS HERE
	IN MIR-APROV-SEQ-NUM-T[10]
        {
            FieldGroup = "Table1";
            Length = "3";
            SType = "Text";
            Label = "Sequence Number";
            Index = "1";
        }     
    
        IN MIR-BNFT-PMT-AMT-T[10]
        {
		DisplayOnly;
                FieldGroup = "Table1";
                Length = "15";
                SType = "Currency";
                Label = "Payment Amount";
                Index = "1";
        }     
    
        IN MIR-REMIT-AMT-T[10]
        {
		DisplayOnly;
                FieldGroup = "Table1";
                Length = "15";
                SType = "Currency";
                Label = "Adjusted Payment Amount";
                Index = "1";
        }     


}
