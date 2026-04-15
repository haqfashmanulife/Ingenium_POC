#<HEADER>
#<DESCRIPTION>
#TXLife Dispatcher
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
#  (C) Copyright 2004-2008 Electronic Data Systems LLC.
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
################################################################
#</COPYRIGHT>
#<HISTORY>
#<RELEASE>
#WS1.0
#</RELEASE>
#<NUMBER>
#25703
#</NUMBER>
#<COMMENT>
#New for WebServices 1.0
#</COMMENT>
#</HISTORY>
#<HISTORY>
#<RELEASE>
#PF3.2
#</RELEASE>
#<NUMBER>
#31648
#</NUMBER>
#<COMMENT>
#Changes toXML fromXML to toTXLifeXML fromTXLifeXML
#</COMMENT>
#</HISTORY>
#</HEADER>
# .
# .
# .          This flow will call the appropriate handler flow based on the TransType or TransSubType value.
# .
# .
PROCESS TXLifeDispatcher
{
	ATTRIBUTES
	{
		Epilog = "ProcessEpilogHeadless";
		Prolog = "ProcessPrologTXLife";
	}
	VARIABLES
	{
		# This input variable contains an XML formatted string with all TxLife requests.
		IN TxLifeRequests;
		# This output variable contains an XML formatted string with all TxLife responses.
		OUT TxLifeResponses;

	}

	# Custom function call. Converts part of the composite TxLife request to structured
	# data. All elements below TxLife.TxLifeRequest that have children (for example OlifE)
	# will be left as XML strings.
	TxLifeTransactions = fromTXLifeXML(TxLifeRequests);
	# Determine the number of transactions in the current composite request.
	requestCount = TxLifeTransactions.TXLife.TXLifeRequest[0];
	requestIndex = 1;
	# Iterate and process the requests one by one
	WHILE (requestIndex <= requestCount)
	{
		# Extract the flow name. It is assumed that the handler flow name is the
		# same as the transaction type or the transaction subtype with the word Handler appended.
		# For example, TC103Handler.f
		# Check to see if the TransSubType values exists, if it does we will use that to built the
		# flow name, otherwise we will use the TransType value.
		IF TxLifeTransactions.TXLife.TXLifeRequest[requestIndex].TransSubType != ""
		{
			handlerFlowName = "TC" + TxLifeTransactions.TXLife.TXLifeRequest[requestIndex].TransSubType + "Handler";
		}
		ELSE
		{
			handlerFlowName = "TC" + TxLifeTransactions.TXLife.TXLifeRequest[requestIndex].TransType + "Handler";
		}

		# The individual request is assigned to a variable.
		request = TxLifeTransactions.TXLife.TXLifeRequest[requestIndex];
		# Invoke the handler flow passing in the request and retrieving the
		# response
		STEP HandleTxLifeTransaction
		{
			USES PROCESS handlerFlowName;
			request -> request;
			response <- response;
		}

		# Package the individual responses in the composite response message
		responses.TXLife.TXLifeResponse[requestIndex] = response;
		# update the user authorize response result in the composite response message
		# responses.TXLife.UserAuthResponse.TransResult.ResultCode = responses.TXLife.TXLifeResponse[requestIndex].TransResult.ResultCode;
		# this willbe set by PathFinder based on the result of the sign-on
		requestIndex = requestIndex + 1;
	}

	# Convert the responses structured data entity to XML.
	TxLifeResponses = toTXLifeXML(responses);
}
