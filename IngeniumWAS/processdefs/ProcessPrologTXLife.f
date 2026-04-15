#<HEADER>
#<DESCRIPTION>
#TXLife Process Prolog
#</DESCRIPTION>
#<COPYRIGHT>
###############################################################
#  All right, title and interest in and to the software        
#  (the "Software") and the accompanying documentation or      
#  materials (the "Documentation"), including all proprietary  
#  rights, therein including all patent rights, trade secrets, 
#  trademarks and copyrights, shall remain the exclusive       
#  property of Electronic Data Systems LLC.            
#  No interest, licence or any right respecting the Software      
#  and the Documentation, other than expressly granted in      
#  the Software Licence Agreement, is granted by implication   
#  or otherwise.                                               
#                                                              
#  (C) Copyright 2006-2008 Electronic Data Systems LLC.
#  All rights reserved.                                        
#                                                              
#  Each Party agrees to (a) comply with all applicable laws    
#  regarding export or re-export of the Confidential           
#  Information, technical data, or derivatives of such items;  
#  and (b) not to export or re-export any such items to a      
#  destination or end user for which applicable law, including 
#  Canadian or U.S. law, requires an export license or other   
#  approval without first having obtained such license or      
#  approval.                                                   
###############################################################
#</COPYRIGHT>
#<HISTORY>
#<RELEASE>
#3.2
#</RELEASE>
#<NUMBER>
#028268
#</NUMBER>
#<COMMENT>
#New for release 3.2
#</COMMENT>
#</HISTORY>
#</HEADER>
# Executes both the signon and the process prolog for a TXLife flow
PROCESS ProcessPrologTXLife
{
	VARIABLES
	{
		IN UserAuthRequest;
		IN MIR-CO-ID;

		OUT LSIR-RETURN-CD;

	}

	# *****************************************************************
	# Sign On - provide userid, password and company code
	# *****************************************************************
	# process code for sign on is different from other processes
	# this process code bypasses all normal security checking.  Since
	# the user has not yet signed on to INGENIUM, we cannot perform
	# these checks.

	#Convert the UserAuthRequest from XML to structued data
	UserAuthorization = fromTXLifeXML(UserAuthRequest);

	#Assign Userid and password to MIR fields
	MIR-USER-ID = UserAuthorization.TXLife.UserAuthRequest.UserLoginName;
	MIR-USER-PSWD-TXT = UserAuthorization.TXLife.UserAuthRequest.UserPswd.Pswd;

	LSIR-PRCES-CD = "1";
	STEP LoginProcess
	{
		USES P-STEP "BF0064-P";
	}

	# check to see if the sign on process failed(userid, password, or
	# company code error).
	IF LSIR-RETURN-CD != "00"
	{
		TERMINATE;

	}

	# If the user's password has expired, set the LSIR Return Code and then end the flow.
	IF MIR-DV-PSWD-XPRD-IND == "Y"
	{
		# set the return code to LSIR-SECURITY-CHECK-FAILED
		LSIR-RETURN-CD = "09";

		# End the flow
		TERMINATE;

	}

	# ********************************************************************
	# Sign On Connect - Change Country Code and Currency Code if required
	# ********************************************************************
	# If the Country Code or Currency Code submitted with the request are different
	# from what was defaulted, process BF0061 SignOn Connect to update them.

	IF UserAuthorization.TXLife.UserAuthRequest.OLifEExtension.SignOnCountryTC != "" || UserAuthorization.TXLife.UserAuthRequest.OLifEExtension.SignOnCurrencyTC != ""
	{
		# Translate and move Country Code and Currency Code to temporary variables
		requestedCountryCode = fromTXLife(UserAuthorization.TXLife.UserAuthRequest.OLifEExtension.SignOnCountryTC, "CountryTC");
		requestedCurrencyCode = fromTXLife(UserAuthorization.TXLife.UserAuthRequest.OLifEExtension.SignOnCurrencyTC, "CurrencyTypeCode");

		IF requestedCountryCode != MIR-USER-SESN-CTRY-CD || requestedCurrencyCode != MIR-USER-SESN-CRCY-CD
		{

			# Move the Country Code and Currency Code values from the temporary variables into the MIR fields.
			MIR-USER-SESN-CTRY-CD = requestedCountryCode;
			MIR-USER-SESN-CRCY-CD = requestedCurrencyCode;

			STEP SessionValuesProcess
			{
				USES P-STEP "BF0061-P";
			}

			# check to see if the sign on CONNECT process failed(userid, password, or
			# company code error).
			IF LSIR-RETURN-CD != "00"
			{
				TERMINATE;
	
			}
		}
	}

	# *****************************************************************
	# Process Prolog
	# *****************************************************************

	# Process code for authorization is 2
	LSIR-PRCES-CD = "2";

	# Get system authorization
	STEP GetAuthorization
	{
		USES P-STEP "BF0010-P";
	}

	# If the authorization failed, write error messages to PathFinder log file and terminate the requested process.
	IF LSIR-RETURN-CD != "00"
	{
		TRACE("Process Prolog BF0010-P failed. Userid: " + SESSION.MIR-USER-ID + " BPF-ID: " + SESSION.LSIR-BPF-ID);
		TRACE("The following messages were produced;");
		TRACE(MESSAGES-T[1]);
		TRACE(MESSAGES-T[2]);
		TRACE(MESSAGES-T[3]);
		TRACE(MESSAGES-T[4]);
		TRACE(MESSAGES-T[5]);

		TERMINATE;
	}

	# If the system date change warning message is generated by BF0010
	# MIR-RETRN-CD 07 will be returned. It this case a page can't be displayed
	# so we can only clear the messages and continue.
	MESSAGES-T[0] = "";
}
