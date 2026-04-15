# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*********************************************************************************
#*  Component:   BF9A90-P.p                                                      *
#*  Description: Retrieve payee for a claim                                      * 
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
#*  M245K3  CTS      CHANGE THE ACCOUNT NUMBER FIELD LENGTH FROM 7 TO 17         *
#*  Q52972  CTS      ADDED JPY BENEFIT INDICATOR                                 *
#*  Q57608  CTS      ADDED MRF INDICATOR                                         *
#*  M271A3  CTS      FRA DEATH CLAIM CHANGES                                     *
#*  MP287A  CTS      CHANGES DONE AS A PART OF MP287A MY NUMBER                  *
#*********************************************************************************

P-STEP BF9A90-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A90";
        BusinessFunctionName = "Retrieve Payee";
        BusinessFunctionType = "Retrieve";
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
         
       IN MIR-DCRL-TYP-CD
        {    
             Length = "1";
             DBTableName = "TDCRL";
	     SType = "Text";
             Label = "Client type code";
             
        } 
        OUT MIR-POL-ID
    	{      
                DisplayOnly;
	        Length = "10";
	        SType = "Text";
    	        Label = "Policy ID";
    	        DBTableName = "TDCLM";
    	}
    	
        OUT MIR-DV-INS-CLI-NM
           
        {
                DisplayOnly;
    	    	Length = "75";
    	    	SType = "Text";
    	    	Label = "Insured Name";
    	    	DBTableName = "Derived";
        }		 
         
      INOUT MIR-CLM-ID
        
         {
    	        Key;
    	    	Length = "8";
    	    	SType = "Text";
    	    	Label = "Death Master Claim ID";
    	    	DBTableName = "TDCLM";
         }
        
  #M271A3 CHANGES STARTS HERE
  
        INOUT MIR-DBL-DISB-IND          
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Double Disbursement Indicator";
        }    
        
	OUT MIR-BNK-2-ID
	{
		Length = "4";
		SType = "Text";
		Label = "Current Bank Number";
		DBTableName = "TDCRL";
	}

        OUT MIR-BNK-2-NM
	{
		Length = "36";
		SType = "Text";
		Label = "Current Bank Name";
		DBTableName = "TBNKB";
	}
    
	OUT MIR-BNK-BR-2-ID
	{
		Length = "3";
		SType = "Text";
		Label = "Current Branch Number";
		DBTableName = "TDCRL";
	}
           
    
        OUT MIR-BNK-BR-2-NM
	{
	        Length = "36";
		SType = "Text";
		Label = "Current Branch Name";
		DBTableName = "TBNKB";
		
	}

        OUT MIR-DCRL-BNK-ACCT-2-ID
	{
                Length = "17";
		SType = "Text";
		Label = "Current Account Number";
		DBTableName = "TDCRL";
	}
	
        OUT MIR-DCRL-ACCT-HLDR-2-NM
        {
	        MixedCase;	
                Length = "50";
                SType = "Text";
                Label = "Current Accountholder Name";
                DBTableName = "TDCRL";
        }   


	OUT MIR-DCRL-ACCT-TYP-2-CD
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
		DBTableName = "TDCRL";
	}        
  
  #M271A3 CHANGES END HERE      
    
        INOUT  MIR-DCRL-SEQ-NUM
        
         {
    	        Key;     	
            	Length = "3";
            	DBTableName = "TDCRL";
            	SType = "Text";
            	Label = "Sequence Number";
        	  
          }     
        
        OUT MIR-CLM-STAT-CD 
          {
    	        DisplayOnly;
    	    	Length = "40";
    	    	CodeSource = "DataModel";
    	    	CodeType = "CLM-STAT-CD";
    	    	SType = "Text";
    	    	Label = " Death Master Claim Status";
    	    	DBTableName = "TDCLM";
          }
    
        
	OUT MIR-PREV-UPDT-USER-ID 
	{
		DisplayOnly;
		Length = "8";
		Index = "1";
		SType = "Text";
		Label = "Last Updated By";
		DBTableName = "TDCRL";
	}

	OUT MIR-PREV-UPDT-DT
	
	{
		DisplayOnly;
		Length = "10";
		Index = "1";
		SType = "Text";
		Label = "Date Updated";
		DBTableName = "TDCRL";
	}
      
             
	OUT MIR-DCRL-PAYE-STAT-CD
	{
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "DCRL-PAYE-STAT-CD";
		SType = "Text";
		Label = "Payee Status";
		DBTableName = "TDCRL";
	}
      

	OUT MIR-DCRL-INDV-SUR-NM 
	{
	        MixedCase;
		Length = "25";
		SType = "Text";
		Label = "Kanji Last Name";
		DBTableName = "TDCRL";
	}

	OUT MIR-DCRL-INDV-GIV-NM 
	{
	        MixedCase;	
		Length = "25";
		SType = "Text";
		DBTableName = "TDCRL";
		Label = "Kanji First Name";
	}

	OUT MIR-DCRL-CO-NM 
	{
	        MixedCase;		
		Length = "50";
		SType = "Text";
		DBTableName = "TDCRL";
		Label = "Company Kanji Name";
	}
	
