// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9G76.js                                                    *
//*  Description: UNISYS POLICY INQUIRY SCREEN                                 *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*  UYSD11  CTS      INTIAL VERSION                                           *
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

     var DivisionIdSubstandardG = document.getElementById('MIR-ADD1-5-36-FLD-22').innerHTML;
     var GroupElementSubstandardG = document.getElementById('substandard-g');
     var GroupElementLinkSubstandardG = document.getElementById('substandard-gLink');
     var GroupElementLinkSubstandardGText = document.getElementById('substandard-gLink-text');
     if (DivisionIdSubstandardG =='0'){
         GroupElementSubstandardG.style.display = 'none';
         GroupElementLinkSubstandardG.style.display = 'none';
     }
     else
     {
         GroupElementLinkSubstandardGText.style.display = 'none';
     }
     var DivisionIdTermInsuanceG = document.getElementById('MIR-ADD1-5-36-FLD-24').innerHTML;
     var GroupElementTermInsuanceG = document.getElementById('term-insurance-g');
     var GroupElementLinkTermInsuanceG = document.getElementById('term-insurance-gLink');
     var GroupElementLinkTermInsuanceGText = document.getElementById('term-insurance-gLink-text');
     if (DivisionIdTermInsuanceG =='0'){
         GroupElementTermInsuanceG.style.display = 'none'; 
          GroupElementLinkTermInsuanceG.style.display = 'none';
     }
     else
     {
         GroupElementLinkTermInsuanceGText.style.display = 'none';
     }
     var DivisionIdReinsuranceG = document.getElementById('MIR-ADD1-5-36-FLD-25').innerHTML;
     var GroupElementReinsuranceG = document.getElementById('reinsurance-g');
     var GroupElementLinkReinsuranceG = document.getElementById('reinsurance-gLink');
     var GroupElementLinkReinsuranceGText = document.getElementById('reinsurance-gLink-text');
     if (DivisionIdReinsuranceG =='0'){
         GroupElementReinsuranceG.style.display = 'none'; 
          GroupElementLinkReinsuranceG.style.display = 'none';
     }
     else
     {
         GroupElementLinkReinsuranceGText.style.display = 'none';
     }
     var DivisionIdPerformanceG = document.getElementById('MIR-ADD1-5-36-FLD-30').innerHTML;
     var GroupElementPerformanceG = document.getElementById('performance-g');
     var GroupElementLinkPerformanceG = document.getElementById('performance-gLink');
     var GroupElementLinkPerformanceGText = document.getElementById('performance-gLink-text');
     if (DivisionIdPerformanceG =='0'){
         GroupElementPerformanceG.style.display = 'none'; 
          GroupElementLinkPerformanceG.style.display = 'none';
     }
     else
     {
         GroupElementLinkPerformanceGText.style.display = 'none';
     }
     var DivisionIdLoanBasicG = document.getElementById('MIR-ADD2-0-35-FLD-6').innerHTML;
     var GroupElementLoanBasicG = document.getElementById('loan-basic-g');
     var GroupElementLinkLoanBasicG = document.getElementById('loan-basic-gLink');
     var GroupElementLinkLoanBasicGText = document.getElementById('loan-basic-gLink-text');
     if (DivisionIdLoanBasicG =='0'){
         GroupElementLoanBasicG.style.display = 'none'; 
          GroupElementLinkLoanBasicG.style.display = 'none';
     }
     else
     {
         GroupElementLinkLoanBasicGText.style.display = 'none';
     }
     var DivisionIdLapseReinG = document.getElementById('MIR-ADD2-0-35-FLD-9').innerHTML;
     var GroupElementLapseReinG = document.getElementById('lapse-reinstatement-g');
     var GroupElementLinkLapseReinG = document.getElementById('lapse-reinstatement-gLink');
     var GroupElementLinkLapseReinGText = document.getElementById('lapse-reinstatement-gLink-text');
     if (DivisionIdLapseReinG =='0'){
         GroupElementLapseReinG.style.display = 'none'; 
          GroupElementLinkLapseReinG.style.display = 'none';
     }
     else
     {
         GroupElementLinkLapseReinGText.style.display = 'none';
     }
     var DivisionIdPaidUpG = document.getElementById('MIR-ADD2-0-35-FLD-10').innerHTML;
     var GroupElementPaidUpG = document.getElementById('paid-up-g');
     var GroupElementLinkPaidUpG = document.getElementById('paid-up-gLink');
     var GroupElementLinkPaidUpGText = document.getElementById('paid-up-gLink-text');
     if (DivisionIdPaidUpG =='0'){
         GroupElementPaidUpG.style.display = 'none'; 
          GroupElementLinkPaidUpG.style.display = 'none';
     }
     else
     {
         GroupElementLinkPaidUpGText.style.display = 'none';
     }
     var DivisionIdAutoLoanPolicyG = document.getElementById('MIR-ADD2-0-35-FLD-12').innerHTML;
     var GroupElementAutoLoanPolicyG = document.getElementById('auto-policy-loan-g');
     var GroupElementLinkAutoLoanPolicyG = document.getElementById('auto-policy-loan-gLink');
     var GroupElementLinkAutoLoanPolicyGText = document.getElementById('auto-policy-loan-gLink-text');
     if (DivisionIdAutoLoanPolicyG =='0'){
         GroupElementAutoLoanPolicyG.style.display = 'none'; 
          GroupElementLinkAutoLoanPolicyG.style.display = 'none';
     }
     else
     {
         GroupElementLinkAutoLoanPolicyGText.style.display = 'none';
     }
     var DivisionIdAdvPremFixG = document.getElementById('MIR-ADD2-0-35-FLD-13').innerHTML;
     var GroupElementAdvPremFixG = document.getElementById('advance-premium-fixed-g');
     var GroupElementLinkAdvPremFixG = document.getElementById('advance-premium-fixed-gLink');
     var GroupElementLinkAdvPremFixGText = document.getElementById('advance-premium-fixed-gLink-text');
     if (DivisionIdAdvPremFixG =='0'){
         GroupElementAdvPremFixG.style.display = 'none'; 
          GroupElementLinkAdvPremFixG.style.display = 'none';
     }
     else
     {
         GroupElementLinkAdvPremFixGText.style.display = 'none';
     }
     var DivisionIdChngAdminAgentG = document.getElementById('MIR-ADD2-0-35-FLD-14').innerHTML;
     var GroupElementChngAdminAgentG = document.getElementById('change-adminstrative-agent-g');
     var GroupElementLinkChngAdminAgentG = document.getElementById('change-adminstrative-agent-gLink');
     var GroupElementLinkChngAdminAgentGText = document.getElementById('change-adminstrative-agent-gLink-text');
     if (DivisionIdChngAdminAgentG =='0'){
         GroupElementChngAdminAgentG.style.display = 'none'; 
          GroupElementLinkChngAdminAgentG.style.display = 'none';
     }
     else
     {
         GroupElementLinkChngAdminAgentGText.style.display = 'none';
     }
     var DivisionIdBnkTransferG = document.getElementById('MIR-ADD2-0-35-FLD-15').innerHTML;
     var GroupElementBnkTransferG = document.getElementById('bank-transfer-g');
     var GroupElementLinkBnkTransferG = document.getElementById('bank-transfer-gLink');
     var GroupElementLinkBnkTransferGText = document.getElementById('bank-transfer-gLink-text');
     if (DivisionIdBnkTransferG =='0'){
         GroupElementBnkTransferG.style.display = 'none'; 
          GroupElementLinkBnkTransferG.style.display = 'none';
     }
     else
     {
         GroupElementLinkBnkTransferGText.style.display = 'none';
     }
     var DivisionIdDantaiG = document.getElementById('MIR-ADD2-0-35-FLD-16').innerHTML;
     var GroupElementDantaiG = document.getElementById('dantai-g');
     var GroupElementLinkDantaiG = document.getElementById('dantai-gLink');
     var GroupElementLinkDantaiGText = document.getElementById('dantai-gLink-text');
     if (DivisionIdDantaiG =='0'){
         GroupElementDantaiG.style.display = 'none'; 
          GroupElementLinkDantaiG.style.display = 'none';
     }
     else
     {
         GroupElementLinkDantaiGText.style.display = 'none';
     }

     var DivisionIdReinsBG = document.getElementById('MIR-ADD2-0-35-FLD-27').innerHTML;
     var GroupElementReinsBG = document.getElementById('reinstatement-b-g');
     var GroupElementLinkReinsBG = document.getElementById('reinstatement-b-gLink');
     var GroupElementLinkReinsBGText = document.getElementById('reinstatement-b-gLink-text');
     if (DivisionIdReinsBG =='0'){
         GroupElementReinsBG.style.display = 'none'; 
          GroupElementLinkReinsBG.style.display = 'none';
     }
     else
     {
         GroupElementLinkReinsBGText.style.display = 'none';
     }
     var DivisionIdExtIntG = document.getElementById('MIR-ADD2-0-35-FLD-28').innerHTML;
     var GroupElementExtIntG = document.getElementById('extended-interest-g');
     var GroupElementLinkExtIntG = document.getElementById('extended-interest-gLink');
     var GroupElementLinkExtIntGText = document.getElementById('extended-interest-gLink-text');
     if (DivisionIdExtIntG =='0'){
         GroupElementExtIntG.style.display = 'none'; 
          GroupElementLinkExtIntG.style.display = 'none';
     }
     else
     {
         GroupElementLinkExtIntGText.style.display = 'none';
     }
     var DivisionIdLoanHistoryG = document.getElementById('MIR-ADD2-0-35-FLD-32').innerHTML;
     var GroupElementLoanHistoryG = document.getElementById('loan-history-g');
     var GroupElementLinkLoanHistoryG = document.getElementById('loan-history-gLink');
     var GroupElementLinkLoanHistoryGText = document.getElementById('loan-history-gLink-text');
     if (DivisionIdLoanHistoryG =='0'){
         GroupElementLoanHistoryG.style.display = 'none'; 
          GroupElementLinkLoanHistoryG.style.display = 'none';
     }
     else
     {
         GroupElementLinkLoanHistoryGText.style.display = 'none';
     }
     var DivisionIdBenefitHistoryG = document.getElementById('MIR-ADD2-0-35-FLD-35').innerHTML;
     var GroupElementBenefitHistoryG = document.getElementById('benefit-history-g');
     var GroupElementLinkBenefitHistoryG = document.getElementById('benefit-history-gLink');
     var GroupElementLinkBenefitHistoryGText = document.getElementById('benefit-history-gLink-text');
     if (DivisionIdBenefitHistoryG =='0'){
         GroupElementBenefitHistoryG.style.display = 'none'; 
          GroupElementLinkBenefitHistoryG.style.display = 'none';
     }
     else
     {
         GroupElementLinkBenefitHistoryGText.style.display = 'none';
     }
     var DivisionIdDepositHistoryG = document.getElementById('MIR-ADD2-0-35-FLD-36').innerHTML;
     var GroupElementDepositHistoryG = document.getElementById('deposit-history-g');
     var GroupElementLinkDepositHistoryG = document.getElementById('deposit-history-gLink');
     var GroupElementLinkDepositHistoryGText = document.getElementById('deposit-history-gLink-text');
     if (DivisionIdDepositHistoryG =='0'){
         GroupElementDepositHistoryG.style.display = 'none'; 
          GroupElementLinkDepositHistoryG.style.display = 'none';
     }
     else
     {
         GroupElementLinkDepositHistoryGText.style.display = 'none';
     }
     var DivisionIdReissuedPolicyG = document.getElementById('MIR-ADD3-0-35-FLD-1').innerHTML;
     var GroupElementReissuedPolicyG = document.getElementById('reissued-policy-g');
     var GroupElementLinkReissuedPolicyG = document.getElementById('reissued-policy-gLink');
     var GroupElementLinkReissuedPolicyGText = document.getElementById('reissued-policy-gLink-text');
     if (DivisionIdReissuedPolicyG =='0'){
         GroupElementReissuedPolicyG.style.display = 'none'; 
          GroupElementLinkReissuedPolicyG.style.display = 'none';
     }
     else
     {
         GroupElementLinkReissuedPolicyGText.style.display = 'none';
     }
     var DivisionIdPolicyConditionG = document.getElementById('MIR-ADD3-0-35-FLD-7').innerHTML;
     var GroupElementPolicyConditionG = document.getElementById('policy-condition-g');
     var GroupElementLinkPolicyConditionG = document.getElementById('policy-condition-gLink');
     var GroupElementLinkPolicyConditionGText = document.getElementById('policy-condition-gLink-text');
     if (DivisionIdPolicyConditionG =='0'){
         GroupElementPolicyConditionG.style.display = 'none'; 
          GroupElementLinkPolicyConditionG.style.display = 'none';
     }
     else
     {
         GroupElementLinkPolicyConditionGText.style.display = 'none';
     }
     var DivisionIdBankRiderG = document.getElementById('MIR-ADD3-0-35-FLD-10').innerHTML;
     var GroupElementBankRiderG = document.getElementById('bank-rider-g');
     var GroupElementLinkBankRiderG = document.getElementById('bank-rider-gLink');
     var GroupElementLinkBankRiderGText = document.getElementById('bank-rider-gLink-text');
     if (DivisionIdBankRiderG =='0'){
         GroupElementBankRiderG.style.display = 'none'; 
          GroupElementLinkBankRiderG.style.display = 'none';
     }
     else
     {
         GroupElementLinkBankRiderGText.style.display = 'none';
     }
     var DivisionIdChngBnkTrG = document.getElementById('MIR-ADD3-0-35-FLD-19').innerHTML;
     var GroupElementChngBnkTrG = document.getElementById('change-of-bank-transfer-g');
     var GroupElementLinkChngBnkTrG = document.getElementById('change-of-bank-transfer-gLink');
     var GroupElementLinkChngBnkTrGText = document.getElementById('change-of-bank-transfer-gLink-text');
     if (DivisionIdChngBnkTrG =='0'){
         GroupElementChngBnkTrG.style.display = 'none'; 
          GroupElementLinkChngBnkTrG.style.display = 'none';
     }
     else
     {
         GroupElementLinkChngBnkTrGText.style.display = 'none';
     }
     var DivisionIdChngInfoG = document.getElementById('MIR-ADD3-0-35-FLD-22').innerHTML;
     var GroupElementChngInfoG = document.getElementById('change-information-g');
     var GroupElementLinkChngInfoG = document.getElementById('change-information-gLink');
     var GroupElementLinkChngInfoGText = document.getElementById('change-information-gLink-text');
     if (DivisionIdChngInfoG =='0'){
         GroupElementChngInfoG.style.display = 'none'; 
          GroupElementLinkChngInfoG.style.display = 'none';
     }
     else
     {
         GroupElementLinkChngInfoGText.style.display = 'none';
     }
     var DivisionIdPolDetRegG = document.getElementById('MIR-ADD3-0-35-FLD-28').innerHTML;
     var GroupElementPolDetRegG = document.getElementById('policy-detail-registration-g');
     var GroupElementLinkPolDetRegG = document.getElementById('policy-detail-registration-gLink');
     var GroupElementLinkPolDetRegGText = document.getElementById('policy-detail-registration-gLink-text');
     if (DivisionIdPolDetRegG =='0'){
         GroupElementPolDetRegG.style.display = 'none'; 
          GroupElementLinkPolDetRegG.style.display = 'none';
     }
     else
     {
         GroupElementLinkPolDetRegGText.style.display = 'none';
     }
     var DivisionIdBnftDefBasesG = document.getElementById('MIR-ADD3-0-35-FLD-29').innerHTML;
     var GroupElementBnftDefBasesG = document.getElementById('benefit-deferral-bases-g');
     var GroupElementLinkBnftDefBasesG = document.getElementById('benefit-deferral-bases-gLink');
     var GroupElementLinkBnftDefBasesGText = document.getElementById('benefit-deferral-bases-gLink-text');
     if (DivisionIdBnftDefBasesG =='0'){
         GroupElementBnftDefBasesG.style.display = 'none'; 
          GroupElementLinkBnftDefBasesG.style.display = 'none';
     }
     else
     {
         GroupElementLinkBnftDefBasesGText.style.display = 'none';
     }
     var DivisionIdBnftDefHistG = document.getElementById('MIR-ADD3-0-35-FLD-30').innerHTML;
     var GroupElementBnftDefHistG = document.getElementById('benefit-deferral-history-g');
     var GroupElementLinkBnftDefHistG = document.getElementById('benefit-deferral-history-gLink');
     var GroupElementLinkBnftDefHistGText = document.getElementById('benefit-deferral-history-gLink-text');
     if (DivisionIdBnftDefHistG =='0'){
         GroupElementBnftDefHistG.style.display = 'none'; 
          GroupElementLinkBnftDefHistG.style.display = 'none';
     }
     else
     {
         GroupElementLinkBnftDefHistGText.style.display = 'none';
     }
     var DivisionIdDepositHisotry2G = document.getElementById('MIR-ADD3-0-35-FLD-36').innerHTML;
     var GroupElementDepositHisotry2G = document.getElementById('deposit-history-2g');
     var GroupElementLinkDepositHisotry2G = document.getElementById('payment-history-2gLink');
     var GroupElementLinkDepositHisotry2GText = document.getElementById('payment-history-2gLink-text');
     if (DivisionIdDepositHisotry2G =='0'){
         GroupElementDepositHisotry2G.style.display = 'none'; 
          GroupElementLinkDepositHisotry2G.style.display = 'none';
     }
     else
     {
         GroupElementLinkDepositHisotry2GText.style.display = 'none';
     }
     var DivisionIdNewAccDeathBnftRidG = document.getElementById('MIR-ADB-RIDER').innerHTML;
     var GroupElementNewAccDeathBnftRidG = document.getElementById('new-accidental-death-benefit-rider-g');
     var GroupElementLinkNewAccDeathBnftRidG = document.getElementById('new-accidental-death-benefit-rider-gLink');
     var GroupElementLinkNewAccDeathBnftRidGText = document.getElementById('new-accidental-death-benefit-rider-gLink-text');
     if (DivisionIdNewAccDeathBnftRidG =='0'){
         GroupElementNewAccDeathBnftRidG.style.display = 'none'; 
          GroupElementLinkNewAccDeathBnftRidG.style.display = 'none';
     }
     else
     {
         GroupElementLinkNewAccDeathBnftRidGText.style.display = 'none';
     }
     var DivisionIdAdvPremCerPremPayG = document.getElementById('MIR-IND-3-35-FLD-4').innerHTML;
     var GroupElementAdvPremCerPremPayG = document.getElementById('advance-premium-certificate-of-premium-payment-g');
     var GroupElementLinkAdvPremCerPremPayG = document.getElementById('advance-premium-certificate-of-premium-payment-gLink');
     var GroupElementLinkAdvPremCerPremPayGText = document.getElementById('advance-premium-certificate-of-premium-payment-gLink-text');
     if (DivisionIdAdvPremCerPremPayG =='0'){
         GroupElementAdvPremCerPremPayG.style.display = 'none'; 
          GroupElementLinkAdvPremCerPremPayG.style.display = 'none';
     }
     else
     {
         GroupElementLinkAdvPremCerPremPayGText.style.display = 'none';
     }

     var DivisionIdCerPremPayChngPremG = document.getElementById('MIR-IND-3-35-FLD-5').innerHTML;
     var GroupElementCerPremPayChngPremG = document.getElementById('certificate-of-premium-payment-change-premium-g');
     var GroupElementLinkCerPremPayChngPremG = document.getElementById('certificate-of-premium-payment-change-premium-gLink');
     var GroupElementLinkCerPremPayChngPremGText = document.getElementById('certificate-of-premium-payment-change-premium-gLink-text');
     if (DivisionIdCerPremPayChngPremG =='0'){
         GroupElementCerPremPayChngPremG.style.display = 'none'; 
          GroupElementLinkCerPremPayChngPremG.style.display = 'none';
     }
     else
     {
         GroupElementLinkCerPremPayChngPremGText.style.display = 'none';
     }
     var DivisionIdDefBeneIntG = document.getElementById('MIR-IND-3-35-FLD-6').innerHTML;
     var GroupElementDefBeneIntG = document.getElementById('defferal-benefit-interest-g');
     var GroupElementLinkDefBeneIntG = document.getElementById('defferal-benefit-interest-gLink');
     var GroupElementLinkDefBeneIntGText = document.getElementById('defferal-benefit-interest-gLink-text');
     if (DivisionIdDefBeneIntG =='0'){
         GroupElementDefBeneIntG.style.display = 'none'; 
          GroupElementLinkDefBeneIntG.style.display = 'none';
     }
     else
     {
         GroupElementLinkDefBeneIntGText.style.display = 'none';
     }
     var DivisionIdAdvPremPercCapHistG = document.getElementById('MIR-IND-3-35-FLD-16').innerHTML;
     var GroupElementAdvPremPercCapHistG = document.getElementById('advance-premium-percentage-of-capitalization-history-g');
     var GroupElementLinkAdvPremPercCapHistG = document.getElementById('advance-premium-percentage-of-capitalization-history-gLink');
     var GroupElementLinkAdvPremPercCapHistGText = document.getElementById('advance-premium-percentage-of-capitalization-history-gLink-text');
     if (DivisionIdAdvPremPercCapHistG =='0'){
         GroupElementAdvPremPercCapHistG.style.display = 'none'; 
          GroupElementLinkAdvPremPercCapHistG.style.display = 'none';
     }
     else
     {
         GroupElementLinkAdvPremPercCapHistGText.style.display = 'none';
     }
     var DivisionIdLivingNeedPaymentG = document.getElementById('MIR-IND-3-35-FLD-33').innerHTML;
     var GroupElementLivingNeedPaymentG = document.getElementById('living-needs-payment-g');
     var GroupElementLinkLivingNeedPaymentG = document.getElementById('living-needs-payment-gLink');
     var GroupElementLinkLivingNeedPaymentGText = document.getElementById('living-needs-payment-gLink-text');
     if (DivisionIdLivingNeedPaymentG =='0'){
         GroupElementLivingNeedPaymentG.style.display = 'none'; 
          GroupElementLinkLivingNeedPaymentG.style.display = 'none';
     }
     else
     {
         GroupElementLinkLivingNeedPaymentGText.style.display = 'none';
     }
     var DivisionIdAdvPremMngG = document.getElementById('MIR-ADD5-0-35-FLD-12').innerHTML;
     var GroupElementAdvPremMngG = document.getElementById('advance-premium-management-g');
     var GroupElementLinkAdvPremMngG = document.getElementById('advance-premium-management-gLink');
     var GroupElementLinkAdvPremMngGText = document.getElementById('advance-premium-management-gLink-text');
     if (DivisionIdAdvPremMngG =='0'){
         GroupElementAdvPremMngG.style.display = 'none'; 
          GroupElementLinkAdvPremMngG.style.display = 'none';
     }
     else
     {
         GroupElementLinkAdvPremMngGText.style.display = 'none';
     }
     var DivisionIdPerformance2G = document.getElementById('MIR-ADD5-0-35-FLD-13').innerHTML;
     var GroupElementPerformance2G = document.getElementById('performance-2g');
     var GroupElementLinkPerformance2G = document.getElementById('performance-2gLink');
     var GroupElementLinkPerformance2GText = document.getElementById('performance-2gLink-text');
     if (DivisionIdPerformance2G =='0'){
         GroupElementPerformance2G.style.display = 'none'; 
          GroupElementLinkPerformance2G.style.display = 'none';
     }
     else
     {
         GroupElementLinkPerformance2GText.style.display = 'none';
     }
     var DivisionIdAppFormMngtInfoG = document.getElementById('MIR-ADD5-0-35-FLD-23').innerHTML;
     var GroupElementAppFormMngtInfoG = document.getElementById('application-form-management-information-g');
     var GroupElementLinkAppFormMngtInfoG = document.getElementById('application-form-management-information-gLink');
     var GroupElementLinkAppFormMngtInfoGText = document.getElementById('application-form-management-information-gLink-text');
     if (DivisionIdAppFormMngtInfoG =='0'){
         GroupElementAppFormMngtInfoG.style.display = 'none'; 
          GroupElementLinkAppFormMngtInfoG.style.display = 'none';
     }
     else
     {
         GroupElementLinkAppFormMngtInfoGText.style.display = 'none';
     }
     var DivisionIdPaymentAccountG = document.getElementById('MIR-ADD5-0-35-FLD-24').innerHTML;
     var GroupElementPaymentAccountG = document.getElementById('payment-account-g');
     var GroupElementLinkPaymentAccountG = document.getElementById('payment-account-gLink');
     var GroupElementLinkPaymentAccountGText = document.getElementById('payment-account-gLink-text');
     if (DivisionIdPaymentAccountG =='0'){
         GroupElementPaymentAccountG.style.display = 'none'; 
          GroupElementLinkPaymentAccountG.style.display = 'none';
     }
     else
     {
         GroupElementLinkPaymentAccountGText.style.display = 'none';
     }
     var DivisionIdAccOutRiderG = document.getElementById('MIR-ADD5-0-35-FLD-25').innerHTML;
     var GroupElementAccOutRiderG = document.getElementById('special-sickness-coverage-rider-g');
     var GroupElementLinkAccOutRiderG = document.getElementById('special-sickness-coverage-rider-gLink');
     var GroupElementLinkAccOutRiderGText = document.getElementById('special-sickness-coverage-rider-gLink-text');
     if (DivisionIdAccOutRiderG =='0'){
         GroupElementAccOutRiderG.style.display = 'none'; 
          GroupElementLinkAccOutRiderG.style.display = 'none';
     }
     else
     {
         GroupElementLinkAccOutRiderGText.style.display = 'none';
     }
     var DivisionIdDuplicationG = document.getElementById('MIR-ADD5-0-35-FLD-29').innerHTML;
     var GroupElementDuplicationG = document.getElementById('duplication-g');
     var GroupElementLinkDuplicationG = document.getElementById('duplication-gLink');
     var GroupElementLinkDuplicationGText = document.getElementById('duplication-gLink-text');
     if (DivisionIdDuplicationG =='0'){
         GroupElementDuplicationG.style.display = 'none'; 
          GroupElementLinkDuplicationG.style.display = 'none';
     }
     else
     {
         GroupElementLinkDuplicationGText.style.display = 'none';
     }
     var DivisionIdAccExtRiderG = document.getElementById('MIR-ADD6-0-24-FLD-2').innerHTML;
     var GroupElementAccExtRiderG = document.getElementById('accidental-extra-rider-g');
     var GroupElementLinkAccExtRiderG = document.getElementById('accidental-extra-rider-gLink');
     var GroupElementLinkAccExtRiderGText = document.getElementById('accidental-extra-rider-gLink-text');
     if (DivisionIdAccExtRiderG =='0'){
         GroupElementAccExtRiderG.style.display = 'none'; 
          GroupElementLinkAccExtRiderG.style.display = 'none';
     }
     else
     {
         GroupElementLinkAccExtRiderGText.style.display = 'none';
     }
     var DivisionIdCancerInsuranceG = document.getElementById('MIR-ADD6-0-24-FLD-13').innerHTML;
     var GroupElementCancerInsuranceG = document.getElementById('cancer-insurance-g');
     var GroupElementLinkCancerInsuranceG = document.getElementById('cancer-insurance-gLink');
     var GroupElementLinkCancerInsuranceGText = document.getElementById('cancer-insurance-gLink-text');
     if (DivisionIdCancerInsuranceG =='0'){
         GroupElementCancerInsuranceG.style.display = 'none'; 
          GroupElementLinkCancerInsuranceG.style.display = 'none';
     }
     else
     {
         GroupElementLinkCancerInsuranceGText.style.display = 'none';
     }
     var DivisionIdBulkWireTransferG = document.getElementById('MIR-ADD6-0-24-FLD-14').innerHTML;
     var GroupElementBulkWireTransferG = document.getElementById('bulk-wire-transfer-g');
     var GroupElementLinkBulkWireTransferG = document.getElementById('bulk-wire-transfer-gLink');
     var GroupElementLinkBulkWireTransferGText = document.getElementById('bulk-wire-transfer-gLink-text');
     if (DivisionIdBulkWireTransferG =='0'){
         GroupElementBulkWireTransferG.style.display = 'none'; 
          GroupElementLinkBulkWireTransferG.style.display = 'none';
     }
     else
     {
         GroupElementLinkBulkWireTransferGText.style.display = 'none';
     }
     var DivisionIdDistributerAgentInfoG = document.getElementById('MIR-ADD6-0-24-FLD-15').innerHTML;
     var GroupElementDistributerAgentInfoG = document.getElementById('distributer-agent-information-g');
     var GroupElementLinkDistributerAgentInfoG = document.getElementById('distributer-agent-information-gLink');
     var GroupElementLinkDistributerAgentInfoGText = document.getElementById('distributer-agent-information-gLink-text');
     if (DivisionIdDistributerAgentInfoG =='0'){
         GroupElementDistributerAgentInfoG.style.display = 'none'; 
          GroupElementLinkDistributerAgentInfoG.style.display = 'none';
     }
     else
     {
         GroupElementLinkDistributerAgentInfoGText.style.display = 'none';
     }
     var DivisionIdExclCertDisG = document.getElementById('MIR-ADD6-0-24-FLD-16').innerHTML;
     var GroupElementExclCertDisG = document.getElementById('exclusion-for-certain-disability-g');
     var GroupElementLinkExclCertDisG = document.getElementById('exclusion-for-certain-disability-gLink');
     var GroupElementLinkExclCertDisGText = document.getElementById('exclusion-for-certain-disability-gLink-text');
     if (DivisionIdExclCertDisG =='0'){
         GroupElementExclCertDisG.style.display = 'none'; 
          GroupElementLinkExclCertDisG.style.display = 'none';
     }
     else
     {
         GroupElementLinkExclCertDisGText.style.display = 'none';
     }
     var DivisionIdProxBeneProG = document.getElementById('MIR-ADD6-0-24-FLD-17').innerHTML;
     var GroupElementProxBeneProG = document.getElementById('proxy-beneficiary-provision-g');
     var GroupElementLinkProxBeneProG = document.getElementById('proxy-beneficiary-provision-gLink');
     var GroupElementLinkProxBeneProGText = document.getElementById('proxy-beneficiary-provision-gLink-text');
     if (DivisionIdProxBeneProG =='0'){
         GroupElementProxBeneProG.style.display = 'none'; 
          GroupElementLinkProxBeneProG.style.display = 'none';
     }
     else
     {
         GroupElementLinkProxBeneProGText.style.display = 'none';
     }
     var DivisionIdFidBankAgtInfoG = document.getElementById('MIR-ADD6-0-24-FLD-18').innerHTML;
     var GroupElementFidBankAgtInfoG = document.getElementById('fid-bank-agent-information-g');
     var GroupElementLinkFidBankAgtInfoG = document.getElementById('fid-bank-agent-information-gLink');
     var GroupElementLinkFidBankAgtInfoGText = document.getElementById('fid-bank-agent-information-gLink-text');
     if (DivisionIdFidBankAgtInfoG =='0'){
         GroupElementFidBankAgtInfoG.style.display = 'none'; 
          GroupElementLinkFidBankAgtInfoG.style.display = 'none';
     }
     else
     {
         GroupElementLinkFidBankAgtInfoGText.style.display = 'none';
     }

     var DivisionIdInitPayDepoG = document.getElementById('MIR-ADD6-0-24-FLD-20').innerHTML;
     var GroupElementInitPayDepoG = document.getElementById('initial-payment-deposit-g');
     var GroupElementLinkInitPayDepoG = document.getElementById('initial-payment-deposit-gLink');
     var GroupElementLinkInitPayDepoGText = document.getElementById('initial-payment-deposit-gLink-text');
     if (DivisionIdInitPayDepoG =='0'){
         GroupElementInitPayDepoG.style.display = 'none'; 
          GroupElementLinkInitPayDepoG.style.display = 'none';
     }
     else
     {
         GroupElementLinkInitPayDepoGText.style.display = 'none';
     }
     var DivisionIdTaxCertChngPrem2G = document.getElementById('MIR-ADD6-0-24-FLD-22').innerHTML;
     var GroupElementTaxCertChngPrem2G = document.getElementById('tax-certificate-change-premium-2g');
     var GroupElementLinkTaxCertChngPrem2G = document.getElementById('tax-certificate-change-premium-2gLink');
     var GroupElementLinkTaxCertChngPrem2GText = document.getElementById('tax-certificate-change-premium-2gLink-text');
     if (DivisionIdTaxCertChngPrem2G =='0'){
         GroupElementTaxCertChngPrem2G.style.display = 'none'; 
          GroupElementLinkTaxCertChngPrem2G.style.display = 'none';
     }
     else
     {
         GroupElementLinkTaxCertChngPrem2GText.style.display = 'none';
     }
     var DivisionId3DDInsG = document.getElementById('MIR-INS-3DD-G').innerHTML;
     var GroupElement3DDInsG = document.getElementById('3dd-insurance-g');
     var GroupElementLink3DDInsG = document.getElementById('3dd-insurance-gLink');
     var GroupElementLink3DDInsGText = document.getElementById('3dd-insurance-gLink-text');
     if (DivisionId3DDInsG =='0'){
         GroupElement3DDInsG.style.display = 'none'; 
          GroupElementLink3DDInsG.style.display = 'none';
     }
     else
     {
         GroupElementLink3DDInsGText.style.display = 'none';
     }

     var DivisionIdAldRiderG = document.getElementById('MIR-ADD6-26-35-FLD-1').innerHTML;
     var GroupElementAldRiderG = document.getElementById('ald-rider-g');
     var GroupElementLinkAldRiderG = document.getElementById('ald-rider-gLink');
     var GroupElementLinkAldRiderGText = document.getElementById('ald-rider-gLink-text');
     if (DivisionIdAldRiderG =='0'){
         GroupElementAldRiderG.style.display = 'none'; 
          GroupElementLinkAldRiderG.style.display = 'none';
     }
     else
     {
         GroupElementLinkAldRiderGText.style.display = 'none';
     }

     var DivisionIdMovementInformation2G = document.getElementById('MIR-ADD6-26-35-FLD-2').innerHTML;
     var GroupElementMovementInformation2G = document.getElementById('movement-information-2g');
     var GroupElementLinkMovementInformation2G = document.getElementById('movement-information-2gLink');
     var GroupElementLinkMovementInformation2GText = document.getElementById('movement-information-2gLink-text');
     if (DivisionIdMovementInformation2G =='0'){
         GroupElementMovementInformation2G.style.display = 'none'; 
          GroupElementLinkMovementInformation2G.style.display = 'none';
     }
     else
     {
         GroupElementLinkMovementInformation2GText.style.display = 'none';
     }

     var DivisionIdDisasterResponseG = document.getElementById('MIR-ADD6-26-35-FLD-3').innerHTML;
     var GroupElementDisasterResponseG = document.getElementById('disaster-response-g');
     var GroupElementLinkDisasterResponseG = document.getElementById('disaster-response-gLink');
     var GroupElementLinkDisasterResponseGText = document.getElementById('disaster-response-gLink-text');
     if (DivisionIdDisasterResponseG =='0'){
         GroupElementDisasterResponseG.style.display = 'none'; 
          GroupElementLinkDisasterResponseG.style.display = 'none';
     }
     else
     {
         GroupElementLinkDisasterResponseGText.style.display = 'none';
     }

}

