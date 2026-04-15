# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*********************************************************************************
#*  Component:   BF9A92-P.p                                                      *
#*  Description: Update payee for a claim                                        * 
#*                                                                               *
#*                                                                               *
#*********************************************************************************
#*  Chg#    Release  Description                                                 *
#*                                                                               *
#*  IPCAPM  CTS      Intial Version                                              *
#*  IPCA02  CTS      CHANGE THE DISPLAY TAX INFORMATION FEILD FROM INDICATOR TO  *
#*  IPCA02           DROP DOWN                                                   *
#*  M142S2  CTS      Change the label for MIR-PREM-ACUM-AMT from Total Premiun   * 
#*  M142S2           Collected - Accumulated to Taxable Premium Paid             *
#*  M245B2  CTS      Foreign Currency Formatting 			         *
#*  M245K3  CTS     CHANGE THE ACCOUNT NUMBER FIELD LENGTH FROM 7 TO 17          *
#*  Q52972  CTS      ADDED JPY BENEFIT INDICATOR                                 *
#*  Q57608  CTS      ADDED MRF INDICATOR                                         *
#*  M271A3  CTS      FRA DEATH CLAIM CHANGES                                     *
#*  MP287A  CTS      CHANGES DONE AS A PART OF MP287A MY NUMBER                  *
#*********************************************************************************

P-STEP BF9A92-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A92";
        BusinessFunctionName = "Update Payee";
        BusinessFunctionType = "Update";
        MirName = "CCWM9A90";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

       IN MIR-DV-PRCES-STATE-CD
        {
                Length = "1";
                DBTableName = "Derived";
                SType = "Hidden";
                Label = "process code";
         }
         
        INOUT MIR-POL-ID
    	{      
                DisplayOnly;
	        Length = "10";
	        SType = "Text";
    	        Label = "Policy ID";
    	}
    	
        INOUT MIR-DV-INS-CLI-NM
           
        {
                DisplayOnly;
    	    	Length = "75";
    	    	SType = "Text";
    	    	Label = "Insured Name";
        }		 
         
        INOUT MIR-CLM-ID
        
         {
    	        Key;
    	    	DisplayOnly;
    	    	Length = "8";
    	    	SType = "Text";
    	    	Label = "Death Master Claim ID";
         }
        
    
        IN  MIR-DCRL-SEQ-NUM
        
         {
    	        Key;     	
            	Length = "3";
            	DBTableName = "TDCRL";
            	SType = "Text";
            	Label = "Sequence Number";
        	Index = "1";  
          }     
        
        INOUT MIR-CLM-STAT-CD 
          {
    	        DisplayOnly;
    	    	Length = "40";
    	    	CodeSource = "DataModel";
    	    	CodeType = "CLM-STAT-CD";
    	    	SType = "Text";
    	    	Label = " Death Master Claim Status";
          }
    
        
	INOUT MIR-PREV-UPDT-USER-ID 
	{
		DisplayOnly;
		Length = "8";
		Index = "1";
		SType = "Text";
		Label = "Last Updated By";
	}

	INOUT MIR-PREV-UPDT-DT
	
	{
		DisplayOnly;
		Length = "10";
		Index = "1";
		SType = "Text";
		Label = "Date Updated";
	}
      
             
	INOUT MIR-DCRL-PAYE-STAT-CD
	{
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "DCRL-PAYE-STAT-CD";
		SType = "Text";
		Label = "Payee Status";
	}
      

	INOUT MIR-DCRL-INDV-SUR-NM 
	{
	       MixedCase;
		Length = "25";
		SType = "Text";
		Label = "Kanji Last Name";
	}

	INOUT MIR-DCRL-INDV-GIV-NM 
	{
	       MixedCase;	
		Length = "25";
		SType = "Text";
		Label = "Kanji First Name";
	}

	INOUT MIR-DCRL-CO-NM 
	{
	       MixedCase;		
		Length = "50";
		SType = "Text";
		Label = "Company Kanji Name";
	}
#MP287A CHANGES STARTS HERE
	INOUT MIR-INDV-KA-SUR-NM 
	{
	       MixedCase;
		Length = "25";
		SType = "Text";
		Label = "Kana Last Name";
		DBTableName = "TDCRL";
	}

	INOUT MIR-INDV-KA-GIV-NM 
	{
	       MixedCase;	
		Length = "25";
		SType = "Text";
		Label = "Kana First Name";
		DBTableName = "TDCRL";
	}

	INOUT MIR-CO-KA-NM 
	{
	       MixedCase;		
		Length = "50";
		SType = "Text";
		Label = "Company Kana Name";
		DBTableName = "TDCRL";
	}
    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
        DBTableName = "TDCRL";
    }	
	INOUT MIR-CLI-BTH-DT
	{
		Length = "10";
		SType = "Date";
		Label = "Birth Date";
		DBTableName = "TDCRL";
	} 	