#MP287A CHANGES STARTS HERE	
	OUT MIR-INDV-KA-SUR-NM 
	{
	        MixedCase;
		Length = "25";
		SType = "Text";
		Label = "Kana Last Name";
		DBTableName = "TDCRL";
	}

	OUT MIR-INDV-KA-GIV-NM 
	{
	        MixedCase;	
		Length = "25";
		SType = "Text";
		DBTableName = "TDCRL";
		Label = "Kana First Name";
	}

	OUT MIR-CO-KA-NM 
	{
	        MixedCase;		
		Length = "50";
		SType = "Text";
		DBTableName = "TDCRL";
		Label = "Kana Kanji Name";
	}
	
	OUT MIR-CLI-SEX-CD
	{
	        Length = "40";
	        CodeSource = "DataModel";
	        CodeType = "CLI-SEX-CD";
	        SType = "Text";
	        Label = "Sex";
	        DBTableName = "TDCRL";
	 }	

	
	OUT MIR-CLI-BTH-DT 
	{
	        MixedCase;		
		Length = "10";
		SType = "Text";
		DBTableName = "TDCRL";
		Label = "Payee Birth Date";
	}	
#MP287A CHANGES ENDS HERE	
	OUT MIR-DCRL-INSRD-REL-CD 
	{
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Text";
		Label = "Relation to Beneficiary";
		DBTableName = "TDCRL";
	}


        OUT MIR-DCRL-SEND-PMT-NOTI-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Send Notice";
		DBTableName = "TDCRL";
	}

        OUT MIR-DCRL-ADDR-LOC-CD
	{
		Length = "8";
		SType = "Text";
		Label = "Address Code";
		DBTableName = "TDCRL";
	}

     	
	OUT MIR-DCRL-PSTL-CD 
	{
		Length = "9";
		SType = "Text";
		Label = "Postal Code";
		DBTableName = "TDCRL";
	}
           
#IPCA02 CHANGES START HERE
        
        OUT MIR-TAX-TYP-CD
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "PAYE-TAX-TYP-CD";
		SType = "Text";
		Label = "Display Tax Information";
	}

#IPCA02 CHANGES END HERE

	OUT MIR-DCRL-SAMAKATA-BU-TXT 
	{
		MixedCase;	
		Length = "72";
		SType = "Text";
		Label = "Samakata-bu";
		DBTableName = "TDCRL";
	}           
           
	OUT MIR-DCRL-KJ-ADDR-TXT 
	{
		DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Address";
		DBTableName = "TDCRL";
	}  

	OUT MIR-PREM-ACUM-AMT
	{
#M245B2 CHANGES START HERE	
#	       Length = "15";
	       Length = "16"; 
#M245B2 CHANGES END HERE	       
	       SType = "Currency";
	       Label = "Taxable Premium Paid";
	       DBTableName = "TDCRL";
        }
        OUT MIR-EXPL-RMRK-TXT
	
	{
		Length = "120";
		SType = "Text";
		Label = "Explanatory Remarks";
		DBTableName = "TDCRL";
	}   
	        
	OUT MIR-BNK-ID
	{
		Length = "4";
		SType = "Text";
		Label = "Current Bank Number";
		DBTableName = "TDCRL";
	}

        OUT MIR-BNK-NM
	{
		Length = "36";
		SType = "Text";
		Label = "Current Bank Name";
		DBTableName = "TBNKB";
	}
    
	OUT MIR-BNK-BR-ID
	{
		Length = "3";
		SType = "Text";
		Label = "Current Branch Number";
		DBTableName = "TDCRL";
	}
           
    
             OUT MIR-BNK-BR-NM
	{
	        Length = "36";
		SType = "Text";
		Label = "Current Branch Name";
		DBTableName = "TBNKB";
		
	}


             OUT MIR-DCRL-BNK-ACCT-ID
	{
#* M245K3 CHANGES STARTS HERE	
#*		Length = "7";
                Length = "17";
#* M245K3 CHANGES ENDS HERE                
		SType = "Text";
		Label = "Current Account Number";
		DBTableName = "TDCRL";
	}
	
             OUT MIR-DCRL-ACCT-HLDR-NM
        {
	        MixedCase;	
                Length = "50";
                SType = "Text";
                Label = "Current Accountholder Name";
                DBTableName = "TDCRL";
        }   


	    OUT MIR-DCRL-ACCT-TYP-CD 
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
		DBTableName = "TDCRL";
	}
#M245B2 CHANGES START HERE	
	INOUT MIR-POL-CRCY-CD
	        {     
	 	        Length = "2";
	                SType = "Hidden";
		        Label = "Currency";
	         }
#M245B2 CHANGES END HERE
#Q52972 CHANGES START HERE
        IN MIR-PAYO-JPY-BNFT-CD
        {     
                Length = "1";
                SType = "Hidden";
                Label = "JPY benefit indicator";
        }
        IN MIR-PREV-PAYO-JPY-BNFT-CD
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Previous JPY benefit indicator";
        }
#Q52972 CHANGES END HERE
#Q57608 STARTS HERE
        INOUT MIR-MRF-IND
        {     
                Length = "1";
                SType = "Hidden";
                Label = "MRF Indicator";
        }
        INOUT MIR-PREV-MRF-IND
        {     
                Length = "1";
                SType = "Hidden";
                Label = "Previous MRF Indicator";
        }
#Q57608 ENDS HERE
}
