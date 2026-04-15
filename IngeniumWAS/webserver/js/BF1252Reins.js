// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   BF1252Reins.js                                               *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Author  Description                                      *
//*                                                                            *
//*  MP29NB  DEC 20   CTS     Add plan check and dropdown enabling             *
//*  NWLREI  DEC 09   CTS     Add NWL base plans 50200 & 50300 in plan check   *
//*  NWLTRE  MAR 10   CTS     Add TERM RIDER plans 73000 & 73100 in plan check *
//*  MP241C  NOV 20   CTS     ADD NWL II base plans                            *
//*  M252NB  SEP 12   CTS     ADDED NEW NIP PLANS                              *
//*  MP266A  DEC 14   CTS     ADDED ARMII PLANS                                *
//*  M319R1  AUG 17   CTS     ADDED FXWL PLANS                                 *
//*  23774A  10APR22  CTS     Changes done for ie retirement project to make it        *
//*                           compatible for microsoft edge. Changes in html include   *
//*                           adding "id" attribute for all input fields and changes in*
//*                           java scripts to modify certain functions/commands which  *
//*                           are no longer compatilble with edge.                     *
//*  TLB015  APR 21   CTS     REINSURANCE CHANGES                              *
//*  TL1038  21JUN22  CTS     ADDED UL PLAN                                    *
//*  S21993  SEP 09   CTS     UDSD-1993 TO INCLUDE 3DD AND ALD RIDER           *
//*  S22548  DEC 09   CTD     UDSD-2548 TO INCLUDE NWL2 RIDER                  *
//*  S22674  JAN 12   CTS     UDSD-2674 TO CORRECT THE BRACKETS                *
//*  NV3N01  23SEP22  CTS     ADDED SULV3 PLANS                                        *
//*  ON1738  07OCT25 CTS     REMOVED SULV3 PLANS AS IT IS NOT REQUIRED         *
//*  ON1738                  AS PER ONT SPEC                                   *
//**************************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom scripts for BF.htm   
//
//-----------------------------------------------------------------------------
//
//  Function:       ReinsuranceCheck
//
//  Description:    Determine if Screen Line is Rider Renew (R) or a Total
//                  line (T) and blank or highlight certain fields. 
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function ReinsuranceCheck()
{
	numCvgs = document.getElementById("CvgInfo").rows.length - 2;
	for (i=1; i<=numCvgs; i++)
	{
		if (document.getElementById("MIR-CVG-REINS-IND-T["+i+"]").checked)
		{
			document.getElementById("MIR-CVG-REINS-CO-ID-T["+i+"]").disabled=false;
			document.getElementById("MIR-CVG-REINS-TRTY-NUM-T["+i+"]").disabled=false;
			document.getElementById("MIR-CVG-REINS-CED-PCT-T["+i+"]").disabled=false;
			document.getElementById("MIR-CVG-REINS-CED-AMT-T["+i+"]").disabled=true;
		}
		else
		{
			document.getElementById("MIR-CVG-REINS-CO-ID-T["+i+"]").value="  ";
			document.getElementById("MIR-CVG-REINS-TRTY-NUM-T["+i+"]").value="   ";
			document.getElementById("MIR-CVG-REINS-CED-PCT-T["+i+"]").value="   ";
			document.getElementById("MIR-CVG-REINS-CED-AMT-T["+i+"]").value="0";
			document.getElementById("MIR-CVG-REINS-CO-ID-T["+i+"]").disabled=true;
			document.getElementById("MIR-CVG-REINS-TRTY-NUM-T["+i+"]").disabled=true;
			document.getElementById("MIR-CVG-REINS-CED-PCT-T["+i+"]").disabled=true;
			document.getElementById("MIR-CVG-REINS-CED-AMT-T["+i+"]").disabled=true;
		}
	}

	return;
}

function ReinsuranceEligible()
{
	numCvgs = document.getElementById("CvgInfo").rows.length - 2;
	for (i=1; i<=numCvgs; i++)
	{
		if ((document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="46400")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="46500")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="46600")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="46700")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="46800")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="46900")
//NWLREI CHANGES BEGIN
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50200")
		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50300")
//NWLREI CHANGES END
//NWLTRE CHANGES BEGIN
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="73000")
//MP241C CHANGES BEGIN                
//		|| (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="73100"))
//NWLTRE CHANGES END
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="73100")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="51300")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="51301")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="51400")
// M252NB CHANGES START
//        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="51401"))
// M252NB CHANGES END
//MP241C CHANGES END
//M252NB CHANGES START
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="51401")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50601")
//MP266A CHANGES BEGIN
//              || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50701"))
//MP266A CHANGES END
//M252NB CHANEGS END
//MP266A CHANGES BEGIN
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50701")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="51100")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="51200")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="75600")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="75700")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="75800")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="75900")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="76000")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="76100")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="81600")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="81601")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="81700")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="81701")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="81800")
//M319R1 CHANGES BEGIN
//              || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="81801"))
//MP266A CHANGES END
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="81801")  
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="52100")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="52101")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="52200")
//TLB015 CHANGE BEGINS
//	        || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="52201"))
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="52201")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="32010")
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="32020")
//TL1038 CHANGES BEGINS
//	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="32030"))
	        || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="32030")
//TLB015 CHANGE ENDS
//S22674 CHANGES BEGIN
//UYS015 CHANGE BEGINS                              
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="31020")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="31000")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="32001")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="31060")
//S21993 CHANGE BEGINS
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="36008")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="36001")
//S21993 CHANGE ENDS
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="31070")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="31040")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="31050")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="50600")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="50700")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="50800")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="50801")
//S20285 CHANGES START				
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="50000"))
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="50000")
//S22548 CHANGES START	
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="31021"))
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="31021")
//                || (document.getElementById["MIR-PLAN-ID-T["+i+"]"].value=="76200"))
//S22548 CHANGES END
//TL1038 CHANGES ENDS
//M319R1 CHANGES END
//UYS015 CHANGE ENDS
//S20285 CHANGES END
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="31020")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="31000")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="32001")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="31060")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="36008")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="36001")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="31070")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="31040")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="31050")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50600")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50700")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50800")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50801")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="50000")
                || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="31021")
//NV3N01 CHANGES BEGINS
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="76200"))
//S22674 CHANGES END    
//ON1738 CHANGES BEGINS            
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="76200")
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="53800")
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="53801")
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="53802")
//          || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="53803"))
            || (document.getElementById("MIR-PLAN-ID-T["+i+"]").value=="76200"))
//ON1738 CHANGES ENDS
//NV3N01 CHANGES ENDS
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
	return;
}