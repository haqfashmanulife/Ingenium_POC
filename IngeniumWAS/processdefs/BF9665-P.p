# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*********************************************************************************
#*  Component:   BF9665-P.p                                                      *
#*  Description: Update payee for a claim                                        * 
#*                                                                               *
#*                                                                               *
#*********************************************************************************
#*  Chg#    Release  Description                                                 *
#*                                                                               *
#*  HCL103  HIN/CL   ADD A PAYEE                                 (HCL103C)       *
#*  CCL13   HIN/CL   REMITTANCE BANK ACCOUNTS                                    *
#*********************************************************************************

P-STEP BF9665-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9665";
        BusinessFunctionName = "Retrieve Payee";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9665";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


	IN MIR-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Master Claim ID";
	}
    
        IN MIR-CLRL-REL-TYP-CD 
   	{
		Key;
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "Relation Type Code";
	} 
         IN  MIR-CLRL-SEQ-NUM
     	{
    	  Length = "3";
    	  DBTableName = "TCLRL";
    	   SType = "Text";
    	   Label = "Sequence Number";
    	    Index = "1";
       }     
    
	OUT MIR-CLMA-CLM-STAT-CD 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "DataModel";
		CodeType = "CLMA-CLM-STAT-CD";
		SType = "Text";
		Label = "Master Claim Status";
	}

        
	OUT MIR-PREV-UPDT-USER-ID 
	{
		DisplayOnly;
		Length = "8";
		Index = "1";
		SType = "Text";
		Label = "Last Updated By";
	}

	OUT MIR-PREV-UPDT-DT
	{
		DisplayOnly;
		Length = "10";
		Index = "1";
		SType = "Text";
		Label = "Date Updated";
	}
      
             
	OUT MIR-CLRL-PAYE-STAT-CD
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLRL-PAYE-STAT-CD";
		SType = "Text";
		Label = "Payee Status";
	}
      

	OUT MIR-CLRL-INDV-SUR-NM 
	{
		DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "Kanji Last Name";
	}

	OUT MIR-CLRL-INDV-GIV-NM 
	{
		DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "Kanji First Name";
	}

	OUT MIR-CLRL-CO-NM 
	{
		DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Company Kanji Name";
	}

	OUT MIR-CLRL-INSRD-REL-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Text";
		Label = "Relationship to Insured";
	}


             OUT MIR-CLRL-SEND-PMT-NOTI-IND
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Send Notice";
	}

             OUT MIR-CLRL-ADDR-LOC-CD
	{
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Address Code";
	}

             OUT MIR-CLI-CRNT-LOC-CD
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Address Code";
	}

	OUT MIR-CLRL-PSTL-CD 
	{
		DisplayOnly;
		Length = "9";
		SType = "Text";
		Label = "Postal Code";
	}
           

	OUT MIR-CLRL-SAMAKATA-BU-TXT 
	{
		DisplayOnly;
		Length = "72";
		SType = "Text";
		Label = "Samakata-bu";
	}           
           

	OUT MIR-CLRL-KJ-PREFCT-TXT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Text";
		Label = "Prefecture";
	}

	OUT MIR-CLRL-KJ-CITY-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "City";
	}

	OUT MIR-CLRL-KJ-NGHBRHD-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "Neighbourhood";
	}
	
	OUT MIR-CLRL-KJ-ADDR-TXT 
	{
		DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Complete Address";
	}           
           
	OUT MIR-BNK-ID
	{
		Length = "4";
		SType = "Text";
		Label = "Current Bank Number";
	}

    
           
         OUT MIR-BNK-NM
	{
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Current Bank Name";
	}
    
	OUT MIR-BNK-BR-ID
	{
		Length = "3";
		SType = "Text";
		Label = "Current Branch Number";
	}
           
    
             OUT MIR-BNK-BR-NM
	{
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Current Branch Name";
	}


             OUT MIR-CLRL-BNK-ACCT-ID
	{
		Length = "7";
		SType = "Text";
		Label = "Current Account Number";
	}
	
             OUT MIR-CLRL-ACCT-HLDR-NM
        {
                Length = "50";
                SType = "Text";
                Label = "Current Accountholder Name";
        }   


	OUT  MIR-CLRL-ACCT-TYP-CD 
	{
		Length = "3";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Text";
		Label = "Account Type";
	}


}
