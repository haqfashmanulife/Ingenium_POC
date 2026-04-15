# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   ClmPayee-O.s                                                  *
#*  Description:    DATA ENTRY SCEEN FOR UPDATE A PAYEE                        * 
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   ADD A PAYEE                               (HCL103C)       *
#*  HCCL05  HIN/CL   Pick-up facility (add Historical Claim Indicator)         *
#*  CCL13   HIN/CL   REMITTANCE BANK ACCOUNTS                                  *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   **
#*******************************************************************************

S-STEP ClmPayee-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
        DelEmptyRows;
        FocusField = "confirmButton";
        FocusFrame = "ButtonFrame";
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

        
	IN MIR-PREV-UPDT-USER-ID 
	{
		DisplayOnly;
		Length = "8";
		Index = "1";
		SType = "Text";
		Label = "Last Updated By";
	}

	IN MIR-PREV-UPDT-DT
	{
		DisplayOnly;
		Length = "10";
		Index = "1";
		SType = "Text";
		Label = "Date Updated";
	}
      
             
	IN MIR-CLRL-PAYE-STAT-CD
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLRL-PAYE-STAT-CD";
		SType = "Text";
		Label = "Payee Status";
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
	IN MIR-CLRL-INDV-SUR-NM 
	{
	        DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "Kanji Last Name";
	}

	IN MIR-CLRL-INDV-GIV-NM 
	{
		DisplayOnly;
		Length = "25";
		SType = "Text";
		Label = "Kanji First Name";
	}

	IN MIR-CLRL-CO-NM 
	{
	        DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Company Kanji Name";
	}

	IN MIR-CLRL-INSRD-REL-CD 
	{
	        DisplayOnly;
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		Label = "Relationship to Insured";
	}


             IN MIR-CLRL-SEND-PMT-NOTI-IND
	{
	        DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Send Notice";
	}

             IN MIR-CLRL-ADDR-LOC-CD
	{
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Address Code";
	}

             IN MIR-CLI-CRNT-LOC-CD
	{
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Text";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
        }
        
            IN MIR-CLI-CTRY-CD
	    {
	        Length = "2";
	        CodeSource = "XTAB";
	        CodeType = "CNTRY";
	        DefaultSession = "MIR-USER-SESN-CTRY-CD";
	        Label = "Country";
	    }


	IN MIR-CLRL-PSTL-CD 
	{
	        DisplayOnly;
		Length = "9";
		SType = "Text";
		Label = "Postal Code";
	}
           

	IN MIR-CLRL-SAMAKATA-BU-TXT 
	{
	        DisplayOnly;
		Length = "72";
		SType = "Text";
		Label = "Samakata-bu";
	}           
           

	IN MIR-CLRL-KJ-PREFCT-TXT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Text";
		Label = "Prefecture";
	}

	IN MIR-CLRL-KJ-CITY-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "City";
	}

	IN MIR-CLRL-KJ-NGHBRHD-TXT 
	{
		DisplayOnly;
		Length = "30";
		SType = "Text";
		Label = "Neighbourhood";
	}
           
 	IN MIR-CLRL-KJ-ADDR-TXT 
	{
		DisplayOnly;
		Length = "50";
		SType = "Text";
		Label = "Complete Address";
	}           
                     
	IN MIR-BNK-ID
	{
	        DisplayOnly;
		Length = "4";
		SType = "Text";
		Label = "Current Bank Number";
	}

    
           
         IN MIR-BNK-NM
	{
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Current Bank Name";
	}
    
	IN MIR-BNK-BR-ID
	{
		DisplayOnly;
		Length = "5";
		SType = "Text";
		Label = "Current Branch Number";
	}
           
    
             IN MIR-BNK-BR-NM
	{
		DisplayOnly;
		Length = "36";
		SType = "Text";
		Label = "Current Branch Name";
	}


             IN MIR-CLRL-BNK-ACCT-ID
	{
	        DisplayOnly;
		Length = "7";
		SType = "Text";
		Label = "Current Account Number";
	}
	
             IN MIR-CLRL-ACCT-HLDR-NM
        {
                DisplayOnly;
                Length = "50";
                SType = "Text";
                Label = "Current Accountholder Name";
        }   


	IN  MIR-CLRL-ACCT-TYP-CD 
	{
		DisplayOnly;
                 Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		Label = "Account Type";
	}


}

