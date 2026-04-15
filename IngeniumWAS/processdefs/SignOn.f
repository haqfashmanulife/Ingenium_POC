#<HEADER>
#<DESCRIPTION>
#Modified version of the SignOn flow for LDAP with INGENIUM 6.5 or lower
#</DESCRIPTION>
#<COPYRIGHT>
###############################################################
#  All right, title and interest in and to the software        
#  (the "Software") and the accompanying documentation or      
#  materials (the "Documentation"), including all proprietary  
#  rights, therein including all patent rights, trade secrets, 
#  trademarks and copyrights, shall remain the exclusive       
#  property of Hewlett-Packard Development Company, L.P.         
#  No interest, license or any right respecting the Software      
#  and the Documentation, other than expressly granted in      
#  the Software License Agreement, is granted by implication   
#  or otherwise.                                               
#                                                              
#  (C) Copyright 2006-2010 Hewlett-Packard Development Company, L.P.
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
#PF1.3
#</RELEASE>
#<NUMBER>
#018983
#</NUMBER>
#<COMMENT>
#New for release 1.3
#</COMMENT>
#</HISTORY>
#</HEADER>
PROCESS SignOn
{
	ATTRIBUTES
	{
		SkipProlog;
	}
	VARIABLES
	{
		IN MIR-SECUR-CLAS-ID;
		IN MIR-USER-ID;
		IN MIR-BR-ID;
		IN MIR-USER-RPT-DSTRB-CD;
		IN MIR-CO-ID;
		IN MIR-USER-SESN-CTRY-CD;
		IN MIR-USER-SESN-CRCY-CD;
		IN MIR-USER-SESN-BTCH-NUM;
		IN MIR-USER-SESN-PRCES-DT;
		IN MIR-DV-APPL-STAT-CD;
		IN MIR-USER-SESN-STAT-CD;
		IN MIR-CTRY-DT-FRMT-CD;
		IN MIR-CTRY-DT-SPRT-CD;
		IN MIR-CTRY-LEAD-ZERO-IND;
		IN MIR-CRCY-SYMBL-CD;
		IN MIR-CRCY-THOU-SPRT-CD;
		IN MIR-CRCY-DCML-SPRT-CD;
		IN MIR-CRCY-NEG-PLACE-CD;
		IN MIR-CRCY-PLACE-CD;
		IN MIR-CRCY-SCALE-QTY;
		IN MIR-DV-ISO-DT-FRMT-IND;

	}

	Title = "Start INGENIUM Session";
	TitleBar = "TitleBar";
	TitleBarSize = "70";
	MessageFrame = "MessagesDisp";
	MessageFrameSize = "70";
	ButtonBar = "ButtonBar";
	ButtonBarSize = "40";
	# *****************************************************************
	# Sign On screen - collect userid, password and company code
	# *****************************************************************
	# These values should be set the by the LDAP Authenticator
	#TRACE(MIR-SECUR-CLAS-ID);

	#TRACE(MIR-USER-ID);

	#TRACE(MIR-BR-ID);

	#TRACE(MIR-USER-RPT-DSTRB-CD);

	#TRACE(MIR-CO-ID);

	SaveCoId = MIR-CO-ID;
	SaveCtryCd = MIR-USER-SESN-CTRY-CD;
	SaveCrcyCd = MIR-USER-SESN-CRCY-CD;
	# ****************************************************************
	# Session control - collect new session data, or let user continue
	# ****************************************************************
	MIR-USER-PSWD-TXT = "";
	# Providing only the OK button at the signon process.
	# There is no logical place to send the user for a
	# cancellation button.
	STEP SessionValuesInput
	{
		USES S-STEP "BF0061-I";
		STRINGTABLE.IDS_TITLE_BF0061Connect -> Title;
		"ButtonBarOK" -> ButtonBar;
	}

	IF action == "ACTION_LANGCHANGE"
	{
		BRANCH SessionValuesInput;
	}

	IF SaveCoId == MIR-CO-ID && SaveCtryCd == MIR-USER-SESN-CTRY-CD && SaveCrcyCd == MIR-USER-SESN-CRCY-CD
	{
		EXIT;

	}

	STEP SessionValuesProcess
	{
		USES P-STEP "BF0061-P";
	}

	IF LSIR-RETURN-CD != "00"
	{
		BRANCH SessionValuesInput;
	}

	# if user had changed any country or currency settings or company
	# settings, a different return code will tell us this.
	# then return the same page back to them to check their batch number.
	# a return code of 03 from the server will tell us that while
	# the process was successful, the input values were changed so that
	# we may re-display the session values to the user (for batch number)
	IF MIR-RETRN-CD != "03"
	{
		MIR-USER-PSWD-TXT = "";
		SaveCoId = MIR-CO-ID;
		SaveCtryCd = MIR-USER-SESN-CTRY-CD;
		SaveCrcyCd = MIR-USER-SESN-CRCY-CD;
		BRANCH SessionValuesInput;
	}

}
