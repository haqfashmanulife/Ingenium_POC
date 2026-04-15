#<HEADER>
#<DESCRIPTION>
#PCalphaSearchRequest SCV Limit check
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
# .          --- TCPCalphaSearchRequestOutHandler: SCV Limit check ---
# .
# .          This transaction will take an INGENIUM XML request and perform
# .          the following:
# .          2.  Send the input XML document to the external system, IBM iLog, via a webservice.
# .          3.  Receive an iLog Response XML document from the IBM rules engine.
# .          4.  Format an INGENIUM XML response, and return it back to the main flow.
# .
PROCESS TCIBalphasearchOutHandler
{
	VARIABLES
	{
		# This input variable contains an individual INGENIUM request in XML string format.
		IN request;

		# This input variable contains the INGENIUM PathFinderConnector node in XML string format.
		IN pfcConnector;

		# This output variable contains an individual INGENIUM response in XML string format.
		OUT response;

		# return code from processing
		INOUT LTX-RETURN-CD;

	}

	# Initialization
	response = "";

	# Create data structure from XML string
	INGRequest = fromXMLgeneric(request, "PFC");
			TRACE(INGRequest);	
	pfcRequest = fromXMLgeneric(pfcConnector, "PFC");
			TRACE(pfcRequest);

	alphaSearchRequest.basicInfo.requestDate = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.basicInfo.requestDate;
	alphaSearchRequest.basicInfo.requestNo = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.basicInfo.requestNo;
	alphaSearchRequest.basicInfo.insertedTimestamp = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.basicInfo.insertedTimestamp;
	alphaSearchRequest.basicInfo.insertEmp = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.basicInfo.insertEmp;
	alphaSearchRequest.basicInfo.insertPG = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.basicInfo.insertPG;
	alphaSearchRequest.basicInfo.channelType = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.basicInfo.channelType;
	alphaSearchRequest.limitCheckInfo.searchType = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.limitCheckInfo.searchType;
	alphaSearchRequest.limitCheckInfo.calcBaseDate = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.limitCheckInfo.calcBaseDate;
	alphaSearchRequest.limitCheckInfo.requestType = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.limitCheckInfo.requestType;
	alphaSearchRequest.limitCheckInfo.nonFaceToFaceFlg = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.limitCheckInfo.nonFaceToFaceFlg;
         # 018396 CHANGES STARTS HERE 
        alphaSearchRequest.largeProductInfo.largeProductDetails.applicationNo = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.applicationNo;
         # 018396 CHANGES ENDS HERE			
	alphaSearchRequest.largeProductInfo.largeProductDetails.largeProductCD = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.largeProductCD;
	alphaSearchRequest.largeProductInfo.largeProductDetails.proposalType = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.proposalType;
	alphaSearchRequest.largeProductInfo.largeProductDetails.prevLargeProductCD = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.prevLargeProductCD;
	alphaSearchRequest.largeProductInfo.largeProductDetails.prevPolicyNo = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.prevPolicyNo;
		
	
	#INGRequest = request;	
			num=INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[1].amountInfo.amountDetails[0];
			TRACE("NUM1                "+num);
			num=INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[2].amountInfo.amountDetails[0];
			TRACE("NUM1                "+num);			
			num=INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[0];
			TRACE("NUM1                "+num);
			
        numRequests = 1;
      WHILE(numRequests<=num)
      {
	# Send request as an webservice or a subflow.  There are 3 possibilities.
	IF GLOBAL-perform-TRANSACT-type-cd == "X"
	{



	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerType = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerType;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerBirthDate = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerBirthDate;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerAge = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerAge;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerGender = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerGender;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerNameKana = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerNameKana;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerNamekanji = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].customerNamekanji;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].insuredSeqNo = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].insuredSeqNo;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].selectionType = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].selectionType;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].occupationCd = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].occupationCd;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].existingMedicalCov= INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].existingMedicalCov;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].existingLifeCov = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].existingLifeCov;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].annualIncome = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].annualIncome;
	
	numAmtRequest=1;
	numAmtInfo=INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[0];
	
	TRACE("numAmtInfo                "+numAmtInfo);
# 109580 CHANGES STARTS HERE	
	TRACE("AMOUNT INFO SINGLE " +INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails.amountSeqNo);
	IF (numAmtInfo != "")
	{	
	     TRACE("INSIDE AMOUNT INFO 1 "+numRequests);
# 109580 CHANGES ENDS HERE	     	
	  WHILE(numAmtRequest<=numAmtInfo )
	   {
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].amountSeqNo = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].amountSeqNo;
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].lcnbAmountType = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].lcnbAmountType;
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].benefitCd = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].benefitCd;
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].riderPlanCd = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].riderPlanCd;
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].amount = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].amount;
	     numAmtRequest = numAmtRequest + 1;	
	  }
