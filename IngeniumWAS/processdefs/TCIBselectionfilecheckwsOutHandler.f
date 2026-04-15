#<HEADER>
#<DESCRIPTION>
#PCSelFileCheckReq SCV Selection information check
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
# .          --- TCPCSelFileCheckReqOutHandler: SCV Selection information check ---
# .
# .          This transaction will take an INGENIUM XML request and perform
# .          the following:
# .          2.  Send the input XML document to the external system, IBM iLog, via a webservice.
# .          3.  Receive an iLog Response XML document from the IBM rules engine.
# .          4.  Format an INGENIUM XML response, and return it back to the main flow.
# .
PROCESS TCIBselectionfilecheckwsOutHandler
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
	
	OperationMode = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.OperationMode;

	TransactionID = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.TransactionID;
	DataCategory = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.DataCategory;
	InsuredKana = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.InsuredKana;
	InsuredDOB = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.InsuredDOB;
	InsuredGender = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.InsuredGender;
	InsuredKanji = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.InsuredKanji;
	Occupation = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.Occupation;
	MedReportNum = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.MedReportNum;
	GenerationDate = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.GenerationDate;
	CardCreationDate = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.BasicInfo.CardCreationDate;
	PhysicalConditionResult = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.PhysicalConditionResult;
	ResinsuranceResult = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.ResinsuranceResult;
	ReasonInfo = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.ReasonInfo;
	ReasonDtls = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls;
	ReasonCode1 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode1;
	ReasonCode2 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode2;
	ReasonCode3 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode3;
	ReasonCode4 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode4;
	ReasonCode5 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode5;
	DefectInfo = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.DefectInfo;
	DefectDtls = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls;
	DefectCode1 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.DefectCode1;
	DefectCode2 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.DefectCode2;
	ElapsedYears = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.ElapsedYears;
	Surgery1 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.Surgery1;
	Surgery2 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.Surgery2;
	Surgery3 = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.Surgery3;
	AdditionalInfo = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.AdditionalInfo;
	
# 109554 CHANGES START HERE	
	SmallProductCD = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.ProductInfo.SmallProductCD;
        AISDeterminationFlag = INGRequest.IngeniumData.Envelope.Body.SelFileCheckReq.OtherInfo.AISDeterminationFlag;
# 109554 CHANGES START HERE

	# Send request as an webservice or a subflow.  There are 3 possibilities.
	IF GLOBAL-perform-TRANSACT-type-cd == "X"
	{
		STEP WebserviceIBSelectionFileCheckWSHandler-P
		{
			USES P-STEP "WebserviceIBselectionfilecheckws-P";
			OperationMode -> SelFileCheckReq.BasicInfo.OperationMode;
			TransactionID -> SelFileCheckReq.BasicInfo.TransactionID;
			DataCategory -> SelFileCheckReq.BasicInfo.DataCategory;
			InsuredKana -> SelFileCheckReq.BasicInfo.InsuredKana;
			InsuredDOB -> SelFileCheckReq.BasicInfo.InsuredDOB;
			InsuredGender -> SelFileCheckReq.BasicInfo.InsuredGender;
			InsuredKanji -> SelFileCheckReq.BasicInfo.InsuredKanji;
			Occupation -> SelFileCheckReq.BasicInfo.Occupation;
			MedReportNum -> SelFileCheckReq.BasicInfo.MedReportNum;
			GenerationDate -> SelFileCheckReq.BasicInfo.GenerationDate;
			CardCreationDate -> SelFileCheckReq.BasicInfo.CardCreationDate;
			PhysicalConditionResult -> SelFileCheckReq.UnderwritingResult.PhysicalConditionResult;
			ResinsuranceResult -> SelFileCheckReq.UnderwritingResult.ResinsuranceResult;
			ReasonInfo -> SelFileCheckReq.UnderwritingResult.ReasonInfo;
			ReasonDtls -> SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls;
			ReasonCode1 -> SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode1;
			ReasonCode2 -> SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode2;
			ReasonCode3 -> SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode3;
			ReasonCode4 -> SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode4;
			ReasonCode5 -> SelFileCheckReq.UnderwritingResult.ReasonInfo.ReasonDtls.ReasonCode5;
			DefectInfo -> SelFileCheckReq.UnderwritingResult.DefectInfo;
			DefectDtls -> SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls;
			DefectCode1 -> SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.DefectCode1;
			DefectCode2 -> SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.DefectCode2;
			ElapsedYears -> SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.ElapsedYears;
			Surgery1 -> SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.Surgery1;
			Surgery2 -> SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.Surgery2;
			Surgery3 -> SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.Surgery3;
			AdditionalInfo -> SelFileCheckReq.UnderwritingResult.DefectInfo.DefectDtls.AdditionalInfo;
# 109554 CHANGES START HERE						
			SmallProductCD -> SelFileCheckReq.ProductInfo.SmallProductCD;
			AISDeterminationFlag -> SelFileCheckReq.OtherInfo.AISDeterminationFlag;
# 109554 CHANGES ENDS HERE
			SCVFetchResult <- SelFileCheckResp.BasicInfoResp.SCVFetchResult;
			SCVFetchResult2 <- SelFileCheckResp.BasicInfoResp.SCVFetchResult2;			
			SCVInsertResult <- SelFileCheckResp.BasicInfoResp.SCVInsertResult;
			TransactionID <- SelFileCheckResp.BasicInfoResp.TransactionID;
			ErrorCode <- SelFileCheckResp.ErrorInfo.ErrorCode;
			ErrorMessage <- SelFileCheckResp.ErrorInfo.ErrorMessage;
		}

	}
	ELSE
	{
		IF (GLOBAL-perform-TRANSACT-type-cd == "I")
		{
			# Internal webservice
			STEP WebserviceIBSelectionFileCheckWSInternalHandler-P
			{
				USES P-STEP "WebserviceIBselectionfilecheckws-P";
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



	INGResponse.IngeniumData.SelFileCheckResp.BasicInfoResp.SCVFetchResult = SCVFetchResult;
        INGResponse.IngeniumData.SelFileCheckResp.BasicInfoResp.SCVFetchResult2 = SCVFetchResult2;	
	INGResponse.IngeniumData.SelFileCheckResp.BasicInfoResp.SCVInsertResult = SCVInsertResult;
	INGResponse.IngeniumData.SelFileCheckResp.BasicInfoResp.TransactionID = TransactionID;
	INGResponse.IngeniumData.SelFileCheckResp.ErrorInfo.ErrorCode = ErrorCode;
	INGResponse.IngeniumData.SelFileCheckResp.ErrorInfo.ErrorMessage = ErrorMessage;

	# return response as a string
	response = toXMLgeneric(INGResponse, "Response");


}
