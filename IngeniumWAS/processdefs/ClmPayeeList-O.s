# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   ClmPayeeList-O.s                                              *
#*  Description:    Supports the client claim search screen.  A client id      * 
#*                              or policy id may be entered or a search on name*
#*                              may be submited.                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   CLIENT CLAIM SEARCH              (HCL103B)                *
#*  HCCL05  HIN/CL   Pick-up facility (add Historical Claim Indicator)         *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

S-STEP ClmPayeeList-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        DelEmptyRows;
        FocusField = "SELECT-T[1]";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }


	IN MIR-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Master Claim ID";
	}
    
	IN MIR-CLMA-CLM-STAT-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLMA-CLM-STAT-CD";
		SType = "Text";
		Label = "Master Claim Status";
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
        IN MIR-PAYEE-NM-TXT-T[50]
	{
		DisplayOnly;
		Length = "50";
		FieldGroup = "Table50";
		SType = "Text";
		Label = "Kanji Payee Name";
	}
        
         IN MIR-BNK-NM-T[50]
	{
		DisplayOnly;
		Length = "36";
		FieldGroup = "Table50";
		SType = "Text";
		Label = "Current Bank Name";
	}
    
             IN MIR-BNK-BR-NM-T[50]
	{
		DisplayOnly;
		Length = "36";
		FieldGroup = "Table50";
		SType = "Text";
		Label = "Current Branch Name";
	}


             IN MIR-CLRL-BNK-ACCT-ID-T[50]
	{
		DisplayOnly;
		Length = "7";
		FieldGroup = "Table50";
		SType = "Text";
		Label = "Current Account Number";
	}
	
             IN MIR-CLRL-ACCT-HLDR-NM-T[50]
        {
                DisplayOnly;
                Length = "50";
                FieldGroup = "Table50";
                SType = "Text";
                Label = "Current Accountholder Name";
        }
                          
             IN MIR-CLRL-ADDR-LOC-CD-T[50]
	{
		DisplayOnly;
		Length = "8";
		FieldGroup = "Table50";
		SType = "Text";
		Label = "Address Code";
	}
                          
             IN MIR-CLRL-SEND-PMT-NOTI-IND-T[50]
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table50";
		SType = "Indicator";
		Label = "Send Notice";
	}
                 
             IN MIR-CLRL-INSRD-REL-CD-T[50]
	{
		DisplayOnly;
		Length = "40";
		FieldGroup = "Table1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Text";
		Label = "Relationship to Insured";
	}             
             
        
	IN MIR-PREV-UPDT-USER-ID-T[50] 
	{
		DisplayOnly;
		Length = "8";
		FieldGroup = "Table50";
		Index = "1";
		SType = "Text";
		Label = "Last Updated By";
	}

	IN MIR-PREV-UPDT-DT-T[50] 
	{
		DisplayOnly;
		Length = "10";
		FieldGroup = "Table50";
		Index = "1";
		SType = "Text";
		Label = "Date Updated";
	}
             
             
	IN MIR-CLRL-PAYE-STAT-CD-T[50] 
	{
		DisplayOnly;
		Length = "1";
		FieldGroup = "Table50";
		CodeSource = "DataModel";
		CodeType = "CLRL-PAYE-STAT-CD";
		SType = "Text";
		Label = "Payee Status";
	}

}

