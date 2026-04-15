#<HEADER>
#<DESCRIPTION>
#ElderlyCheckWS
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
# .          --- TCPC  TCIBElderlyCheckReqOutHandler: ElderlyCheckWS ---
# .
# .          This transaction will take an INGENIUM XML request and perform
# .          the following:
# .          2.  Send the input XML document to the external system, IBM iLog, via a webservice.
# .          3.  Receive an iLog Response XML document from the IBM rules engine.
# .          4.  Format an INGENIUM XML response, and return it back to the main flow.
# .
PROCESS TCIBElderlyCheckReqOutHandler
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
    historyCheckRequest.elderlyCheckRequest.nameKana = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.nameKana;
    historyCheckRequest.elderlyCheckRequest.gender   = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.gender;
    historyCheckRequest.elderlyCheckRequest.dob = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.dob;
    historyCheckRequest.elderlyCheckRequest.annualIncome  = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.annualIncome;
    historyCheckRequest.elderlyCheckRequest.financialAssets = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.financialAssets;
    historyCheckRequest.elderlyCheckRequest.applicationInfo.applicationNumber = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.applicationInfo.applicationNumber;
    historyCheckRequest.elderlyCheckRequest.applicationInfo.paymentMethod = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.applicationInfo.paymentMethod;
    historyCheckRequest.elderlyCheckRequest.applicationInfo.annualPremium = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.applicationInfo.annualPremium;
    historyCheckRequest.elderlyCheckRequest.applicationInfo.lumpSumPremium = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.applicationInfo.lumpSumPremium;
    historyCheckRequest.elderlyCheckRequest.applicationInfo.estimatedTotalPremium = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.applicationInfo.estimatedTotalPremium;
    historyCheckRequest.elderlyCheckRequest.applicationInfo.baseDate = INGRequest.IngeniumData.Envelope.Body.historyCheckRequest.elderlyCheckRequest.applicationInfo.baseDate;

    # eXternal webservice
    IF GLOBAL-test-ind == "Y"
    {
        TRACE("sending webservice REQUEST....");
        TRACE(INGRequest);
        TRACE("nameKana......" + historyCheckRequest.elderlyCheckRequest.nameKana);
        TRACE("gender........" + historyCheckRequest.elderlyCheckRequest.gender );
        TRACE("dob......" + historyCheckRequest.elderlyCheckRequest.dob);
        TRACE("annualIncome....." + historyCheckRequest.elderlyCheckRequest.annualIncome);
        TRACE("financialAssets...." + historyCheckRequest.elderlyCheckRequest.financialAssets);
        TRACE("applicationNumber....." + historyCheckRequest.elderlyCheckRequest.applicationInfo.applicationNumber);
        TRACE("paymentMethod...."+ historyCheckRequest.elderlyCheckRequest.applicationInfo.paymentMethod);
        TRACE("annualPremium..."+ historyCheckRequest.elderlyCheckRequest.applicationInfo.annualPremium);
        TRACE("lumpSumPremium..."+ historyCheckRequest.elderlyCheckRequest.applicationInfo.lumpSumPremium );
        TRACE("estimatedTotalPremium..."+ historyCheckRequest.elderlyCheckRequest.applicationInfo.estimatedTotalPremium);
        TRACE("baseDate..."+ historyCheckRequest.elderlyCheckRequest.applicationInfo.baseDate);
    }

    # Send request as an webservice or a subflow.  There are 3 possibilities.
    IF GLOBAL-perform-TRANSACT-type-cd == "X"
    {
        STEP WebserviceIBElderlyCheckWSHandler-P
        {
            USES P-STEP "WebserviceIBElderlyCheckReq-P";
            nameKanaConverted <- historyCheckResponse.elderlyCheckResponse.nameKanaConverted;            
            applicationNumber <- historyCheckResponse.elderlyCheckResponse.applicationNumber;
            annualIncome <- historyCheckResponse.elderlyCheckResponse.annualIncome;
            financialAssets <- historyCheckResponse.elderlyCheckResponse.financialAssets;
            totalAnnualPremium <- historyCheckResponse.elderlyCheckResponse.totalAnnualPremium;
            annualIncomeLimitForLevelPayment <- historyCheckResponse.elderlyCheckResponse.annualIncomeLimitForLevelPayment;
            estimatedTotalPremium <- historyCheckResponse.elderlyCheckResponse.estimatedTotalPremium;
            financialAssetsLimitForLevelPayment <- historyCheckResponse.elderlyCheckResponse.financialAssetsLimitForLevelPayment;
            totalLumpSumPremium <- historyCheckResponse.elderlyCheckResponse.totalLumpSumPremium;
            excessAnnualIncomeForLevelPayment <- historyCheckResponse.elderlyCheckResponse.excessAnnualIncomeForLevelPayment;
            excessFinancialAssetsForLevelPayment <- historyCheckResponse.elderlyCheckResponse.excessFinancialAssetsForLevelPayment;
            financialAssetsLimitForLumpSumPayment <- historyCheckResponse.elderlyCheckResponse.financialAssetsLimitForLumpSumPayment;
            excessFinancialAssetsForLumpSumPayment <- historyCheckResponse.elderlyCheckResponse.excessFinancialAssetsForLumpSumPayment;
            policyCountForOneYear <- historyCheckResponse.elderlyCheckResponse.policyCountForOneYear;
            policyCountForTwoYear <- historyCheckResponse.elderlyCheckResponse.policyCountForTwoYear;
            policyCountForLevelPayment <- historyCheckResponse.elderlyCheckResponse.policyCountForLevelPayment;
            excessPolicyCountForOneYear <- historyCheckResponse.elderlyCheckResponse.excessPolicyCountForOneYear;
            excessPolicyCountForTwoYear <- historyCheckResponse.elderlyCheckResponse.excessPolicyCountForTwoYear;
            excessPolicyCountForLevelPayment <- historyCheckResponse.elderlyCheckResponse.excessPolicyCountForLevelPayment;
            resultCode <- historyCheckResponse.elderlyCheckResponse.checkResult.resultCode;
            errorMessage <- historyCheckResponse.elderlyCheckResponse.checkResult.errorMessage;            
            systemErrorCode <- historyCheckResponse.elderlyCheckResponse.systemErrorCode;
            systemErrorMessage <- historyCheckResponse.elderlyCheckResponse.systemErrorMessage;
        }
    }
    ELSE
    {
        IF (GLOBAL-perform-TRANSACT-type-cd == "I")
        {
        # Internal webservice
            STEP WebserviceIBElderlyCheckReqInternalHandler-P
            {
                USES P-STEP "WebserviceIBElderlyCheckWS-P";
                INGRequest -> request;
                response <- response;
            }
        }
        ELSE
        {
        # call subflow to return response string
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
    # --------------------------------------------------------------------
    # MAP Response from webservice XML to Ingenium XML format
    # --------------------------------------------------------------------
    # Transform response by applying stylesheet

    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.nameKanaConverted = nameKanaConverted;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.applicationNumber = applicationNumber;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.annualIncome = annualIncome;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.financialAssets = financialAssets;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.totalAnnualPremium = totalAnnualPremium;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.annualIncomeLimitForLevelPayment = annualIncomeLimitForLevelPayment;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.estimatedTotalPremium = estimatedTotalPremium;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.financialAssetsLimitForLevelPayment = financialAssetsLimitForLevelPayment;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.totalLumpSumPremium = totalLumpSumPremium;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.excessAnnualIncomeForLevelPayment = excessAnnualIncomeForLevelPayment;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.excessFinancialAssetsForLevelPayment = excessFinancialAssetsForLevelPayment;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.financialAssetsLimitForLumpSumPayment = financialAssetsLimitForLumpSumPayment;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.excessFinancialAssetsForLumpSumPayment =excessFinancialAssetsForLumpSumPayment;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.policyCountForOneYear = policyCountForOneYear;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.policyCountForTwoYear= policyCountForTwoYear;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.policyCountForLevelPayment = policyCountForLevelPayment;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.excessPolicyCountForOneYear= excessPolicyCountForOneYear;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.excessPolicyCountForTwoYear = excessPolicyCountForTwoYear;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.excessPolicyCountForLevelPayment= excessPolicyCountForLevelPayment;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.checkResult.resultCode = resultCode;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.checkResult.errorMessage = errorMessage;    
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.systemErrorCode = systemErrorCode;
    INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.systemErrorMessage = systemErrorMessage;

    numcrRequest = 1;
    numcrInfo=historyCheckResponse.elderlyCheckResponse.checkResult[0];

    TRACE("numcrInfo                "+numcrInfo);
    TRACE("historyCheckResponse.elderlyCheckResponse.checkResult[1].resultCode"+historyCheckResponse.elderlyCheckResponse.checkResult[1].resultCode);
    TRACE("historyCheckResponse.elderlyCheckResponse.checkResult[2].resultCode"+historyCheckResponse.elderlyCheckResponse.checkResult[2].resultCode);        
        
    WHILE(numcrRequest<=numcrInfo)
    {
         INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.checkResult[numcrRequest].resultCode = historyCheckResponse.elderlyCheckResponse.checkResult[numcrRequest].resultCode;
         INGResponse.IngeniumData.Envelope.Body.historyCheckResponse.elderlyCheckResponse.checkResult[numcrRequest].ErrorMessage = historyCheckResponse.elderlyCheckResponse.checkResult[numcrRequest].ErrorMessage;
         numcrRequest = numcrRequest + 1;
    }

    # return response as a string
    response = toXMLgeneric(INGResponse, "Response");

    IF GLOBAL-test-ind == "Y"
    {
       TRACE("INGENIUM Response =" + response);
    }

}