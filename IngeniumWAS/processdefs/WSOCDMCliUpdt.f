#<HEADER>
#<DESCRIPTION>
#Headless Flow For OCDM Web Services Client Update Processing
#</DESCRIPTION>
#<COPYRIGHT>
######################################################################
# ITEM#   DATE     AUTH.  DESCRIPTION
# 27550A  11SEP23  CTS    Added new OCDM webservices Client Update
# 23823C  29APR24  CTS    CWS Email Address 
######################################################################
#</COPYRIGHT>
#<HISTORY>
#<RELEASE>
#4.0.2
#</RELEASE>
#<NUMBER>
#2023SEP12
#</NUMBER>
#<COMMENT>
# Initial Version
#</COMMENT>
#</HISTORY>
#</HEADER>

PROCESS WSOCDMCliUpdt
{
	
	ATTRIBUTES
	{
		Epilog = "ProcessEpilogWS";
		Prolog = "ProcessPrologWS";
	}

	PARAMETERS
	{
		RequestParameters
		{
			
			IN Agent;
			IN RequestorType;
            IN CliID;
            IN CliRetrnMailInd;
# 23823C CHANGES START HERE			
            IN CWSeMailaddress;	
# 23823C CHANGES END HERE			
                        
		}	
		
		ResponseDetails
		{
		        OUT CliID;
		        OUT CliRetrnMailInd;
# 23823C CHANGES START HERE
		        OUT CWSeMailaddress;
# 23823C CHANGES END HERE
		        OUT ReturnCode;
		}
        }		 

# TRANSLATE THE INPUT FIELDS INTO MIR FIELDS

	MIR-RQSTR-ID = RequestParameters.Agent;
	MIR-RQSTR-TYP-CD = RequestParameters.RequestorType;
	MIR-CLI-ID = RequestParameters.CliID;
	MIR-RETRN-MAIL-IND = RequestParameters.CliRetrnMailInd;
    MIR-WEB-SERV-CALL-IND = "Y";
	
# Retrieve the Client record 	
	STEP Retrieve
	{
		USES P-STEP "BF1220-P";
	}	
	
	ResponseDetails.ReturnCode = LSIR-RETURN-CD;
	
	IF LSIR-RETURN-CD != "00" 
	{
		EXIT;
	}
			
# Update the Client Information

	MIR-RETRN-MAIL-IND = RequestParameters.CliRetrnMailInd;
# 23823C CHANGES START HERE	
	MIR-CWS-EMAIL-ADDR-TXT = RequestParameters.CWSeMailaddress;
# 23823C CHANGES END HERE	
        MIR-WEB-SERV-CALL-IND = "Y";
	
	STEP Update
	{
	    USES P-STEP "BF1222-P";
	}
	          
	
	ResponseDetails.ReturnCode = LSIR-RETURN-CD;
        
        IF LSIR-RETURN-CD != "00" 
	{
	   EXIT;
	}

# TRANSLATE THE MIR FIELDS INTO OUTPUT FIELDS

        ResponseDetails.CliID     =  MIR-CLI-ID;
        ResponseDetails.CliRetrnMailInd   =  MIR-RETRN-MAIL-IND;
# 23823C CHANGES START HERE		
        ResponseDetails.CWSeMailaddress   =  MIR-CWS-EMAIL-ADDR-TXT;
# 23823C CHANGES END HERE		
        
}