#MP287A CHANGES ENDS HERE
	INOUT MIR-DCRL-INSRD-REL-CD 
	{
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Selection";
		Label = "Relation to Beneficiary";
	}


        INOUT MIR-DCRL-SEND-PMT-NOTI-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Send Notice";
	}

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
           
#IPCA02 CHANGES START HERE

        INOUT MIR-TAX-TYP-CD
	{
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "PAYE-TAX-TYP-CD";
	        SType = "Text";
		Label = "Display Tax Information";
	}
           
#IPCA02 CHANGES END HERE

	INOUT MIR-DCRL-SAMAKATA-BU-TXT 
	{
		MixedCase;	
		Length = "72";
		SType = "Text";
		Label = "Samakata-bu";
	}           
           
	INOUT MIR-DCRL-KJ-ADDR-TXT 
	{
		DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Address";
	}  

	INOUT MIR-PREM-ACUM-AMT
	{
#M245B2 CHANGES START HERE  	
#	       Length = "15";
	       Length = "16";
#M245B2 CHANGES END HERE  	       
	       SType = "Currency";
	       Label = "Taxable Premium Paid";
        }
        INOUT MIR-EXPL-RMRK-TXT
	
	{
		Length = "120";
		SType = "Text";
		Label = "Explanatory Remarks";
	}   
	        
	INOUT MIR-BNK-ID
	{
		Length = "4";
		SType = "Text";
		Label = "Current Bank Number";
	}

        INOUT MIR-BNK-NM
	{
		Length = "36";
		SType = "Text";
		Label = "Current Bank Name";
	}
    
	INOUT MIR-BNK-BR-ID
	{
		Length = "3";
		SType = "Text";
		Label = "Current Branch Number";
	}
           
    
             INOUT MIR-BNK-BR-NM
	{
	        Length = "36";
		SType = "Text";
		Label = "Current Branch Name";
	}


             INOUT MIR-DCRL-BNK-ACCT-ID
	{
#* M245K3 CHANGES STARTS HERE
#* 		Length = "7";
                Length = "17";
#* M245K3 CHANGES ENDS HERE
		SType = "Text";
		Label = "Current Account Number";
	}
	
             INOUT MIR-DCRL-ACCT-HLDR-NM
        {
	       MixedCase;	
                Length = "50";
                SType = "Text";
                Label = "Current Accountholder Name";
        }   


	    INOUT MIR-DCRL-ACCT-TYP-CD 
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
	}
	
#M271A3 CHANGES START HERE   

        INOUT MIR-DBL-DISB-IND          
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Double Disbursement Indicator";
        }  

	INOUT MIR-BNK-2-ID
	{	
		Length = "4";
		SType = "Text";
		Label = "Current Bank Number";
	}

        INOUT MIR-BNK-2-NM
	{
		Length = "36";
		SType = "Text";
		Label = "Current Bank Name";
	}
    
	INOUT MIR-BNK-BR-2-ID
	{
		Length = "3";
		SType = "Text";
		Label = "Current Branch Number";
	}
           
    
        INOUT MIR-BNK-BR-2-NM
	{
	        Length = "36";
		SType = "Text";
		Label = "Current Branch Name";
	}


        INOUT MIR-DCRL-BNK-ACCT-2-ID
	{
                Length = "17";
		SType = "Text";
		Label = "Current Account Number";
	}
	
        INOUT MIR-DCRL-ACCT-HLDR-2-NM
        {
                MixedCase;	
                Length = "50";
                SType = "Text";
                Label = "Current Accountholder Name";
        }   

        INOUT MIR-DCRL-ACCT-TYP-2-CD 
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
	}        
        
        INOUT MIR-MRF-2-IND
        {
                Length = "1";
                SType = "Indicator";
                Label = "MRF Indicator";
        }       
       
#M271A3 CHANGES END HERE	
	
#M245B2 CHANGES START HERE        
        INOUT MIR-POL-CRCY-CD
        {    
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
        }
#M245B2 CHANGES END HERE	
#Q52972 CHANGES START HERE
        INOUT MIR-PAYO-JPY-BNFT-CD
        {     
                Length = "1";
                SType = "Hidden";
                Label = "JPY benefit indicator";
        }
        INOUT MIR-PREV-PAYO-JPY-BNFT-CD
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Previous JPY benefit indicator";
        }
#Q52972 CHANGES END HERE
#Q57608 STARTS HERE
#M271A3 CHANGES START HERE 
#        INOUT MIR-MRF-IND
#        {     
#                Length = "1";
#                SType = "Hidden";
#                Label = "MRF Indicator";
#        }

        INOUT MIR-MRF-IND
        {
                Length = "1";
                SType = "Indicator";
                Label = "MRF Indicator";
        }

        INOUT MIR-PREV-MRF-2-IND
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Previous MRF Indicator";
        }
        
#M271A3 CHANGES ENDS HERE 
        INOUT MIR-PREV-MRF-IND
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Previous MRF Indicator";
        }
#Q57608 ENDS HERE

}
