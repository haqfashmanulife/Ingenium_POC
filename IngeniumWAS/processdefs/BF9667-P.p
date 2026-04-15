# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*********************************************************************************
#*  Component:   BF9667-P.p                                                      *
#*  Description: Update payee for a claim                                        * 
#*                                                                               *
#*                                                                               *
#*********************************************************************************
#*  Chg#    Release  Description                                                 *
#*                                                                               *
#*  HCL103  HIN/CL   ADD A PAYEE              (HCL103C)                          *
#*  CCL13   HIN/CL   REMITTANCE BANK ACCOUNTS                                    *
#*********************************************************************************

P-STEP BF9667-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9667";
        BusinessFunctionName = "Update Payee";
        BusinessFunctionType = "Update";
        MirName = "CCWM9667";
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

	IN MIR-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Master Claim ID";
	}
    

         IN  MIR-CLRL-SEQ-NUM
     	{
	  Key;     	
    	  Length = "3";
    	  DBTableName = "TCLRL";
    	   SType = "Text";
    	   Label = "Sequence Number";
    	    Index = "1";
       }     
    
	INOUT MIR-CLMA-CLM-STAT-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLMA-CLM-STAT-CD";
		SType = "Text";
		Label = "Master Claim Status";
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
      
             
	INOUT MIR-CLRL-PAYE-STAT-CD
	{
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLRL-PAYE-STAT-CD";
		SType = "Text";
		Label = "Payee Status";
	}
      

	INOUT MIR-CLRL-INDV-SUR-NM 
	{
	       MixedCase;
		Length = "25";
		SType = "Text";
		Label = "Kanji Last Name";
	}

	INOUT MIR-CLRL-INDV-GIV-NM 
	{
	       MixedCase;	
		Length = "25";
		SType = "Text";
		Label = "Kanji First Name";
	}

	INOUT MIR-CLRL-CO-NM 
	{
	       MixedCase;		
		Length = "50";
		SType = "Text";
		Label = "Company Kanji Name";
	}

	INOUT MIR-CLRL-INSRD-REL-CD 
	{
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Text";
		Label = "Relationship to Insured";
	}


             INOUT MIR-CLRL-SEND-PMT-NOTI-IND
	{
		Length = "1";
		SType = "Indicator";
		Label = "Send Notice";
	}

             INOUT MIR-CLRL-ADDR-LOC-CD
	{
		Length = "8";
		SType = "Text";
		Label = "Address Code";
	}

             INOUT MIR-CLI-CRNT-LOC-CD
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Address Code";
	}

          INOUT MIR-CLI-CTRY-CD
      {
	        Length = "2";
	        CodeSource = "XTAB";
	        CodeType = "CNTRY";
	        DefaultSession = "MIR-USER-SESN-CTRY-CD";
	        SType = "Hidden";
	        Label = "Country";
     }

	
	INOUT MIR-CLRL-PSTL-CD 
	{
		Length = "9";
		SType = "Text";
		Label = "Postal Code";
	}
           

	INOUT MIR-CLRL-SAMAKATA-BU-TXT 
	{
		 MixedCase;	
		Length = "72";
		SType = "Text";
		Label = "Samakata-bu";
	}           
           

	INOUT MIR-CLRL-KJ-PREFCT-TXT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Text";
		Label = "Prefecture";
	}

	INOUT MIR-CLRL-KJ-CITY-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "City";
	}

	INOUT MIR-CLRL-KJ-NGHBRHD-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "Neighbourhood";
	}
           
	INOUT MIR-CLRL-KJ-ADDR-TXT 
	{
		DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Complete Address";
	}           
           
           
	INOUT MIR-BNK-ID
	{
		Length = "4";
		SType = "Text";
		Label = "Current Bank Number";
	}

    
           
        INOUT MIR-BNK-NM
	{
		DisplayOnly;
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
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Current Branch Name";
	}


             INOUT MIR-CLRL-BNK-ACCT-ID
	{
		Length = "7";
		SType = "Text";
		Label = "Current Account Number";
	}
	
             INOUT MIR-CLRL-ACCT-HLDR-NM
        {
	       MixedCase;	
                Length = "50";
                SType = "Text";
                Label = "Current Accountholder Name";
        }   


	INOUT MIR-CLRL-ACCT-TYP-CD 
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
	}

}
