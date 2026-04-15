# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9A92D-O.s                                                   *
#*  Description: DATA ENTRY SCREEN FOR UPDATE A PAYEE - DOUBLE DISB            *                               
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M271A3  CTS      Intial version                                            *
#*  MP287A  CTS      CHANGES DONE AS A PART OF MP287A MY NUMBER                *
#*******************************************************************************

S-STEP BF9A92D-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        DelEmptyRows;
        FocusField = "MIR-DCRL-INDV-SUR-NM";
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


	IN MIR-POL-ID
	
	{       DisplayOnly;
		Length = "10";
		SType = "Text";
		Label = "Policy ID";
	}	
       IN MIR-DV-INS-CLI-NM
       
	{       DisplayOnly;
		Length = "75";
		SType = "Text";
		Label = "Insured Name";
	}		
		
	IN MIR-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Death Master Claim ID";
	}
    
	IN MIR-CLM-STAT-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLM-STAT-CD";
		SType = "Text";
		Label = "Death Master Claim Status";
	}

      
	IN MIR-PREV-UPDT-DT
	{
		DisplayOnly;
		Length = "10";
		Index = "1";
		SType = "Text";
		Label = "Last Updated Date";
	}
	 
	IN MIR-PREV-UPDT-USER-ID 
	{
		DisplayOnly;
		Length = "8";
		Index = "1";
		SType = "Text";
		Label = "Last Updated User ID";
	}
      
        IN MIR-DCRL-PAYE-STAT-CD
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "DCRL-PAYE-STAT-CD";
		SType = "Text";
		Label = "Payee Status";
	}
      
        
	IN MIR-DCRL-INDV-SUR-NM 
	{
	        DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "Last Name";
	}

	IN MIR-DCRL-INDV-GIV-NM 
	{
	        DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "First Name";
	}

	IN MIR-DCRL-CO-NM 
	{
	        DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Company Name";
	}

#MP287A CHANGES STARTS HERE
	IN MIR-INDV-KA-SUR-NM 
	{
	        DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "Last Name";
	}

	IN MIR-INDV-KA-GIV-NM 
	{
	        DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "First Name";
	}

	IN MIR-CO-KA-NM 
	{
	        DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Company Name";
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
	IN MIR-CLI-BTH-DT
	{
	        DisplayOnly;	
		Length = "10";
		SType = "Date";
		Label = "Birth Date";
	} 	
#MP287A CHANGES ENDS HERE	
        IN MIR-DCRL-SEND-PMT-NOTI-IND
	{
	        DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Send Notice";
	}
	
        IN MIR-TAX-TYP-CD
	{
	        DisplayOnly;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "PAYE-TAX-TYP-CD";
		SType = "Text";
		Label = "Display Tax Information";
	}

        IN MIR-DCRL-ADDR-LOC-CD
	{
	        DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Address Code";
	}
        
       
	IN MIR-DCRL-PSTL-CD 
	{
	        DisplayOnly;
		Length = "9";
		SType = "Text";
		Label = "Postal Code";
	}
           

	IN MIR-DCRL-SAMAKATA-BU-TXT 
	{
	        DisplayOnly;
		Length = "72";
		SType = "Text";
		Label = "Samakata-bu";
	} 
	

	IN  MIR-DCRL-KJ-ADDR-TXT 
	{
	        DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Address";
	} 
	
	IN MIR-PREM-ACUM-AMT
	{
	       DisplayOnly;
	       Length = "15";
	       SType = "Currency";
	       Label = "Taxable Premium Paid";
	}      
         
	IN MIR-EXPL-RMRK-TXT
	
	{
	        DisplayOnly;
		Length = "120";
		SType = "Text";
		Label = "Explanatory Remarks";
	}   
	

	IN MIR-DCRL-INSRD-REL-CD 
	{
	        DisplayOnly;
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Text";
		Label = "Relation to Beneficiary";
	}	
		
	IN MIR-BNK-ID
	{
	        DisplayOnly;
		Length = "4";
		SType = "Text";
		Label = "Bank Number";
	}

        IN MIR-BNK-NM
	{
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Bank Name";
	}
    
	IN MIR-BNK-BR-ID
	{
	        DisplayOnly;
		Length = "5";
		SType = "Text";
		Label = "Branch Number";
	}
           
    
        IN MIR-BNK-BR-NM
	{
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Branch Name";
	}


        IN MIR-DCRL-BNK-ACCT-ID
	{
	        DisplayOnly;
                Length = "17";
		SType = "Text";
		Label = "Account Number";
	}
	
	
        IN MIR-DCRL-ACCT-HLDR-NM
        {
                DisplayOnly;  
                Length = "50";
                SType = "Text";
                Label = "Accountholder Name";
        }   


	IN MIR-DCRL-ACCT-TYP-CD 
	{
	        DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
	}
	
        IN MIR-MRF-IND
        {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
                Label = "MRF Indicator";
        }
	
	IN MIR-POL-CRCY-CD
        {     
 	        Length = "2";
                SType = "Hidden";
	        Label = "Currency";
         }
		
	IN MIR-BNK-2-ID
	{
	        DisplayOnly;
		Length = "4";
		SType = "Text";
		Label = "Bank Number";
	}

        IN MIR-BNK-2-NM
	{
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Bank Name";
	}
    
	IN MIR-BNK-BR-2-ID
	{
	        DisplayOnly;
		Length = "5";
		SType = "Text";
		Label = "Branch Number";
	}
           
    
        IN MIR-BNK-BR-2-NM
	{
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Branch Name";
	}

        IN MIR-DCRL-BNK-ACCT-2-ID
	{
	        DisplayOnly;
                Length = "17";
		SType = "Text";
		Label = "Account Number";
	}
	
	
        IN MIR-DCRL-ACCT-HLDR-2-NM
        {
                DisplayOnly;  
                Length = "50";
                SType = "Text";
                Label = "Accountholder Name";
        }   


	IN MIR-DCRL-ACCT-TYP-2-CD 
	{
	        DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
	}
	
        IN MIR-MRF-2-IND
        {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
                Label = "MRF Indicator";
        }        
}

