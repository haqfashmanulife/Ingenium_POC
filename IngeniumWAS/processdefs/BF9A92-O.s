# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9A92-O.s                                                    *
#*  Description: DATA ENTRY SCREEN FOR UPDATE A PAYEE                          *                               
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAPM  CTS      Intial version                                            *
#*  IPCA02  CTS      CHANGE THE DISPLAY TAX INFORMATION FEILD FROM INDICATOR TO*
#*  IPCA02           DROP DOWN                                                 *
#*  M142S2  CTS      Change the label for MIR-PREM-ACUM-AMT from Total Premiun * 
#*  M142S2           Collected - Accumulated to Taxable Premium Paid           *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245K3  CTS      CHANGE THE ACCOUNT NUMBER FIELD LENGTH FROM 7 TO 17       *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  M271A3  CTS      FRA DEATH CLAIMS CHANGES                                  *
#*  MP287A  CTS      CHANGES DONE AS A PART OF MP287A MY NUMBER                *
#*******************************************************************************

S-STEP BF9A92-O
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
	
#IPCA02 CHANGES START HERE
        IN MIR-TAX-TYP-CD
	{
	        DisplayOnly;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "PAYE-TAX-TYP-CD";
		SType = "Text";
		Label = "Display Tax Information";
	}

#IPCA02 CHANGES END HERE

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
#M245Q2 CHANGES START HERE    		   
	   #M245B2 CHANGES START HERE       
#	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
#M245Q2 CHANGES END HERE 
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
#* M245K3 CHANGES STARTS HERE	        
#*		Length = "7";
                Length = "17";
#* M245K3 CHANGES ENDS HERE                
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
	
#M271A3 CHANGES START HERE
        IN MIR-MRF-IND
        {
                Length = "1";
                SType = "Indicator";
                Label = "MRF Indicator";
        }
#M271A3 CHANGES END HERE	

#M245B2 CHANGES START HERE  	
	IN MIR-POL-CRCY-CD
        {     
 	        Length = "2";
                SType = "Hidden";
	        Label = "Currency";
         }
#M245B2 CHANGES END HERE  
}

