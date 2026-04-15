# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9A92-I.s                                                    *
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
#*  MP287A  CTS      CHANGES DONE AS A PART OF MP287A MY NUMBER                *
#*******************************************************************************

S-STEP BF9A92-I
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
      
        
	INOUT MIR-DCRL-INDV-SUR-NM 
	{
		Length = "25";
		SType = "Text";
		Label = "Last Name";
	}

	INOUT MIR-DCRL-INDV-GIV-NM 
	{
		Length = "25";
		SType = "Text";
		Label = "First Name";
	}

	INOUT MIR-DCRL-CO-NM 
	{
		Length = "50";
		SType = "Text";
		Label = "Company Name";
	}

#MP287A CHANGES STARTS HERE
	INOUT MIR-INDV-KA-SUR-NM 
	{
		Length = "25";
		SType = "Text";
		Label = "Last Name";
	}

	INOUT MIR-INDV-KA-GIV-NM 
	{
		Length = "25";
		SType = "Text";
		Label = "First Name";
	}

	INOUT MIR-CO-KA-NM 
	{
		Length = "50";
		SType = "Text";
		Label = "Company Name";
	}
    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }	
	INOUT MIR-CLI-BTH-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Birth Date";
	} 	
#MP287A CHANGES ENDS HERE	
        INOUT MIR-DCRL-SEND-PMT-NOTI-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Send Notice";
	}

#IPCA02 CHANGES START HERE	
       
       INOUT MIR-TAX-TYP-CD
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "PAYE-TAX-TYP-CD";
		SType = "Selection";
		DefaultConstant = "IH"; 
		Label = "Display Tax Information";
	}

#IPCA02 CHANGES END HERE

        INOUT MIR-DCRL-ADDR-LOC-CD
	{
		Length = "8";
		SType = "Text";
		Label = "Address Code";
	}
        
       
	INOUT MIR-DCRL-PSTL-CD 
	{
		Length = "9";
		SType = "Text";
		Label = "Postal Code";
	}
           

	INOUT MIR-DCRL-SAMAKATA-BU-TXT 
	{
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
	
	INOUT MIR-PREM-ACUM-AMT
	{
#M245Q2 CHANGES START HERE    	
#M245B2 CHANGES START HERE    
#	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
#M245Q2 CHANGES END HERE    
	       Length = "15";
	       SType = "Currency";
	       Label = "Taxable Premium Paid";
	}      
         
	INOUT MIR-EXPL-RMRK-TXT
	
	{
		Length = "120";
		SType = "Text";
		Label = "Explanatory Remarks";
	}   
	

	INOUT MIR-DCRL-INSRD-REL-CD 
	{
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Selection";
		Label = "Relation to Beneficiary";
	}	
		
	INOUT MIR-BNK-ID
	{
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
    
	INOUT MIR-BNK-BR-ID
	{
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


        INOUT MIR-DCRL-BNK-ACCT-ID
	{
#* M245K3 CHANGES STARTS HERE	
#*		Length = "7";
                Length = "17";
#* M245K3 CHANGES ENDS HERE                
		SType = "Text";
		Label = "Account Number";
	}
	
	
        INOUT MIR-DCRL-ACCT-HLDR-NM
        {
                Length = "50";
                SType = "Text";
                Label = "Accountholder Name";
        }   


	INOUT MIR-DCRL-ACCT-TYP-CD 
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Selection";
		Label = "Account Type";
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

