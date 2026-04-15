#<HEADER>
#<DESCRIPTION>
#Outbound Handler Mainline
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
#  (C) Copyright 2005-2006 Electronic Data Systems LLC.
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
#6.7
#</RELEASE>
#<NUMBER>
#028458
#</NUMBER>
#<COMMENT>
#INGENIUM to Pathfinder Integration
#</COMMENT>
#</HISTORY>
#<HISTORY>
#<RELEASE>
#7.0
#</RELEASE>
#<NUMBER>
#034010
#</NUMBER>
#<COMMENT>
#Changes required for PF3.2 Upgrade
#</COMMENT>
#</HISTORY>
#</HEADER>
# .
# .          This flow will call the appropriate Outbound handler flow
# .          based on the External SystemID value and FunctionID.
# .          and possibly return a TXLife document, along with instructions
# .          for the PathFinder Client.
# .
# Skip Epilog and Prolog
PROCESS TCMainOut
{
	ATTRIBUTES
	{
		SkipEpilog;
		SkipProlog;
	}
	VARIABLES
	{
		# This input variable contains an XML formatted string in INGENIUM doucment format.
		# Note that there could be more than one request in the XML string.
		# Sample INGENIUM XML Document:
		# <Request>
		# <PathFinderConnector>
		# <FunctionID>AgentLicenseCheck</FunctionID>
		# <ExternalSystemID>FA</ExternalSystemID>
		# ....
		# </PathFinderConnector>
		# <IngeniumData>
		# .....
		# </IngeniumData>
		# ...
		# <IngeniumData>
		# .....
		# </IngeniumData>
		# </Request>
		IN INGENIUMRequests;
		# MappedResponses contains the request document.  Applies to Transmittal type.
		OUT MappedResponses;
		# ResponseAction - action to take with MappedResponses document.
		# WRITE = write to MappedRespones to queue.  Use MQ-ID as the Message Selector.
		# NOACTION = do nto write to queue, just check return code.
		OUT ResponseAction;
		# MQ-ID - Message Selector, that is, message-id to to use when writing MappedRespones to queue.
		OUT MQ-ID;
		# This output variable contains an XML formatted string with all TxLife responses.
		# But is not used for Transmittal transactions.
		OUT INGENIUMResponses;
		# return code from processing
		OUT LTX-RETURN-CD;

	}

	# This field determines whether to do 1 of 3 things for TRANSACT type messages.
	# "X" Send XML to an eXternal webservice to obtain a response
	# "I" Send XML to an Internal webservice to obtain a response
	# "T" Send XML to a subflow to get a response
	GLOBAL-perform-TRANSACT-type-cd = "X";
	# This field determines whether to do 1 of 2 things for TRANSMITTAL type messages.
	# "X" Send XML request to an eXternal webservice
	# "Q" Return an XML request back to PathFinder Client, in the MappedRespones variable
	GLOBAL-perform-TRANSMITTAL-type-cd = "Q";
	# This field is used for debugging.
	# TRACE statements are activated.
	# Values are "Y" = yes, and "N" = no.
	GLOBAL-test-ind = "Y";
	# Initialization
	LTX-RETURN-CD = "00";
	MappedResponses = " ";
	ResponseAction = "NOACTION";
	MQ-ID = " ";

	# Custom function call. Converts part of the composite INGENIUM XML request to structured
	# data. All elements below Request.IngeniumData that have children will be left as XML strings.

	INGDocument = fromXMLgeneric(INGENIUMRequests, "PFC");
		TRACE("INGDocument..." +INGDocument);

	X1Request = SUBSTRING(INGENIUMRequests, 1, 38);
	X2Request = SUBSTRING(INGENIUMRequests, 327, 422);

	X1Document = X1Request + X2Request;
	

	IF GLOBAL-test-ind == "Y"
	{
		X1SystemId = X1Document.Request.PathFinderConnector.ExternalSystemId;	

	}


	# Dynamically create the sub-flow name by extracting External SystemID and the FunctionID.
	# Prefix with 'TC' and append with 'OutHandler'.
	# For example, TCFAAgentLicenseCheckOutHandler.f
	blankPosition = FIND(INGDocument.Request.PathFinderConnector.ExternalSystemId, " ");
	IF blankPosition == 0
	{
		externalSystemId = INGDocument.Request.PathFinderConnector.ExternalSystemId;
	}
	ELSE
	{
		externalSystemId = SUBSTRING(INGDocument.Request.PathFinderConnector.ExternalSystemId, 1, blankPosition - 1);
	}

	blankPosition = FIND(INGDocument.Request.PathFinderConnector.FunctionId, " ");
	IF blankPosition == 0
	{
		functionId = INGDocument.Request.PathFinderConnector.FunctionId;
	}
	ELSE
	{
		functionId = SUBSTRING(INGDocument.Request.PathFinderConnector.FunctionId, 1, blankPosition - 1);
	}

	handlerFlowName = "TC" + externalSystemId + functionId + "OutHandler";


	# PathFinderConnector group applies to all requests.
	pfcConnector = toXMLgeneric(INGDocument.Request.PathFinderConnector, "PathFinderConnector");
	# Determine the number of transactions in the current composite request.
	requestCount = INGDocument.Request.IngeniumData[0];
	requestIndex = 1;
	# Iterate and process the requests one by one
	WHILE (requestIndex <= requestCount)
	{
		# The request is converted back to an XML String. This simplifies the
		# interface to the handler flow but has the downside or requiring some
		# redundant parsing in the handler flow.
		TRACE("INGDocument..." +INGDocument);
		TRACE("INGDocument.Request.IngeniumData[requestIndex]..." +INGDocument.Request.IngeniumData[requestIndex]);

		request = toXMLgeneric(INGDocument.Request.IngeniumData[requestIndex], "IngeniumData");

		TRACE("INGDocument..." +INGDocument);
		IF GLOBAL-test-ind == "Y"
		{
			TRACE("request=" + request);
		}

		# Invoke the handler flow passing in the request and retrieve the
		# response
		STEP HandleIngeniumTransaction
		{
			USES PROCESS handlerFlowName;
			request -> request;
			#X1Document -> request;
			pfcConnector -> pfcConnector;
			response <- response;
			ResponseAction <- ResponseAction;
			MQ-ID <- MQ-ID;
		}

		# Exit, if system error occured
		IF LTX-RETURN-CD != "00"
		{
			INGENIUMResponses = "";
			EXIT;

		}

		# Package the individual responses in the composite response message
		IF INGDocument.Request.PathFinderConnector.Message == "Transact"
		{
			responses[requestIndex] = fromXMLgeneric(response, "PFC");
		}
		ELSE
		{
			responses[requestIndex] = response;
		}

		requestIndex = requestIndex + 1;
	}

	# Converts the responses structured data entity to XML string.
	# Currently, only support for 1 response back to INGENIUM.
	IF INGDocument.Request.PathFinderConnector.Message == "Transact"
	{
		INGENIUMResponses = toXMLgeneric(responses[1], "Response");
		#INGENIUMResponses = toXMLgeneric(responses[1], "IngeniumData");


		# Transform string into INGENIUM format by applying stylesheet
		#INGENIUMResponses = TRANSFORM(INGENIUMResponses, "INGENIUMResponses.xsl");


		#INGENIUMResponses = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + INGENIUMResponses;


		IF GLOBAL-test-ind == "Y"
		{
			TRACE("transformed INGENIUM transact response=" + INGENIUMResponses);

		}

	}
	ELSE
	{
		# Transmittals
		MappedResponses = responses[1];

	}

}