# 109580 CHANGES STARTS HERE	  
        }
	IF (numAmtInfo == "")
	{
	     TRACE("INSIDE AMOUNT INFO 2 "+numRequests);	
	    seqn =INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails.amountSeqNo;
	     TRACE("INSIDE AMOUNT INFO 3 "+seqn);	
           IF (seqn != "")
	    {
	     TRACE("INSIDE AMOUNT INFO  "+numRequests);
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].amountSeqNo = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails.amountSeqNo;
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].lcnbAmountType = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails.lcnbAmountType;
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].benefitCd = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails.benefitCd;
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].riderPlanCd = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails.riderPlanCd;
	     alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails[numAmtRequest].amount = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].amountInfo.amountDetails.amount;
	    }
	}
# 109580 CHANGES ENDS HERE	
	numbnfyRequest=1;
	numbnfyInfo=INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[0];
	TRACE("numbnfyInfo                "+numbnfyInfo);
# 109580 CHANGES STARTS HERE	
	IF (numbnfyInfo != "")
	{
# 109580 CHANGES ENDS HERE	
	 WHILE(numbnfyRequest<=numbnfyInfo)
	 {
	    alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiarySeqNo = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiarySeqNo;
	    alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryDOB = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryDOB;
	    alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryGender = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryGender;
	    alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryNameKana = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryNameKana;
	    alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryNameKanji = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryNameKanji;
            numbnfyRequest = numbnfyRequest + 1;
# 109580 CHANGES STARTS HERE	    	
	  }
        }
	IF (numbnfyInfo == "")
	{
	     TRACE("INSIDE bene INFO 2 "+numRequests);	
	    seqn1 =INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails.beneficiarySeqNo;
	     TRACE("INSIDE bene INFO 3 "+seqn1);	
           IF (seqn1 != "")
	    {
	     TRACE("INSIDE bene INFO  "+numRequests);
	    alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiarySeqNo = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails.beneficiarySeqNo;
	    alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryDOB = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails.beneficiaryDOB;
	    alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryGender = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails.beneficiaryGender;
	    alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails[numbnfyRequest].beneficiaryNameKana = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].beneficiaryInfo.beneficiaryDetails.beneficiaryNameKana;
	    }
# 109580 CHANGES ENDS HERE	    
	}
	numparRequest=1;
	numparInfo=INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].parentalInfo.parentalDetails[0];
	TRACE("numparInfo                "+numparInfo);
	WHILE(numparRequest<=numparInfo)
	{
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].parentalInfo.parentalDetails[numparRequest].parentalGuardianDOB = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].parentalInfo.parentalDetails[numparRequest].parentalGuardianDOB;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].parentalInfo.parentalDetails[numparRequest].parentalGuardianGender = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].parentalInfo.parentalDetails[numparRequest].parentalGuardianGender;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].parentalInfo.parentalDetails[numparRequest].parentalGuardianNameKana = INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].parentalInfo.parentalDetails[numparRequest].parentalGuardianNameKana;
	alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].parentalInfo.parentalDetails[numparRequest].parentalGuardianNameKanji= INGRequest.IngeniumData.Envelope.Body.alphaSearchRequest.largeProductInfo.largeProductDetails.customerInfo.customerDetails[numRequests].parentalInfo.parentalDetails[numparRequest].parentalGuardianNameKanji;
	     numparRequest = numparRequest + 1;	
	}
		# eXternal webservice
		IF GLOBAL-test-ind == "Y"
		{
			TRACE("sending webservice REQUEST....");
			TRACE(INGRequest);
			TRACE("requestDate ......" + requestDate);
			TRACE("requestNo ........" + requestNo);
			TRACE("channelType ......" + channelType);
			TRACE("largeProductCD......" +largeProductCD);
			TRACE("nonFaceToFaceFlg...." +nonFaceToFaceFlg);
			TRACE("searchType....      " +searchType);
			TRACE("customerAge....    "+customerAge);
			TRACE("beneficiaryGender....    "+beneficiaryGender);			
		}
	numRequests = numRequests + 1;		
         }
        }
		STEP WebserviceIBalphasearchHandler-P
		{

			USES P-STEP "WebserviceIBalphasearch-P";
			#INGRequest -> request;
			#response <- response;

 			requestDate <- alphaSearchResponse.basicInfoResp.requestDate;
			requestNo <- alphaSearchResponse.basicInfoResp.requestNo;
			insertedTimestamp <- alphaSearchResponse.basicInfoResp.insertedTimestamp;
			insertEmp <- alphaSearchResponse.basicInfoResp.insertEmp;
			checkCode <- alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult.checkCode;
			sumTotalAmount <- alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult.sumTotalAmount;
			errorCode <- alphaSearchResponse.errorInformation.errorCode;
			errorMessage <- alphaSearchResponse.errorInformation.errorMessage;
		}
			TRACE(INGRequest);
			TRACE(GLOBAL-test-ind);			
		IF GLOBAL-test-ind == "Y"
		{
			TRACE("received webservice RESPONSE.");
			TRACE("SCVFetchResult ..." + SCVFetchResult);
			TRACE("SCVInsertResult .." + SCVInsertResult);
			TRACE("errorCode........." + errorCode);
			TRACE("errorMessage......" + errorMessage);
		}
	    ELSE
	    {
		IF (GLOBAL-perform-TRANSACT-type-cd == "I")
		{
			# Internal webservice
			STEP WebservicePCalphaSearchCheckWSHandler-P
			{
				USES P-STEP "WebserviceIBalphasearch-P";
				INGRequest -> request;
				response <- response;
			}

		}
		ELSE
		{
			# call subflow to return response string - CHANGES FOR MP310 TO BE DONE
			STEP TXLifeResponseRulesInquiryProcess
			{
				USES PROCESS "testTCRulesInquiryResponse";
				INGRequest -> request;
				response <- response;
			}

		}

	}


	IF GLOBAL-test-ind == "Y"
	{
		#TRACE("TXLife response before stylesheet=" + TXLifeResponseString);
		#TRACE("webservices response =" + response);

		TRACE("ws-return-cd=" + ws-return-cd);

	}

	# Return code for the entire Response, not just each response
	IF ws-return-cd == "00"
	{
		LTX-RETURN-CD = "00";
	}
	ELSE
	{
		LTX-RETURN-CD = ws-return-cd;
		TRACE("Error with web service!  Web service return code=" + ws-return-cd);

		EXIT;

	}

	# --------------------------------------------------------------------
	# MAP Response from webservice XML to Ingenium XML format
	# --------------------------------------------------------------------
	# Transform response by applying stylesheet
	#TXLifeResponseString = TRANSFORM(TXLifeResponseString, "XMLifeResponses.xsl");
	#IF GLOBAL-test-ind == "Y"
	#{
	#	TRACE("Transformed TXLife Response after appyling stylesheet=" + TXLifeResponseString);
	#}

	# Create data structure of response, and store in wsResponse.

	INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.basicInfoResp.requestDate = requestDate;
	INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.basicInfoResp.requestNo = requestNo;
	INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.basicInfoResp.insertedTimestamp = insertedTimestamp;
	INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.basicInfoResp.insertEmp = insertEmp;
	
	INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.errorInformation.errorCode = errorCode;
	INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.errorInformation.errorMessage = errorMessage;

        
        numlcrRequest = 1;
	numlcrInfo=alphaSearchResponse.limitCheckResultInfo.limitCheckResult[0];
	
	TRACE("numlcrInfo                "+numlcrInfo);

        TRACE("alphaSearchResponse.limitCheckResultInfo.limitCheckResult[1].lcType"+alphaSearchResponse.limitCheckResultInfo.limitCheckResult[1].lcType);
        TRACE("alphaSearchResponse.limitCheckResultInfo.limitCheckResult[2].lcType"+alphaSearchResponse.limitCheckResultInfo.limitCheckResult[2].lcType);        
        
	WHILE(numlcrRequest<=numlcrInfo)
	{
# 018396 CHANGES STARTS HERE
         INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].applicationNo = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].applicationNo;
