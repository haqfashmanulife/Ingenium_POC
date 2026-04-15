// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   BF9F52Reins.js                                               *
//*  Description: NB UW Multiscreen Reinsurance section changes                *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Author  Description                                      *
//*                                                                            *
//*  MP310A  OCT 20   CTS     Add plan check and dropdown enabling             *
//*  MP310B  OCT 09   CTS     CHANGES FOR UW SCREEEN                           *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*  R16993  CTS      Fix done for Incident INC05571983 to fix the reinsurance *
//*                   indicator field in UW Multiscreen. Changes done to add   *
//*                   the functions from BF1252Reins js here                   *
//*  UYS015  JUN 21   CTS     REINSURANCE CHANGES                              *
//*  S21993  SEP 09   CTS     UDSD-1993 TO INCLUDE 3DD AND ALD RIDER           *
//*  S22548  DEC 09   CTD     UDSD-2548 TO INCLUDE NWL2 RIDER                  *
//*  NV3N01  CTS      ADDED SULV3 PLANS                                        *
//*  ON1738  CTS      REMOVED SULV3 PLANS AS IT IS NOT REQUIRED AS PER ONT SPEC*
//******************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom scripts for BF.htm   
//
//-----------------------------------------------------------------------------
//
//  Function:       ReinsuranceCheck1
//
//  Description:    Determine if Screen Line is Rider Renew (R) or a Total
//                  line (T) and blank or highlight certain fields. 
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//  Notes:          Existing ReinsuranceCheck function from BF1252Reins.js
//                  is used to check for MIR-CVG-REINS-IND validations.
//-----------------------------------------------------------------------------
 
function ReinsuranceCheck1()
{
	ReinsuranceCheck();
 	var source = window.event.target; 
	var index = source.getAttribute("Index"); 	

		if (document.getElementById("MIR-CVG-REINS-IND-T["+index+"]").checked)
		{
			document.getElementById("MIR-CVG-REINS-ME-FCT-T["+index+"]").disabled=false;
			document.getElementById("MIR-CVG-REINS-LIEN-T["+index+"]").disabled=false;
			document.getElementById("MIR-CVG-REINS-ME-FCT-T["+index+"]").value="1.00";
			document.getElementById("MIR-CVG-REINS-LIEN-T["+index+"]").value="0";
	        }
	        else
	        {
			document.getElementById("MIR-CVG-REINS-ME-FCT-T["+index+"]").disabled=true;
			document.getElementById("MIR-CVG-REINS-LIEN-T["+index+"]").disabled=true;
			document.getElementById("MIR-CVG-REINS-ME-FCT-T["+index+"]").value="1.00";
			document.getElementById("MIR-CVG-REINS-LIEN-T["+index+"]").value="0";	        
	        }

	return;
}
function ReinsuranceEligible1()
{
	numCvgs = document.getElementById("CvgInfo").rows.length - 2;
	for (i=1; i<=numCvgs; i++)
	{
		if ((document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="46400")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="46500")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="46600")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="46700")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="46800")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="46900")
//NWLREI CHANGES BEGIN
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50200")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50300")
//NWLREI CHANGES END
//NWLTRE CHANGES BEGIN
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="73000")
//MP241C CHANGES BEGIN                
//		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="73100"))
//NWLTRE CHANGES END
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="73100")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="51300")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="51301")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="51400")
// M252NB CHANGES START
//        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="51401"))
// M252NB CHANGES END
//MP241C CHANGES END
//M252NB CHANGES START
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="51401")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50601")
//MP266A CHANGES BEGIN
//              || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50701"))
//MP266A CHANGES END
//M252NB CHANEGS END
//MP266A CHANGES BEGIN
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50701")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="51100")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="51200")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="75600")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="75700")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="75800")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="75900")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="76000")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="76100")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="81600")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="81601")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="81700")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="81701")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="81800")
//M319R1 CHANGES BEGIN
//              || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="81801"))
//MP266A CHANGES END
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="81801")  
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="52100")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="52101")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="52200")
//TLB015 CHANGE BEGINS
//	        || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].getAttribute("value")=="52201"))
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="52201")
//UYS015 CHANGE BEGINS
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="31020")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="31000")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="32001")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="31060")
//S21993 CHANGE BEGINS
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="36008")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="36001")
//S21993 CHANGE BEGINS
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="31070")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="31040")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="31050")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50600")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50700")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50800")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50801")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="50000")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="31021")
//UYS015 CHANGE ENDS
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="32010")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="32020")
//S22548 CHANGE BEGINS
//	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="32030"))
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="32030")
//NV3N01 CHANGES BEGINS
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="76200"))
//S22548 CHANGE ENDS
//ON1738 CHANGES BEGINS
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="76200")
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="53800")
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="53801")
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="53802")
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="53803"))
            || (document.getElementById("MIR-PLAN-ID-T["+i+"]").getAttribute("value")=="76200"))
//ON1738 CHANGES ENDS
//NV3N01 CHANGES ENDS
//M319R1 CHANGES END
//TLB015 CHANGE ENDS
		{
			document.getElementById("MIR-CVG-REINS-IND-T["+i+"]").disabled=false;
		}
		else
		{
			document.getElementById("MIR-CVG-REINS-IND-T["+i+"]").disabled=true;
		}

		if (document.getElementById("MIR-CVG-REINS-IND-T["+i+"]").checked)
		{
			document.getElementById("MIR-CVG-REINS-CO-ID-T["+i+"]").disabled=false;
			document.getElementById("MIR-CVG-REINS-TRTY-NUM-T["+i+"]").disabled=false;
			document.getElementById("MIR-CVG-REINS-CED-PCT-T["+i+"]").disabled=false;
			document.getElementById("MIR-CVG-REINS-CED-AMT-T["+i+"]").disabled=true;
		}
		else
		{
			document.getElementById("MIR-CVG-REINS-CO-ID-T["+i+"]").disabled=true;
			document.getElementById("MIR-CVG-REINS-TRTY-NUM-T["+i+"]").disabled=true;
			document.getElementById("MIR-CVG-REINS-CED-PCT-T["+i+"]").disabled=true;
			document.getElementById("MIR-CVG-REINS-CED-AMT-T["+i+"]").disabled=true;
		}
	}

	numCvgs = document.getElementById("CvgInfo").rows.length - 2;
	for (i=1; i<=numCvgs; i++)
	{
		if (document.getElementById("MIR-CVG-REINS-IND-T["+i+"]").checked)
		{
			document.getElementById("MIR-CVG-REINS-ME-FCT-T["+i+"]").disabled=false;
			document.getElementById("MIR-CVG-REINS-LIEN-T["+i+"]").disabled=false;
		}
		else
		{
			document.getElementById("MIR-CVG-REINS-ME-FCT-T["+i+"]").disabled=true;
			document.getElementById("MIR-CVG-REINS-LIEN-T["+i+"]").disabled=true;
		}
	}
	if (document.getElementById("MIR-NEW-UW-REQIR-CAT-CD-T[1]").value != '')
          {
          document.getElementById("MIR-NEW-UW-REQIR-CAT-CD-T[1]").focus();
           }	
	if (document.getElementById("MIR-NEW-ISS-REQIR-CAT-CD-T[1]").value != '')
          {
          document.getElementById("MIR-NEW-ISS-REQIR-CAT-CD-T[1]").focus();
           }	
	return;
}
