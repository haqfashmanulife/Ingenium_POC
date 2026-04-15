#*******************************************************************************
#*  Component:   BF9305-O.s                                                    *
#*  Description: Created for Advance Payment Deferral Management Screen        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#* M271B2   19MAR15  INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF9304-O
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

	IN MIR-POL-ID-BASE 
	{
		DefaultSession = "MIR-POL-ID-BASE";
		DisplayOnly;
		Key;
		Label = "Policy ID";
		Length = "9";
		SType = "Text";
	}

	IN MIR-POL-ID-SFX 
	{
		DefaultSession = "MIR-POL-ID-SFX";
		DisplayOnly;
		Key;
		Label = "Suffix";
		Length = "1";
		SType = "Text";
	}

        IN MIR-PLAN-ID 
   	{
   		CodeSource = "EDIT";
   		CodeType = "PLAN";
   		DisplayOnly;
   		Label = "Plan ID";
   		Length = "6";
   		SType = "Text";
   	}
   
   	IN MIR-DV-OWN-CLI-NM 
   	{
   		DisplayOnly;
   		Label = "Owner Name";
   		Length = "75";
   		SType = "Text";
   	}

        IN MIR-PRCES-DT
   	{
   		DefaultSession = "LSIR-PRCES-DT";
   		DisplayOnly;
   		Label = "Processing Date";
   		Length = "10";
   		SType = "Date";
	}

        IN MIR-ADV-PMT-CAT-CD-T[50]
       {
            CodeSource = "DataModel";
	    CodeType = "ADV-PMT-CAT-CD";
	    DisplayOnly;
	    FieldGroup = "Table50";
	    Index = "1";
	    Label = "Category";
	    Length = "4";
	    SType = "Text";
     
       }
   
       IN MIR-PRCES-YY-MO-DT-T[50]
       {
               DisplayOnly;
	       FieldGroup = "Table50";
	       Index = "1";
	       Label = "Processing Year, Month and Date";
	       Length = "10";
	       SType = "Date";
       }
   
       IN MIR-EFF-DT-T[50]
       {
 	        DisplayOnly;
 	        FieldGroup = "Table50";        
                Index = "1";
                Length = "10";
                SType = "Date";
                Label = "Effective Date";
       }
   
       IN MIR-GEN-AMT-T[50]
       {
                DisplayOnly;
                FieldGroup = "Table50";
          	Index = "1";
          	Signed;
          	Length = "15";
          	SType = "Currency";
          	Label = "Generation Amount";
       }
   
        IN MIR-DEFR-INT-AMT-T[50]
        {
                DisplayOnly;
                FieldGroup = "Table50";    
          	Index = "1";    
          	Signed;    
          	Length = "15";    
            	SType = "Currency";    
              	Label = "Interest Amount";
         }    
         
        IN MIR-RSDUE-AMT-T[50]
        {
                DisplayOnly;
                FieldGroup = "Table50";
         	Index = "1";
         	Signed;
         	Length = "15";
         	SType = "Currency";
         	Label = "Residuals of Advance Payment";
       }
   
        IN MIR-NUM-MO-INT-CAP-T[50]  
        {  
                DisplayOnly;
                FieldGroup = "Table50";  
         	Index = "1";  
         	Length = "2";  
         	SType = "Text";  
          	Label = "Number of Months of Interest Capitalization"; 
       }
       
       IN MIR-INT-RT-T[50] 
       {
       	        Decimals = "4";
       	        DisplayOnly;
       	        FieldGroup = "Table50";
       	        Index = "1";
       	        Label = "Interest Rate";
       	        Length = "7";
   	        SType = "Percent";
   	
       } 
       
       IN MIR-ADV-PMT-STAT-CD-T[50]
        {
                DisplayOnly;
                FieldGroup = "Table50";
      		Index = "1";
      		Length = "1";
      		CodeSource = "DataModel";
      		CodeType = "PCHST-STAT-CD";
      		SType = "Text";
      		Label = "Status";
       }
       
       IN MIR-PRCES-DT-T[50]
       {
                DisplayOnly;
          	FieldGroup = "Table50";
		Length = "10";
		Index = "1";
		SType = "Date";
                Label = "Processing Date";
	}
       
}       
   






























































































