# 018396 CHANGES ENDS HERE
         INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].searchType=alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].searchType;
        TRACE("alphaSearchResponse.limitCheckResultInfo.limitCheckResult[1].lcType"+alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].lcType);
         INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].customerType=alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].customerType;
         INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].insuredSeqNo=alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].insuredSeqNo;
         INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].beneficiarySeqNo=alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].beneficiarySeqNo;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].nameKanaCnv = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].nameKanaCnv;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].nameKanjiCnv = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].nameKanjiCnv;
# 018396 CHANGES STARTS HERE
         INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].InsuredAge = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].InsuredAge;   
# 018396 CHANGES ENDS HERE
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].lcType = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].lcType;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].limitAmount = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].limitAmount;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].sumTotalAmount = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].sumTotalAmount;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].defferenceAmount = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].defferenceAmount;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].lcMessage = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].lcMessage;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].checkType = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].checkType;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].issueDate = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].issueDate;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].policyNo = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].policyNo;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].lapseCancelType = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].lapseCancelType;
	 INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].lcTypeSeq = alphaSearchResponse.limitCheckResultInfo.limitCheckResult[numlcrRequest].lcTypeSeq;
	 numlcrRequest = numlcrRequest + 1;
	}

        numacrRequest = 1;
	numacrInfo=alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult[0];
	
	TRACE("numacrInfo                "+numacrInfo);

        TRACE("approveAuthCheckResultInfo.approveAuthCheckResult[1].checkCode"+alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult[1].checkCode);
        TRACE("approveAuthCheckResultInfo.approveAuthCheckResult[2].checkCode"+alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult[2].checkCode);        
        
	WHILE(numacrRequest<=numacrInfo)
	{
         INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult[numacrRequest].checkCode=alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult[numacrRequest].checkCode;
        TRACE("chkcode"+alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult[numacrRequest].checkCode);
         INGResponse.IngeniumData.Envelope.Body.alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult[numacrRequest].sumTotalAmount=alphaSearchResponse.approveAuthCheckResultInfo.approveAuthCheckResult[numacrRequest].sumTotalAmount;
	 numacrRequest = numacrRequest + 1;
	}	
	# return response as a string
	response = toXMLgeneric(INGResponse, "Response");


	IF GLOBAL-test-ind == "Y"
	{
		TRACE("INGENIUM Response =" + response);

	}

}
