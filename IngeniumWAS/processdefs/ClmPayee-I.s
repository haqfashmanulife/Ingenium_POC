# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   ClmPayee-I.s                                                  *
#*  Description:    DATA ENTRY SCEEN FOR UPDATE A PAYEE                        *                               
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   ADD A PAYEE                               (HCL103C)       *
#*  HCCL05  HIN/CL   Pick-up facility (add Historical Claim Indicator)         *
#*  CCL13   HIN/CL   REMITTANCE BANK ACCOUNTS                                  *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   **
#*******************************************************************************

S-STEP ClmPayee-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        DelEmptyRows;
        FocusField = "MIR-CLRL-INDV-SUR-NM";
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
	INOUT MIR-CLRL-INDV-SUR-NM 
	{
		Length = "25";
		SType = "Text";
		Label = "Kanji Last Name";
	}

	INOUT MIR-CLRL-INDV-GIV-NM 
	{
		Length = "25";
		SType = "Text";
		Label = "Kanji First Name";
	}

	INOUT MIR-CLRL-CO-NM 
	{
		Length = "50";
		SType = "Text";
		Label = "Company Kanji Name";
	}

	INOUT MIR-CLRL-INSRD-REL-CD 
	{
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		SType = "Selection";
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
                SType = "Selection";
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
                     
	INOUT MIR-BNK-ID
	{
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
    
	INOUT MIR-BNK-BR-ID
	{
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


             INOUT MIR-CLRL-BNK-ACCT-ID
	{
		Length = "7";
		SType = "Text";
		Label = "Current Account Number";
	}
	
             INOUT MIR-CLRL-ACCT-HLDR-NM
        {
                Length = "50";
                SType = "Text";
                Label = "Current Accountholder Name";
        }   


	INOUT MIR-CLRL-ACCT-TYP-CD 
	{
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "FBACC";
		SType = "Selection";
		Label = "Account Type";
	}


}

