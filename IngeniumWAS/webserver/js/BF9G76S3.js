// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9G76S3.js                                                    *
//*  Description: UNISYS POLICY INQUIRY SCREEN                                 *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*  UYDM28  CTS      INTIAL VERSION                                           *
//******************************************************************************
 
//******************************************************************************
// THE SOFTWARE COMPRISING THIS SYSTEM IS THE PROPERTY OF INSURANCE SOFTWARE
// SOLUTIONS CORP. OR ITS LICENSORS.
//
// ALL COPYRIGHT, PATENT, TRADE SECRET, AND OTHER INTELLECTUAL PROPERTY RIGHTS
// IN THE SOFTWARE COMPRISING THIS SYSTEM ARE, AND SHALL REMAIN, THE VALUABLE
// PROPERTY OF INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS LICENSORS.
//
// USE, DISCLOSURE, OR REPRODUCTION OF THIS SOFTWARE IS STRICTLY PROHIBITED,
// EXCEPT UNDER WRITTEN LICENSE FROM INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS
// LICENSORS.
// 
// (C) COPYRIGHT 1999 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
//******************************************************************************


//-----------------------------------------------------------------------------
//
//  Uses:  NOTHING
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//  Function:       dynamicHide()
//
//  Description:  Custom onload handler. Hides all empty groups labels
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function dynamicHide()
{

     var DivisionIdSurvivalInsuranceClaimsBuyoutG = document.getElementById('MIR-ADD1-5-36-FLD-15').value;
     var GroupElementSurvivalInsuranceClaimsBuyoutG = document.getElementById('survival-Insurance-Claims-Buyout-g');
     var GroupElementLinkSurvivalInsuranceClaimsBuyoutG = document.getElementById('survival-Insurance-Claims-Buyout-gLink');
     var GroupElementLinkSurvivalInsuranceClaimsBuyoutGText = document.getElementById('survival-Insurance-Claims-Buyout-gLink-text');
     if (DivisionIdSurvivalInsuranceClaimsBuyoutG =='0'){
         if(GroupElementSurvivalInsuranceClaimsBuyoutG){
         GroupElementSurvivalInsuranceClaimsBuyoutG.style.display = 'none';
         } 
         if(GroupElementLinkSurvivalInsuranceClaimsBuyoutG){
         GroupElementLinkSurvivalInsuranceClaimsBuyoutG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSurvivalInsuranceClaimsBuyoutGText){
         GroupElementLinkSurvivalInsuranceClaimsBuyoutGText.style.display = 'none';
         }
     }
     var DivisionIdAllocateddividendG = document.getElementById('MIR-ADD1-5-36-FLD-16').value;
     var GroupElementAllocateddividendG = document.getElementById('allocated-dividend-g');
     var GroupElementLinkAllocateddividendG = document.getElementById('allocated-dividend-gLink');
     var GroupElementLinkAllocateddividendGText = document.getElementById('allocated-dividend-gLink-text');
     if (DivisionIdAllocateddividendG =='0'){
         if (GroupElementAllocateddividendG){
             GroupElementAllocateddividendG.style.display = 'none';
         }
         if (GroupElementLinkAllocateddividendG){
             GroupElementLinkAllocateddividendG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkAllocateddividendGText){
             GroupElementLinkAllocateddividendGText.style.display = 'none';
         }
     }
	 
     var DivisionIdOffsetG = document.getElementById('MIR-ADD1-5-36-FLD-17').value;
     var GroupElementOffsetG = document.getElementById('offset-g');
     var GroupElementLinkOffsetG = document.getElementById('offset-gLink');
     var GroupElementLinkOffsetGText = document.getElementById('offset-gLink-text');
     if (DivisionIdOffsetG =='0'){
         if (GroupElementOffsetG){
             GroupElementOffsetG.style.display = 'none'; 
         }
         if (GroupElementLinkOffsetG){
             GroupElementLinkOffsetG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkOffsetGText){
             GroupElementLinkOffsetGText.style.display = 'none';
         }
     }
     var DivisionIdUndercustodydividendG = document.getElementById('MIR-ADD1-5-36-FLD-18').value;
     var GroupElementUndercustodydividendG = document.getElementById('Under-custody-dividend-g');
     var GroupElementLinkUndercustodydividendG = document.getElementById('Under-custody-dividend-gLink');
     var GroupElementLinkUndercustodydividendGText = document.getElementById('Under-custody-dividend-gLink-text');
     if (DivisionIdUndercustodydividendG =='0'){
         if (GroupElementUndercustodydividendG){
             GroupElementUndercustodydividendG.style.display = 'none';
         }
         if (GroupElementLinkUndercustodydividendG){
             GroupElementLinkUndercustodydividendG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkUndercustodydividendGText){
             GroupElementLinkUndercustodydividendGText.style.display = 'none';
         }
     }
	 
     var DivisionIdDepositG = document.getElementById('MIR-ADD1-5-36-FLD-19').value;
     var GroupElementDepositG = document.getElementById('Deposit-g');
     var GroupElementLinkDepositG = document.getElementById('Deposit-gLink');
     var GroupElementLinkDepositGText = document.getElementById('Deposit-gLink-text');
     if (DivisionIdDepositG =='0'){
         if (GroupElementDepositG){
             GroupElementDepositG.style.display = 'none';
         }
         if (GroupElementLinkDepositG){
             GroupElementLinkDepositG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkDepositGText){
             GroupElementLinkDepositGText.style.display = 'none';
         }
     }
	 
     var DivisionIdPaidupadditionG = document.getElementById('MIR-ADD1-5-36-FLD-20').value;
     var GroupElementPaidupadditionG = document.getElementById('Paid-up-addition-g');
     var GroupElementLinkPaidupadditionG = document.getElementById('Paid-up-addition-gLink');
     var GroupElementLinkPaidupadditionGText = document.getElementById('Paid-up-addition-gLink-text');
     if (DivisionIdPaidupadditionG =='0'){
         if (GroupElementPaidupadditionG){
             GroupElementPaidupadditionG.style.display = 'none';
         }
         if (GroupElementLinkPaidupadditionG){
             GroupElementLinkPaidupadditionG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkPaidupadditionGText){
             GroupElementLinkPaidupadditionGText.style.display = 'none';
         }
     }
	 
     var DivisionIdCongratulatorymoneyforadmissionntoschoolG = document.getElementById('MIR-ADD1-5-36-FLD-21').value;
     var GroupElementCongratulatorymoneyforadmissionntoschoolG = document.getElementById('Congratulatory-money-for-admissionn-to-school-g');
     var GroupElementLinkCongratulatorymoneyforadmissionntoschoolG = document.getElementById('Congratulatory-money-for-admissionn-to-school-gLink');
     var GroupElementLinkCongratulatorymoneyforadmissionntoschoolGText = document.getElementById('Congratulatory-money-for-admissionn-to-school-gLink-text');
     if (DivisionIdCongratulatorymoneyforadmissionntoschoolG =='0'){
         if (GroupElementCongratulatorymoneyforadmissionntoschoolG){
             GroupElementCongratulatorymoneyforadmissionntoschoolG.style.display = 'none';
         }
         if (GroupElementLinkCongratulatorymoneyforadmissionntoschoolG){
             GroupElementLinkCongratulatorymoneyforadmissionntoschoolG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkCongratulatorymoneyforadmissionntoschoolGText){
             GroupElementLinkCongratulatorymoneyforadmissionntoschoolGText.style.display = 'none';
         }
     }
	
     var DivisionIdAnnuity1G = document.getElementById('MIR-ADD1-5-36-FLD-29').value;
     var GroupElementAnnuity1G = document.getElementById('Annuity1-g');
     var GroupElementLinkAnnuity1G = document.getElementById('Annuity1-gLink');
     var GroupElementLinkAnnuity1GText = document.getElementById('Annuity1-gLink-text');
     if (DivisionIdAnnuity1G =='0'){
        if (GroupElementAnnuity1G){
           GroupElementAnnuity1G.style.display = 'none';
        }
        if (GroupElementLinkAnnuity1G){
            GroupElementLinkAnnuity1G.style.display = 'none';
        }
     }
     else
     {
         if (GroupElementLinkAnnuity1GText){
             GroupElementLinkAnnuity1GText.style.display = 'none';
         }
     }
     var DivisionIdTransferDepartment1 = document.getElementById('MIR-ADD2-0-35-FLD-1').value;
     var GroupElementTransferDepartment1 = document.getElementById('Transfer-Department1-g');
     var GroupElementLinkTransferDepartment1 = document.getElementById('Transfer-Department1-gLink');
     var GroupElementLinkTransferDepartment1Text = document.getElementById('Transfer-Department1-gLink-text');
     if (DivisionIdTransferDepartment1 =='0'){
         if (GroupElementTransferDepartment1){
             GroupElementTransferDepartment1.style.display = 'none';
         }
         if (GroupElementLinkTransferDepartment1){
             GroupElementLinkTransferDepartment1.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkTransferDepartment1Text){
             GroupElementLinkTransferDepartment1Text.style.display = 'none';
         }
     }
     var DivisionIdLendingDepartment1 = document.getElementById('MIR-ADD2-0-35-FLD-3').value;
     var GroupElementLendingDepartment1 = document.getElementById('Lending-Department1-g');
     var GroupElementLinkLendingDepartment1 = document.getElementById('Lending-Department1-gLink');
     var GroupElementLinkLendingDepartment1Text = document.getElementById('Lending-Department1-gLink-text');
     if (DivisionIdLendingDepartment1 =='0'){
         if (GroupElementLendingDepartment1){
             GroupElementLendingDepartment1.style.display = 'none';
         }
         if (GroupElementLinkLendingDepartment1){
             GroupElementLinkLendingDepartment1.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkLendingDepartment1Text){
             GroupElementLinkLendingDepartment1Text.style.display = 'none';
         }
     }
     var DivisionIdLendingDepartment2 = document.getElementById('MIR-ADD2-0-35-FLD-4').value;
     var GroupElementLendingDepartment2 = document.getElementById('Lending-Department2-g');
     var GroupElementLinkLendingDepartment2 = document.getElementById('Lending-Department2-gLink');
     var GroupElementLinkLendingDepartment2Text = document.getElementById('Lending-Department2-gLink-text');
     if (DivisionIdLendingDepartment1 =='0'){
         if (GroupElementLendingDepartment2){
             GroupElementLendingDepartment2.style.display = 'none';
         }
         if (GroupElementLinkLendingDepartment2){
             GroupElementLinkLendingDepartment2.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkLendingDepartment2Text){
             GroupElementLinkLendingDepartment2Text.style.display = 'none';
         }
     }
     var DivisionIdExtensionG = document.getElementById('MIR-ADD2-0-35-FLD-11').value;
     var GroupElementExtensionG = document.getElementById('Extension-g');
     var GroupElementLinkExtensionG = document.getElementById('Extension-gLink');
     var GroupElementLinkExtensionGText = document.getElementById('Extension-gLink-text');
     if (DivisionIdExtensionG =='0'){
         if (GroupElementExtensionG){
             GroupElementExtensionG.style.display = 'none';
         }
         if (GroupElementLinkExtensionG){
             GroupElementLinkExtensionG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkExtensionGText){
             GroupElementLinkExtensionGText.style.display = 'none';
         }
     }
     var DivisionIdEmployeeinsuranceG = document.getElementById('MIR-ADD2-0-35-FLD-17').value;
     var GroupElementEmployeeinsuranceG = document.getElementById('Employee-insurance-g');
     var GroupElementLinkEmployeeinsuranceG = document.getElementById('Employee-insurance-gLink');
     var GroupElementLinkEmployeeinsuranceGText = document.getElementById('Employee-insurance-gLink-text');
     if (DivisionIdEmployeeinsuranceG =='0'){
         if (GroupElementEmployeeinsuranceG){
            GroupElementEmployeeinsuranceG.style.display = 'none'; 
         }
         if (GroupElementLinkEmployeeinsuranceG){
             GroupElementLinkEmployeeinsuranceG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkEmployeeinsuranceGText){
             GroupElementLinkEmployeeinsuranceGText.style.display = 'none';
         }
     }
     var DivisionIdSoftproductsG = document.getElementById('MIR-ADD2-0-35-FLD-18').value;
     var GroupElementSoftproductsG = document.getElementById('Soft-products-g');
     var GroupElementLinkSoftproductsG = document.getElementById('Soft-products-gLink');
     var GroupElementLinkSoftproductsGText = document.getElementById('Soft-products-gLink-text');
     if (DivisionIdSoftproductsG =='0'){
         if (GroupElementSoftproductsG){
             GroupElementSoftproductsG.style.display = 'none';
         }
         if (GroupElementLinkSoftproductsG){
             GroupElementLinkSoftproductsG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSoftproductsGText){
             GroupElementLinkSoftproductsGText.style.display = 'none';
         }
     }
     var DivisionIdFtypepremiumpaymentG = document.getElementById('MIR-ADD2-0-35-FLD-19').value;
     var GroupElementFtypepremiumpaymentG = document.getElementById('F-type-premium-payment-g');
     var GroupElementLinkFtypepremiumpaymentG = document.getElementById('F-type-premium-payment-gLink');
     var GroupElementLinkFtypepremiumpaymentGText = document.getElementById('F-type-premium-payment-gLink-text');
     if (DivisionIdFtypepremiumpaymentG =='0'){
         if(GroupElementFtypepremiumpaymentG){
            GroupElementFtypepremiumpaymentG.style.display = 'none';
         }
         if(GroupElementLinkFtypepremiumpaymentG){
            GroupElementLinkFtypepremiumpaymentG.style.display = 'none';
         }
     }
     else
     {
         if(GroupElementLinkFtypepremiumpaymentGText){
            GroupElementLinkFtypepremiumpaymentGText.style.display = 'none';
         }
     }
     var DivisionIdLifeinsuranceadvancepremiumG = document.getElementById('MIR-ADD2-0-35-FLD-20').value;
     var GroupElementLifeinsuranceadvancepremiumG = document.getElementById('Life-insurance-advance-premium-g');
     var GroupElementLinkLifeinsuranceadvancepremiumG = document.getElementById('Life-insurance-advance-premium-gLink');
     var GroupElementLinkLifeinsuranceadvancepremiumGText = document.getElementById('Life-insurance-advance-premium-gLink-text');
     if (DivisionIdLifeinsuranceadvancepremiumG =='0'){
         if(GroupElementLifeinsuranceadvancepremiumG){
            GroupElementLifeinsuranceadvancepremiumG.style.display = 'none';
         }
         if(GroupElementLinkLifeinsuranceadvancepremiumG){
            GroupElementLinkLifeinsuranceadvancepremiumG.style.display = 'none';
         }
     }
     else
     {
         if(GroupElementLinkLifeinsuranceadvancepremiumGText){
            GroupElementLinkLifeinsuranceadvancepremiumGText.style.display = 'none';
         }
     } 
     var DivisionIdSavingprepaymentG = document.getElementById('MIR-ADD2-0-35-FLD-21').value;
     var GroupElementSavingprepaymentG = document.getElementById('Saving-prepayment-g');
     var GroupElementLinkSavingprepaymentG = document.getElementById('Saving-prepayment-gLink');
     var GroupElementLinkSavingprepaymentGText = document.getElementById('Saving-prepayment-gLink-text');
     if (DivisionIdSavingprepaymentG =='0'){
         if(GroupElementSavingprepaymentG){
            GroupElementSavingprepaymentG.style.display = 'none';
         }
         if(GroupElementLinkSavingprepaymentG){
            GroupElementLinkSavingprepaymentG.style.display = 'none';
         }
     }
     else
     {
         if(GroupElementLinkSavingprepaymentGText){
            GroupElementLinkSavingprepaymentGText.style.display = 'none';
         }
     }
     var DivisionIdNewlifeinsuranceprepaymentG = document.getElementById('MIR-ADD2-0-35-FLD-26').value;
     var GroupElementNewlifeinsuranceprepaymentG = document.getElementById('New-life-insurance-prepayment-g');
     var GroupElementLinkNewlifeinsuranceprepaymentG = document.getElementById('New-life-insurance-prepayment-gLink');
     var GroupElementLinkNewlifeinsuranceprepaymentGText = document.getElementById('New-life-insurance-prepayment-gLink-text');
     if (DivisionIdNewlifeinsuranceprepaymentG =='0'){
         if(GroupElementNewlifeinsuranceprepaymentG){
            GroupElementNewlifeinsuranceprepaymentG.style.display = 'none';
         }
         if(GroupElementLinkNewlifeinsuranceprepaymentG){
            GroupElementLinkNewlifeinsuranceprepaymentG.style.display = 'none';
         }
     }
     else
     {
         if(GroupElementLinkNewlifeinsuranceprepaymentGText){
            GroupElementLinkNewlifeinsuranceprepaymentGText.style.display = 'none';
         }
     }
     var DivisionIdTransferDepartment2 = document.getElementById('MIR-ADD2-0-35-FLD-29').value;
     var GroupElementTransferDepartment2 = document.getElementById('Transfer-Department2-g');
     var GroupElementLinkTransferDepartment2 = document.getElementById('Transfer-Department2-gLink');
     var GroupElementLinkTransferDepartment2Text = document.getElementById('Transfer-Department2-gLink-text');
     if (DivisionIdTransferDepartment2 =='0'){
         if (GroupElementTransferDepartment2){
             GroupElementTransferDepartment2.style.display = 'none';
         }
         if (GroupElementLinkTransferDepartment2){
             GroupElementLinkTransferDepartment2.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkTransferDepartment2Text){
             GroupElementLinkTransferDepartment2Text.style.display = 'none';
         }
     }
     var DivisionIdRecoverybonusG = document.getElementById('MIR-ADD2-0-35-FLD-30').value;
     var GroupElementRecoverybonusG = document.getElementById('Recovery-bonus-g');
     var GroupElementLinkRecoverybonusG = document.getElementById('Recovery-bonus-gLink');
     var GroupElementLinkRecoverybonusGText = document.getElementById('Recovery-bonus-gLink-text');
     if (DivisionIdRecoverybonusG =='0'){
         if(GroupElementRecoverybonusG){
            GroupElementRecoverybonusG.style.display = 'none';
         }
         if(GroupElementLinkRecoverybonusG){
            GroupElementLinkRecoverybonusG.style.display = 'none';
         }
     }
     else
     {
         if(GroupElementLinkRecoverybonusGText){
            GroupElementLinkRecoverybonusGText.style.display = 'none';
         }
     }
     var DivisionIdInformationregardingsmokingG = document.getElementById('MIR-ADD2-0-35-FLD-31').value;
     var GroupElementInformationregardingsmokingG = document.getElementById('Information-regarding-smoking-g');
     var GroupElementLinkInformationregardingsmokingG = document.getElementById('Information-regarding-smoking-gLink');
     var GroupElementLinkInformationregardingsmokingGText = document.getElementById('Information-regarding-smoking-gLink-text');
     if (DivisionIdInformationregardingsmokingG =='0'){
         if (GroupElementInformationregardingsmokingG){
             GroupElementInformationregardingsmokingG.style.display = 'none';
         }
         if (GroupElementLinkInformationregardingsmokingG){
             GroupElementLinkInformationregardingsmokingG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkInformationregardingsmokingGText){
             GroupElementLinkInformationregardingsmokingGText.style.display = 'none';
         }
     }
     var DivisionIdDividendhistoryG = document.getElementById('MIR-ADD2-0-35-FLD-34').value;
     var GroupElementDividendhistoryG = document.getElementById('Dividend-history-g');
     var GroupElementLinkDividendhistoryG = document.getElementById('Dividend-history-gLink');
     var GroupElementLinkDividendhistoryGText = document.getElementById('Dividend-history-gLink-text');
     if (DivisionIdDividendhistoryG =='0'){
         if (GroupElementDividendhistoryG){
             GroupElementDividendhistoryG.style.display = 'none';
         }
         if (GroupElementLinkDividendhistoryG){
             GroupElementLinkDividendhistoryG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkDividendhistoryGText){
             GroupElementLinkDividendhistoryGText.style.display = 'none';
         }
     }
     var DivisionIdDividenddistributionmethodchangeG = document.getElementById('MIR-ADD3-0-35-FLD-2').value;
     var GroupElementDividenddistributionmethodchangeG = document.getElementById('Dividend-distribution-method-change-g');
     var GroupElementLinkDividenddistributionmethodchangeG = document.getElementById('Dividend-distribution-method-change-gLink');
     var GroupElementLinkDividenddistributionmethodchangeGText = document.getElementById('Dividend-distribution-method-change-gLink-text');
     if (DivisionIdDividenddistributionmethodchangeG =='0'){
         if (GroupElementDividenddistributionmethodchangeG){
             GroupElementDividenddistributionmethodchangeG.style.display = 'none';
         }
         if (GroupElementLinkDividenddistributionmethodchangeG){
             GroupElementLinkDividenddistributionmethodchangeG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkDividenddistributionmethodchangeGText){
             GroupElementLinkDividenddistributionmethodchangeGText.style.display = 'none';
         }
     }
     var DivisionIdHealthawarddepositG = document.getElementById('MIR-ADD3-0-35-FLD-3').value;
     var GroupElementHealthawarddepositG = document.getElementById('Health-award-deposit-g');
     var GroupElementLinkHealthawarddepositG = document.getElementById('Health-award-deposit-gLink');
     var GroupElementLinkHealthawarddepositGText = document.getElementById('Health-award-deposit-gLink-text');
     if (DivisionIdHealthawarddepositG =='0'){
         if (GroupElementHealthawarddepositG){
             GroupElementHealthawarddepositG.style.display = 'none';
         }
         if (GroupElementLinkHealthawarddepositG){
             GroupElementLinkHealthawarddepositG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkHealthawarddepositGText){
             GroupElementLinkHealthawarddepositGText.style.display = 'none';
         }
     }
     var DivisionIdHealthawardpaymentG = document.getElementById('MIR-ADD3-0-35-FLD-4').value;
     var GroupElementHealthawardpaymentG = document.getElementById('Health-award-payment-g');
     var GroupElementLinkHealthawardpaymentG = document.getElementById('Health-award-payment-gLink');
     var GroupElementLinkHealthawardpaymentGText = document.getElementById('Health-award-payment-gLink-text');
     if (DivisionIdHealthawardpaymentG =='0'){
         if (GroupElementHealthawardpaymentG){
             GroupElementHealthawardpaymentG.style.display = 'none';
         }
         if (GroupElementLinkHealthawardpaymentG){
             GroupElementLinkHealthawardpaymentG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkHealthawardpaymentGText){
             GroupElementLinkHealthawardpaymentGText.style.display = 'none';
         }
     }
     var DivisionIdHealthawardpaymenthistoryG = document.getElementById('MIR-ADD3-0-35-FLD-5').value;
     var GroupElementHealthawardpaymenthistoryG = document.getElementById('Health-award-payment-history-g');
     var GroupElementLinkHealthawardpaymenthistoryG = document.getElementById('Health-award-payment-history-gLink');
     var GroupElementLinkHealthawardpaymenthistoryGText = document.getElementById('Health-award-payment-history-gLink-text');
     if (DivisionIdHealthawardpaymenthistoryG =='0'){
         if (GroupElementHealthawardpaymenthistoryG){
             GroupElementHealthawardpaymenthistoryG.style.display = 'none';
         }
         if (GroupElementLinkHealthawardpaymenthistoryG){
             GroupElementLinkHealthawardpaymenthistoryG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkHealthawardpaymenthistoryGText){
             GroupElementLinkHealthawardpaymenthistoryGText.style.display = 'none';
         }
     }
     var DivisionIdVestingG = document.getElementById('MIR-ADD3-0-35-FLD-6').value;
     var GroupElementVestingG = document.getElementById('Vesting-g');
     var GroupElementLinkVestingG = document.getElementById('Vesting-gLink');
     var GroupElementLinkVestingGText = document.getElementById('Vesting-gLink-text');
     if (DivisionIdVestingG =='0'){
         if (GroupElementVestingG){
             GroupElementVestingG.style.display = 'none';
         }
         if (GroupElementLinkVestingG){
             GroupElementLinkVestingG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkVestingGText){
             GroupElementLinkVestingGText.style.display = 'none';
         }
     }
     var DivisionIdSetsalesG = document.getElementById('MIR-ADD3-0-35-FLD-8').value;
     var GroupElementSetsalesG = document.getElementById('Set-sales-g');
     var GroupElementLinkSetsalesG = document.getElementById('Set-sales-gLink');
     var GroupElementLinkSetsalesGText = document.getElementById('Set-sales-gLink-text');
     if (DivisionIdSetsalesG =='0'){
         if (GroupElementSetsalesG){
             GroupElementSetsalesG.style.display = 'none';
         }
         if (GroupElementLinkSetsalesG){
             GroupElementLinkSetsalesG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSetsalesGText){
             GroupElementLinkSetsalesGText.style.display = 'none';
         }
     }
     var DivisionIdAutomaticextensionsettlementG = document.getElementById('MIR-ADD3-0-35-FLD-9').value;
     var GroupElementAutomaticextensionsettlementG = document.getElementById('Automatic-extension-settlement-g');
     var GroupElementLinkAutomaticextensionsettlementG = document.getElementById('Automatic-extension-settlement-gLink');
     var GroupElementLinkAutomaticextensionsettlementGText = document.getElementById('Automatic-extension-settlement-gLink-text');
     if (DivisionIdAutomaticextensionsettlementG =='0'){
         if (GroupElementAutomaticextensionsettlementG){
             GroupElementAutomaticextensionsettlementG.style.display = 'none';
         }
         if (GroupElementLinkAutomaticextensionsettlementG){
             GroupElementLinkAutomaticextensionsettlementG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkAutomaticextensionsettlementGText){
             GroupElementLinkAutomaticextensionsettlementGText.style.display = 'none';
         }
     }
     var DivisionIdPartialexclusionG = document.getElementById('MIR-ADD3-0-35-FLD-21').value;
     var GroupElementPartialexclusionG = document.getElementById('Partial-exclusion-g');
     var GroupElementLinkPartialexclusionG = document.getElementById('Partial-exclusion-gLink');
     var GroupElementLinkPartialexclusionGText = document.getElementById('Partial-exclusion-gLink-text');
     if (DivisionIdPartialexclusionG =='0'){
         if (GroupElementPartialexclusionG){
             GroupElementPartialexclusionG.style.display = 'none';
         }
         if (GroupElementLinkPartialexclusionG){
             GroupElementLinkPartialexclusionG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkPartialexclusionGText){
             GroupElementLinkPartialexclusionGText.style.display = 'none';
         }
     }
     var DivisionIdEligibleRiderPayoutAccumulationG = document.getElementById('MIR-ADD3-0-35-FLD-26').value;
     var GroupElementEligibleRiderPayoutAccumulationG = document.getElementById('Eligible-Rider-Payout-Accumulation-g');
     var GroupElementLinkEligibleRiderPayoutAccumulationG = document.getElementById('Eligible-Rider-Payout-Accumulation-gLink');
     var GroupElementLinkEligibleRiderPayoutAccumulationGText = document.getElementById('Eligible-Rider-Payout-Accumulation-gLink-text');
     if (DivisionIdEligibleRiderPayoutAccumulationG =='0'){
         if (GroupElementEligibleRiderPayoutAccumulationG){
             GroupElementEligibleRiderPayoutAccumulationG.style.display = 'none';
         }
         if (GroupElementLinkEligibleRiderPayoutAccumulationG){
             GroupElementLinkEligibleRiderPayoutAccumulationG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkEligibleRiderPayoutAccumulationGText){
             GroupElementLinkEligibleRiderPayoutAccumulationGText.style.display = 'none';
         }
     }
     var DivisionIdSeparatewithholdingtaxG = document.getElementById('MIR-ADD3-0-35-FLD-31').value;
     var GroupElementSeparatewithholdingtaxG = document.getElementById('Separate-withholding-tax-g');
     var GroupElementLinkSeparatewithholdingtaxG = document.getElementById('Separate-withholding-tax-gLink');
     var GroupElementLinkSeparatewithholdingtaxGText = document.getElementById('Separate-withholding-tax-gLink-text');
     if (DivisionIdSeparatewithholdingtaxG =='0'){
         if (GroupElementSeparatewithholdingtaxG){
             GroupElementSeparatewithholdingtaxG.style.display = 'none';
         }
         if (GroupElementLinkSeparatewithholdingtaxG){
             GroupElementLinkSeparatewithholdingtaxG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSeparatewithholdingtaxGText){
             GroupElementLinkSeparatewithholdingtaxGText.style.display = 'none';
         }
     }
     var DivisionId21stcenturysavingsbasicG = document.getElementById('MIR-ADD3-0-35-FLD-33').value;
     var GroupElement21stcenturysavingsbasicG = document.getElementById('21st-century-savings-basic-g');
     var GroupElementLink21stcenturysavingsbasicG = document.getElementById('21st-century-savings-basic-gLink');
     var GroupElementLink21stcenturysavingsbasicGText = document.getElementById('21st-century-savings-basic-gLink-text');
     if (DivisionId21stcenturysavingsbasicG =='0'){
         if (GroupElement21stcenturysavingsbasicG){
             GroupElement21stcenturysavingsbasicG.style.display = 'none';
         }
         if (GroupElementLink21stcenturysavingsbasicG){
             GroupElementLink21stcenturysavingsbasicG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLink21stcenturysavingsbasicGText){
             GroupElementLink21stcenturysavingsbasicGText.style.display = 'none';
         }
     }
     var DivisionIdWholelifepremiumpaidupadditionG = document.getElementById('MIR-ADD3-0-35-FLD-35').value;
     var GroupElementWholelifepremiumpaidupadditionG = document.getElementById('Whole-life-premium-paid-up-addition-g');
     var GroupElementLinkWholelifepremiumpaidupadditionG = document.getElementById('Whole-life-premium-paid-up-addition-gLink');
     var GroupElementLinkWholelifepremiumpaidupadditionGText = document.getElementById('Whole-life-premium-paid-up-addition-gLink-text');
     if (DivisionIdWholelifepremiumpaidupadditionG =='0'){
         if (GroupElementWholelifepremiumpaidupadditionG){
             GroupElementWholelifepremiumpaidupadditionG.style.display = 'none';
         }
         if (GroupElementLinkWholelifepremiumpaidupadditionG){
             GroupElementLinkWholelifepremiumpaidupadditionG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkWholelifepremiumpaidupadditionGText){
             GroupElementLinkWholelifepremiumpaidupadditionGText.style.display = 'none';
         }
     }
     var DivisionIdContinuingActivitiesG = document.getElementById('MIR-IND-3-35-FLD-1').value;
     var GroupElementContinuingActivitiesG = document.getElementById('Continuing-activities-g');
     var GroupElementLinkContinuingActivitiesG = document.getElementById('Continuing-activities-gLink');
     var GroupElementLinkContinuingActivitiesGText = document.getElementById('Continuing-activities-gLink-text');
     if (DivisionIdContinuingActivitiesG =='0'){
         if (GroupElementContinuingActivitiesG){
             GroupElementContinuingActivitiesG.style.display = 'none';
         }
         if (GroupElementLinkContinuingActivitiesG){
             GroupElementLinkContinuingActivitiesG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkContinuingActivitiesGText){
             GroupElementLinkContinuingActivitiesGText.style.display = 'none';
         }
     }
     var DivisionIdWholelifeinsurancepremiumpaymentcompletionG = document.getElementById('MIR-IND-3-35-FLD-2').value;
     var GroupElementWholelifeinsurancepremiumpaymentcompletionG = document.getElementById('Whole-life-insurance-premium-payment-completion-g');
     var GroupElementLinkWholelifeinsurancepremiumpaymentcompletionG = document.getElementById('Whole-life-insurance-premium-payment-completion-gLink');
     var GroupElementLinkWholelifeinsurancepremiumpaymentcompletionGText = document.getElementById('Whole-life-insurance-premium-payment-completion-gLink-text');
     if (DivisionIdWholelifeinsurancepremiumpaymentcompletionG =='0'){
         if (GroupElementWholelifeinsurancepremiumpaymentcompletionG){
             GroupElementWholelifeinsurancepremiumpaymentcompletionG.style.display = 'none';
         }
         if (GroupElementLinkWholelifeinsurancepremiumpaymentcompletionG){
             GroupElementLinkWholelifeinsurancepremiumpaymentcompletionG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkWholelifeinsurancepremiumpaymentcompletionGText){
             GroupElementLinkWholelifeinsurancepremiumpaymentcompletionGText.style.display = 'none';
         }
     }
     var DivisionIdWholelifeinsurancespecialdividendG = document.getElementById('MIR-IND-3-35-FLD-3').value;
     var GroupElementWholelifeinsurancespecialdividendG = document.getElementById('Whole-life-insurance-special-dividend-g');
     var GroupElementLinkWholelifeinsurancespecialdividendG = document.getElementById('Whole-life-insurance-special-dividend-gLink');
     var GroupElementLinkWholelifeinsurancespecialdividendGText = document.getElementById('Whole-life-insurance-special-dividend-gLink-text');
     if (DivisionIdWholelifeinsurancespecialdividendG =='0'){
         if (GroupElementWholelifeinsurancespecialdividendG){
             GroupElementWholelifeinsurancespecialdividendG.style.display = 'none';
         }
         if (GroupElementLinkWholelifeinsurancespecialdividendG){
             GroupElementLinkWholelifeinsurancespecialdividendG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkWholelifeinsurancespecialdividendGText){
             GroupElementLinkWholelifeinsurancespecialdividendGText.style.display = 'none';
         }
     }
     var DivisionIdSurvivalbenefitdeferG = document.getElementById('MIR-IND-3-35-FLD-8').value;
     var GroupElementSurvivalbenefitdeferG = document.getElementById('Survival-benefit-defer-g');
     var GroupElementLinkSurvivalbenefitdeferG = document.getElementById('Survival-benefit-defer-gLink');
     var GroupElementLinkSurvivalbenefitdeferGText = document.getElementById('Survival-benefit-defer-gLink-text');
     if (DivisionIdSurvivalbenefitdeferG =='0'){
         if (GroupElementSurvivalbenefitdeferG){
             GroupElementSurvivalbenefitdeferG.style.display = 'none';
         }
         if (GroupElementLinkSurvivalbenefitdeferG){
             GroupElementLinkSurvivalbenefitdeferG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSurvivalbenefitdeferGText){
             GroupElementLinkSurvivalbenefitdeferGText.style.display = 'none';
         }
     }
     var DivisionIdSurvivalbenefitpaymentG = document.getElementById('MIR-IND-3-35-FLD-9').value;
     var GroupElementSurvivalbenefitpaymentG = document.getElementById('Survival-benefit-payment-g');
     var GroupElementLinkSurvivalbenefitpaymentG = document.getElementById('Survival-benefit-payment-gLink');
     var GroupElementLinkSurvivalbenefitpaymentGText = document.getElementById('Survival-benefit-payment-gLink-text');
     if (DivisionIdSurvivalbenefitpaymentG =='0'){
         if (GroupElementSurvivalbenefitpaymentG){
             GroupElementSurvivalbenefitpaymentG.style.display = 'none';
         }
         if (GroupElementLinkSurvivalbenefitpaymentG){
             GroupElementLinkSurvivalbenefitpaymentG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSurvivalbenefitpaymentGText){
             GroupElementLinkSurvivalbenefitpaymentGText.style.display = 'none';
         }
     }
     var DivisionIdSurvivalbenefitpaymenthistoryG = document.getElementById('MIR-IND-3-35-FLD-10').value;
     var GroupElementSurvivalbenefitpaymenthistoryG = document.getElementById('Survival-benefit-payment-history-g');
     var GroupElementLinkSurvivalbenefitpaymenthistoryG = document.getElementById('Survival-benefit-payment-history-gLink');
     var GroupElementLinkSurvivalbenefitpaymenthistoryGText = document.getElementById('Survival-benefit-payment-history-gLink-text');
     if (DivisionIdSurvivalbenefitpaymenthistoryG =='0'){
         if (GroupElementSurvivalbenefitpaymenthistoryG){
             GroupElementSurvivalbenefitpaymenthistoryG.style.display = 'none';
         }
         if (GroupElementLinkSurvivalbenefitpaymenthistoryG){
             GroupElementLinkSurvivalbenefitpaymenthistoryG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSurvivalbenefitpaymenthistoryGText){
             GroupElementLinkSurvivalbenefitpaymenthistoryGText.style.display = 'none';
         }
     }
     var DivisionIdChildrensinsurancebasicG = document.getElementById('MIR-IND-3-35-FLD-11').value;
     var GroupElementChildrensinsurancebasicG = document.getElementById('Childrens-insurance-basic-g');
     var GroupElementLinkChildrensinsurancebasicG = document.getElementById('Childrens-insurance-basic-gLink');
     var GroupElementLinkChildrensinsurancebasicGText = document.getElementById('Childrens-insurance-basic-gLink-text');
     if (DivisionIdChildrensinsurancebasicG =='0'){
         if (GroupElementChildrensinsurancebasicG){
             GroupElementChildrensinsurancebasicG.style.display = 'none';
         }
          if (GroupElementLinkChildrensinsurancebasicG){
              GroupElementLinkChildrensinsurancebasicG.style.display = 'none';
          }
     }
     else
     {
         if (GroupElementLinkChildrensinsurancebasicGText){
             GroupElementLinkChildrensinsurancebasicGText.style.display = 'none';
         }
     } 
     var DivisionIdDeferredawardG = document.getElementById('MIR-IND-3-35-FLD-12').value;
     var GroupElementDeferredawardG = document.getElementById('Deferred-award-g');
     var GroupElementLinkDeferredawardG = document.getElementById('Deferred-award-gLink');
     var GroupElementLinkDeferredawardGText = document.getElementById('Deferred-award-gLink-text');
     if (DivisionIdDeferredawardG =='0'){
         if (GroupElementDeferredawardG){
             GroupElementDeferredawardG.style.display = 'none';
         }
         if (GroupElementLinkDeferredawardG){
             GroupElementLinkDeferredawardG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkDeferredawardGText){
             GroupElementLinkDeferredawardGText.style.display = 'none';
         }
     }
     var DivisionIdAwardpaymentG = document.getElementById('MIR-IND-3-35-FLD-13').value;
     var GroupElementAwardpaymentG = document.getElementById('Award-payment-g');
     var GroupElementLinkAwardpaymentG = document.getElementById('Award-payment-gLink');
     var GroupElementLinkAwardpaymentGText = document.getElementById('Award-payment-gLink-text');
     if (DivisionIdAwardpaymentG =='0'){
         if (GroupElementAwardpaymentG){
             GroupElementAwardpaymentG.style.display = 'none';
         }
          if (GroupElementLinkAwardpaymentG){
              GroupElementLinkAwardpaymentG.style.display = 'none';
          }
     }
     else
     {
         if (GroupElementLinkAwardpaymentGText){
             GroupElementLinkAwardpaymentGText.style.display = 'none';
         }
     }
     var DivisionIdAwardpaymenthistoryG = document.getElementById('MIR-IND-3-35-FLD-14').value;
     var GroupElementAwardpaymenthistoryG = document.getElementById('Award-payment-history-g');
     var GroupElementLinkAwardpaymenthistoryG = document.getElementById('Award-payment-history-gLink');
     var GroupElementLinkAwardpaymenthistoryGText = document.getElementById('Award-payment-history-gLink-text');
     if (DivisionIdAwardpaymenthistoryG =='0'){
         if (GroupElementAwardpaymenthistoryG){
             GroupElementAwardpaymenthistoryG.style.display = 'none';
         }
         if (GroupElementLinkAwardpaymenthistoryG){
             GroupElementLinkAwardpaymenthistoryG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkAwardpaymenthistoryGText){
             GroupElementLinkAwardpaymenthistoryGText.style.display = 'none';
         }
     }
     var DivisionIdSetsales2G = document.getElementById('MIR-IND-3-35-FLD-17').value;
     var GroupElementSetsales2G = document.getElementById('Set-sales2-g');
     var GroupElementLinkSetsales2G = document.getElementById('Set-sales2-gLink');
     var GroupElementLinkSetsales2GText = document.getElementById('Set-sales2-gLink-text');
     if (DivisionIdSetsales2G =='0'){
         if (GroupElementSetsales2G){
             GroupElementSetsales2G.style.display = 'none';
         }
         if (GroupElementLinkSetsales2G){
             GroupElementLinkSetsales2G.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSetsales2GText){
             GroupElementLinkSetsales2GText.style.display = 'none';
         }
     }
     var DivisionIdIncreasepureendowmentpremiumdeferG = document.getElementById('MIR-ADD5-0-35-FLD-7').value;
     var GroupElementIncreasepureendowmentpremiumdeferG = document.getElementById('Increase-pure-endowment-premium-defer-g');
     var GroupElementLinkIncreasepureendowmentpremiumdeferG = document.getElementById('Increase-pure-endowment-premium-defer-gLink');
     var GroupElementLinkIncreasepureendowmentpremiumdeferGText = document.getElementById('Increase-pure-endowment-premium-defer-gLink-text');
     if (DivisionIdIncreasepureendowmentpremiumdeferG =='0'){
         if (GroupElementIncreasepureendowmentpremiumdeferG){
             GroupElementIncreasepureendowmentpremiumdeferG.style.display = 'none';
         }
         if (GroupElementLinkIncreasepureendowmentpremiumdeferG){
             GroupElementLinkIncreasepureendowmentpremiumdeferG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkIncreasepureendowmentpremiumdeferGText){
             GroupElementLinkIncreasepureendowmentpremiumdeferGText.style.display = 'none';
         }
     }
     var DivisionIdVestingDeferG = document.getElementById('MIR-ADD5-0-35-FLD-8').value;
     var GroupElementVestingDeferG = document.getElementById('Vesting-defer-g');
     var GroupElementLinkVestingDeferG = document.getElementById('Vesting-defer-gLink');
     var GroupElementLinkVestingDeferGText = document.getElementById('Vesting-defer-gLink-text');
     if (DivisionIdVestingDeferG =='0'){
         if (GroupElementVestingDeferG){
             GroupElementVestingDeferG.style.display = 'none';
         }
         if (GroupElementLinkVestingDeferG){
             GroupElementLinkVestingDeferG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkVestingDeferGText){
             GroupElementLinkVestingDeferGText.style.display = 'none';
         }
     }
     var DivisionIdContinuingActivitiesMidCareerAdditionG = document.getElementById('MIR-ADD5-0-35-FLD-9').value;
     var GroupElementContinuingActivitiesMidCareerAdditionG = document.getElementById('Continuing-activities-mid-career-addition-g');
     var GroupElementLinkContinuingActivitiesMidCareerAdditionG = document.getElementById('Continuing-activities-mid-career-addition-gLink');
     var GroupElementLinkContinuingActivitiesMidCareerAdditionGText = document.getElementById('Continuing-activities-mid-career-addition-gLink-text');
     if (DivisionIdContinuingActivitiesMidCareerAdditionG =='0'){
         if (GroupElementContinuingActivitiesMidCareerAdditionG){
             GroupElementContinuingActivitiesMidCareerAdditionG.style.display = 'none';
         }
         if (GroupElementLinkContinuingActivitiesMidCareerAdditionG){
             GroupElementLinkContinuingActivitiesMidCareerAdditionG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkContinuingActivitiesMidCareerAdditionGText){
             GroupElementLinkContinuingActivitiesMidCareerAdditionGText.style.display = 'none';
         }
     }
     var DivisionIdTermLifeSpecialDividendAmountG = document.getElementById('MIR-ADD5-0-35-FLD-10').value;
     var GroupElementTermLifeSpecialDividendAmountG = document.getElementById('Term-Life-Special-Dividend-Amount-g');
     var GroupElementLinkTermLifeSpecialDividendAmountG = document.getElementById('Term-Life-Special-Dividend-Amount-gLink');
     var GroupElementLinkTermLifeSpecialDividendAmountGText = document.getElementById('Term-Life-Special-Dividend-Amount-gLink-text');
     if (DivisionIdTermLifeSpecialDividendAmountG =='0'){
         if (GroupElementTermLifeSpecialDividendAmountG){
             GroupElementTermLifeSpecialDividendAmountG.style.display = 'none';
         }
         if (GroupElementLinkTermLifeSpecialDividendAmountG){
             GroupElementLinkTermLifeSpecialDividendAmountG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkTermLifeSpecialDividendAmountGText){
             GroupElementLinkTermLifeSpecialDividendAmountGText.style.display = 'none';
         }
     }
     var DivisionIdSpecialdividenddeferG = document.getElementById('MIR-ADD5-0-35-FLD-11').value;
     var GroupElementSpecialdividenddeferG = document.getElementById('Special-dividend-defer-g');
     var GroupElementLinkSpecialdividenddeferG = document.getElementById('Special-dividend-defer-gLink');
     var GroupElementLinkSpecialdividenddeferGText = document.getElementById('Special-dividend-defer-gLink-text');
     if (DivisionIdSpecialdividenddeferG =='0'){
         if (GroupElementSpecialdividenddeferG){
             GroupElementSpecialdividenddeferG.style.display = 'none';
         }
         if (GroupElementLinkSpecialdividenddeferG){
             GroupElementLinkSpecialdividenddeferG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSpecialdividenddeferGText){
             GroupElementLinkSpecialdividenddeferGText.style.display = 'none';
         }
     }
     var DivisionIdPreallocationG = document.getElementById('MIR-ADD5-0-35-FLD-20').value;
     var GroupElementPreallocationG = document.getElementById('Pre-allocation-g');
     var GroupElementLinkPreallocationG = document.getElementById('Pre-allocation-gLink');
     var GroupElementLinkPreallocationGText = document.getElementById('Pre-allocation-gLink-text');
     if (DivisionIdPreallocationG =='0'){
         if (GroupElementPreallocationG){
            GroupElementPreallocationG.style.display = 'none';
        }
        if (GroupElementLinkPreallocationG){
            GroupElementLinkPreallocationG.style.display = 'none';
        }
     }
     else
     {
         if (GroupElementLinkPreallocationGText){
             GroupElementLinkPreallocationGText.style.display = 'none';
         }
     }
     var DivisionIdRiderupdateinformationG = document.getElementById('MIR-ADD5-0-35-FLD-21').value;
     var GroupElementRiderupdateinformationG = document.getElementById('Rider-update-information-g');
     var GroupElementLinkRiderupdateinformationG = document.getElementById('Rider-update-information-gLink');
     var GroupElementLinkRiderupdateinformationGText = document.getElementById('Rider-update-information-gLink-text');
     if (DivisionIdRiderupdateinformationG =='0'){
         if (GroupElementRiderupdateinformationG){
             GroupElementRiderupdateinformationG.style.display = 'none';
         }
         if (GroupElementLinkRiderupdateinformationG){
             GroupElementLinkRiderupdateinformationG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkRiderupdateinformationGText){
             GroupElementLinkRiderupdateinformationGText.style.display = 'none';
         }
     }
     var DivisionIdApplicationformmanagementG = document.getElementById('MIR-ADD5-0-35-FLD-23').value;
     var GroupElementApplicationformmanagementG = document.getElementById('Application-form-management-g');
     var GroupElementLinkApplicationformmanagementG = document.getElementById('Application-form-management-gLink');
     var GroupElementLinkApplicationformmanagementGText = document.getElementById('Application-form-management-gLink-text');
     if (DivisionIdApplicationformmanagementG =='0'){
         if (GroupElementApplicationformmanagementG){
             GroupElementApplicationformmanagementG.style.display = 'none';
         }
         if (GroupElementLinkApplicationformmanagementG){
             GroupElementLinkApplicationformmanagementG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkApplicationformmanagementGText){
             GroupElementLinkApplicationformmanagementGText.style.display = 'none';
         }
     }
     var DivisionIdPolicyconditionchangesbasicG = document.getElementById('MIR-ADD5-0-35-FLD-32').value;
     var GroupElementPolicyconditionchangesbasicG = document.getElementById('Policy-condition-changes-basic-g');
     var GroupElementLinkPolicyconditionchangesbasicG = document.getElementById('Policy-condition-changes-basic-gLink');
     var GroupElementLinkPolicyconditionchangesbasicGText = document.getElementById('Policy-condition-changes-basic-gLink-text');
     if (DivisionIdPolicyconditionchangesbasicG =='0'){
         if (GroupElementPolicyconditionchangesbasicG){
             GroupElementPolicyconditionchangesbasicG.style.display = 'none';
         }
          if (GroupElementLinkPolicyconditionchangesbasicG){
              GroupElementLinkPolicyconditionchangesbasicG.style.display = 'none';
          }
     }
     else
     {
         if (GroupElementLinkPolicyconditionchangesbasicGText){
             GroupElementLinkPolicyconditionchangesbasicGText.style.display = 'none';
         }
     }
     var DivisionIdPolicyconditionchangesriderG = document.getElementById('MIR-ADD5-0-35-FLD-33').value;
     var GroupElementPolicyconditionchangesriderG = document.getElementById('Policy-condition-changes-rider-g');
     var GroupElementLinkPolicyconditionchangesriderG = document.getElementById('Policy-condition-changes-rider-gLink');
     var GroupElementLinkPolicyconditionchangesriderGText = document.getElementById('Policy-condition-changes-rider-gLink-text');
     if (DivisionIdPolicyconditionchangesriderG =='0'){
         if (GroupElementPolicyconditionchangesriderG){
             GroupElementPolicyconditionchangesriderG.style.display = 'none';
         }
         if (GroupElementLinkPolicyconditionchangesriderG){
             GroupElementLinkPolicyconditionchangesriderG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkPolicyconditionchangesriderGText){
             GroupElementLinkPolicyconditionchangesriderGText.style.display = 'none';
         }
     }
     var DivisionIdBasePolicyInfoatUpdateG = document.getElementById('MIR-ADD5-0-35-FLD-34').value;
     var GroupElementBasePolicyInfoatUpdateG = document.getElementById('Base-Policy-Info-at-Update-g');
     var GroupElementLinkBasePolicyInfoatUpdateG = document.getElementById('Base-Policy-Info-at-Update-gLink');
     var GroupElementLinkBasePolicyInfoatUpdateGText = document.getElementById('Base-Policy-Info-at-Update-gLink-text');
     if (DivisionIdBasePolicyInfoatUpdateG =='0'){
         if (GroupElementBasePolicyInfoatUpdateG){
             GroupElementBasePolicyInfoatUpdateG.style.display = 'none';
         }
         if (GroupElementLinkBasePolicyInfoatUpdateG){
             GroupElementLinkBasePolicyInfoatUpdateG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkBasePolicyInfoatUpdateGText){
             GroupElementLinkBasePolicyInfoatUpdateGText.style.display = 'none';
         }
     }
     var DivisionIdPolicyconditionschangeannuityG = document.getElementById('MIR-ADD5-0-35-FLD-35').value;
     var GroupElementPolicyconditionschangeannuityG = document.getElementById('Policy-conditions-change-annuity-g');
     var GroupElementLinkPolicyconditionschangeannuityG = document.getElementById('Policy-conditions-change-annuity-gLink');
     var GroupElementLinkPolicyconditionschangeannuityGText = document.getElementById('Policy-conditions-change-annuity-gLink-text');
     if (DivisionIdPolicyconditionschangeannuityG =='0'){
         if (GroupElementPolicyconditionschangeannuityG){
             GroupElementPolicyconditionschangeannuityG.style.display = 'none';
         }
         if (GroupElementLinkPolicyconditionschangeannuityG){
             GroupElementLinkPolicyconditionschangeannuityG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkPolicyconditionschangeannuityGText){
             GroupElementLinkPolicyconditionschangeannuityGText.style.display = 'none';
         }
     } 
     var DivisionIdNoaccidentbenefitpaymentG = document.getElementById('MIR-ADD6-0-24-FLD-1').value;
     var GroupElementNoaccidentbenefitpaymentG = document.getElementById('No-accident-benefit-payment-g');
     var GroupElementLinkNoaccidentbenefitpaymentG = document.getElementById('No-accident-benefit-payment-gLink');
     var GroupElementLinkNoaccidentbenefitpaymentGText = document.getElementById('No-accident-benefit-payment-gLink-text');
     if (DivisionIdNoaccidentbenefitpaymentG =='0'){
         if (GroupElementNoaccidentbenefitpaymentG){
             GroupElementNoaccidentbenefitpaymentG.style.display = 'none';
         }
         if (GroupElementLinkNoaccidentbenefitpaymentG){
          GroupElementLinkNoaccidentbenefitpaymentG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkNoaccidentbenefitpaymentGText){
             GroupElementLinkNoaccidentbenefitpaymentGText.style.display = 'none';
         }
     }
     var DivisionIdSavingriderbenefitpaymenthistory = document.getElementById('MIR-ADD6-0-24-FLD-12').value;
     var GroupElementSavingriderbenefitpaymenthistory = document.getElementById('Saving-rider-benefit-payment-history-g');
     var GroupElementLinkSavingriderbenefitpaymenthistory = document.getElementById('Saving-rider-benefit-payment-history-gLink');
     var GroupElementLinkSavingriderbenefitpaymenthistoryText = document.getElementById('Saving-rider-benefit-payment-history-gLink-text');
     if (DivisionIdSavingriderbenefitpaymenthistory =='0'){
         if (GroupElementSavingriderbenefitpaymenthistory){
             GroupElementSavingriderbenefitpaymenthistory.style.display = 'none';
         }
         if (GroupElementLinkSavingriderbenefitpaymenthistory){
             GroupElementLinkSavingriderbenefitpaymenthistory.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkSavingriderbenefitpaymenthistoryText){
             GroupElementLinkSavingriderbenefitpaymenthistoryText.style.display = 'none';
         }
     }
     var DivisionIdBasePolicyInformationatRenewalG = document.getElementById('MIR-ADD6-0-24-FLD-23').value;
     var GroupElementBasePolicyInformationatRenewalG = document.getElementById('Base-Policy-Information-at-Renewal-g');
     var GroupElementLinkBasePolicyInformationatRenewalG = document.getElementById('Base-Policy-Information-at-Renewal-gLink');
     var GroupElementLinkBasePolicyInformationatRenewalGText = document.getElementById('Base-Policy-Information-at-Renewal-gLink-text');
     if (DivisionIdBasePolicyInformationatRenewalG =='0'){
         if (GroupElementBasePolicyInformationatRenewalG){
             GroupElementBasePolicyInformationatRenewalG.style.display = 'none';
         }
         if (GroupElementLinkBasePolicyInformationatRenewalG){
             GroupElementLinkBasePolicyInformationatRenewalG.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkBasePolicyInformationatRenewalGText){
             GroupElementLinkBasePolicyInformationatRenewalGText.style.display = 'none';
         }
     }
     var DivisionIdTransferInformation2 = document.getElementById('MIR-ADD6-26-35-FLD-1').value;
     var GroupElementTransferInformation2 = document.getElementById('Transfer-Information2-g');
     var GroupElementLinkTransferInformation2 = document.getElementById('Transfer-Information2-gLink');
     var GroupElementLinkTransferInformation2Text = document.getElementById('Transfer-Information2-gLink-text');
     if (DivisionIdTransferInformation2 =='0'){
         if (GroupElementTransferInformation2){
             GroupElementTransferInformation2.style.display = 'none';
         }
         if (GroupElementLinkTransferInformation2){
             GroupElementLinkTransferInformation2.style.display = 'none';
         }
     }
     else
     {
         if (GroupElementLinkTransferInformation2Text){
             GroupElementLinkTransferInformation2Text.style.display = 'none';
         }
     }
}
