// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   BF8022Reins.js                                               *
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
//*  23774A  10APR22  CTS     Changes done for ie retirement project to make it         *
//*                           compatible for microsoft edge. Changes in html include    *
//*                           adding "id" attribute for all input fields and changes in *
//*                           java scripts to modify certain functions/commands which   *
//*                           are no longer compatilble with edge.                      *
//*  TLB015  JUN 21   CTS     REINSURANCE CHANGES                              *
//*  R16993  JUN 22   CTS     Fix for Prod log RITM05156822. The ReinsuranceEligibleAD  *
//*                           function is added as MIR-PLAN-ID is SPAN in this html     *
//*  TL1038  21JUN22  CTS     ADDED UL PLAN                                             *
//*  UYS015  JUN 21   CTS     REINSURANCE CHANGES                              *
//*  S20285  JUL 27   CTS     CHANGES DONE FOR UDSD-285                        *
//*  S21925  SEP 01   CTS     RETROFIT ISSUE                                   *
//*  S21993  SEP 09   CTS     UDSD-1993 TO INCLUDE 3DD AND ALD RIDER           *
//*  S22548  DEC 09   CTD     UDSD-2548 TO INCLUDE NWL2 RIDER                  *
//*  S22674  JAN 06   CTD     UDSD-2674 FIX FOR FOREIGN CURRENCY PRODUCTS      *
//*  NV3N01  23SEP22  CTS     ADDED SULV3 PLANS                                         *
//*  ON1747  08OCT25  CTS     REMOVING SULV3 PLANS SINCE IT IS NOT REQUIRED AS *
//*  ON1747                   ONTARIO SPEC                                     *
//******************************************************************************
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
	if (document.getElementById("MIR-CVG-REINS-IND").checked)
	{
		document.getElementById("MIR-CVG-REINS-CO-ID").disabled=false;
		document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=false;
		document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=false;
		document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
	}
	else
	{
		document.getElementById("MIR-CVG-REINS-CO-ID").value="  ";
		document.getElementById("MIR-CVG-REINS-TRTY-NUM").value="   ";
		document.getElementById("MIR-CVG-REINS-CED-PCT").value="   ";
		document.getElementById("MIR-CVG-REINS-CED-AMT").value="0";
		document.getElementById("MIR-CVG-REINS-CO-ID").disabled=true;
		document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=true;
		document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=true;
		document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
	}

	return;
}

function ReinsuranceEligible()
{
	if ((document.getElementById("MIR-PLAN-ID").value=="46400")
	|| (document.getElementById("MIR-PLAN-ID").value=="46500")
	|| (document.getElementById("MIR-PLAN-ID").value=="46600")
	|| (document.getElementById("MIR-PLAN-ID").value=="46700")
	|| (document.getElementById("MIR-PLAN-ID").value=="46800")
	|| (document.getElementById("MIR-PLAN-ID").value=="46900")
//NWLREI CHANGES BEGIN
	|| (document.getElementById("MIR-PLAN-ID").value=="50200")
	|| (document.getElementById("MIR-PLAN-ID").value=="50300")
//NWLREI CHANGES END
//NWLTRE CHANGES BEGIN
	|| (document.getElementById("MIR-PLAN-ID").value=="73000")
//MP241C CHANGES BEGIN	
//	|| (document.getElementById("MIR-PLAN-ID").value=="73100"))
//NWLTRE CHANGES END
	|| (document.getElementById("MIR-PLAN-ID").value=="73100")
	|| (document.getElementById("MIR-PLAN-ID").value=="51300")
	|| (document.getElementById("MIR-PLAN-ID").value=="51301")
	|| (document.getElementById("MIR-PLAN-ID").value=="51400")
// M252NB CHANGES START	
//	|| (document.getElementById("MIR-PLAN-ID").value=="51401"))
// M252NB CHANGES ENDS
//MP241C CHANGES ENDS	
//M252NB CHANGES START
        || (document.getElementById("MIR-PLAN-ID").value=="51401")
        || (document.getElementById("MIR-PLAN-ID").value=="50601")
//MP266A CHANGES BEGIN
//      || (document.getElementById("MIR-PLAN-ID").value=="50701"))
//MP266A CHANGES END
//M252NB CHANEGS END
//MP266A CHANGES BEGIN
	|| (document.getElementById("MIR-PLAN-ID").value=="50701")
	|| (document.getElementById("MIR-PLAN-ID").value=="51100")
	|| (document.getElementById("MIR-PLAN-ID").value=="51200")
	|| (document.getElementById("MIR-PLAN-ID").value=="75600")
	|| (document.getElementById("MIR-PLAN-ID").value=="75700")
	|| (document.getElementById("MIR-PLAN-ID").value=="75800")
	|| (document.getElementById("MIR-PLAN-ID").value=="75900")
	|| (document.getElementById("MIR-PLAN-ID").value=="76000")
	|| (document.getElementById("MIR-PLAN-ID").value=="76100")
	|| (document.getElementById("MIR-PLAN-ID").value=="81600")
	|| (document.getElementById("MIR-PLAN-ID").value=="81601")
	|| (document.getElementById("MIR-PLAN-ID").value=="81700")
	|| (document.getElementById("MIR-PLAN-ID").value=="81701")
	|| (document.getElementById("MIR-PLAN-ID").value=="81800")
//M319R1 CHANGES BEGIN
//      || (document.getElementById("MIR-PLAN-ID").value=="81801"))
//MP266A CHANGES END
        || (document.getElementById("MIR-PLAN-ID").value=="81801")
	|| (document.getElementById("MIR-PLAN-ID").value=="52100")
	|| (document.getElementById("MIR-PLAN-ID").value=="52101")
	|| (document.getElementById("MIR-PLAN-ID").value=="52200")
//TLB015 CHANGE BEGINS
//      || (document.all["MIR-PLAN-ID"].value=="52201"))
        || (document.getElementById("MIR-PLAN-ID").value=="52201")
        || (document.getElementById("MIR-PLAN-ID").value=="31020")
        || (document.getElementById("MIR-PLAN-ID").value=="31000")
        || (document.getElementById("MIR-PLAN-ID").value=="32001")
        || (document.getElementById("MIR-PLAN-ID").value=="31060")
//S21993 CHANGE BEGINS
        || (document.getElementById("MIR-PLAN-ID").value=="36008")
        || (document.getElementById("MIR-PLAN-ID").value=="36001")
//S21993 CHANGE ENDS
        || (document.getElementById("MIR-PLAN-ID").value=="31070")
        || (document.getElementById("MIR-PLAN-ID").value=="31040")
        || (document.getElementById("MIR-PLAN-ID").value=="31050")
        || (document.getElementById("MIR-PLAN-ID").value=="50600")
        || (document.getElementById("MIR-PLAN-ID").value=="50700")
        || (document.getElementById("MIR-PLAN-ID").value=="50800")
        || (document.getElementById("MIR-PLAN-ID").value=="50801")
        || (document.getElementById("MIR-PLAN-ID").value=="50000")
        || (document.getElementById("MIR-PLAN-ID").value=="31021")
        || (document.getElementById("MIR-PLAN-ID").value=="32010")
        || (document.getElementById("MIR-PLAN-ID").value=="32020")
//S22548 CHANGE BEGINS
//TL1038 CHANGES BEGINS
//      || (document.getElementById("MIR-PLAN-ID").value=="32030"))
        || (document.getElementById("MIR-PLAN-ID").value=="32030")
//NV3N01 CHANGES BEGINS
//	|| (document.getElementById("MIR-PLAN-ID").value=="76200"))
//ON1747 CHANGES BEGINS
//      || (document.getElementById("MIR-PLAN-ID").value=="76200")
//      || (document.getElementById("MIR-PLAN-ID").value=="53800")
//      || (document.getElementById("MIR-PLAN-ID").value=="53801")
//      || (document.getElementById("MIR-PLAN-ID").value=="53802")
//      || (document.getElementById("MIR-PLAN-ID").value=="53803"))
        || (document.getElementById("MIR-PLAN-ID").value=="76200"))
//ON1747 CHANGES ENDS
//NV3N01 CHANGES ENDS
//TL1038 CHANGES ENDS
//M319R1 CHANGES END
//UYS015 CHANGE ENDS
//S20285 CHANGES END
//S22548 CHANGE ENDS

	{
		document.getElementById("MIR-CVG-REINS-IND").disabled=false;
	}
	else
	{
		document.getElementById("MIR-CVG-REINS-IND").disabled=true;
	}

	if (document.getElementById("MIR-CVG-REINS-IND").checked)
	{
//ON1747 CHANGE BEGINS            
//      document.getElementById("MIR-CVG-REINS-CO-ID").disabled=false;
//      document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=false;
//      document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=false;
//      document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
       if ((document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="53800")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="53801")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="53802")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="53803")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="54000")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="54001")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="54002")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="54003"))
       {
          document.getElementById("MIR-CVG-REINS-CO-ID").disabled=false;
          document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=false;
          document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=false;
          document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
       }
       else
       {
          document.getElementById("MIR-CVG-REINS-CO-ID").disabled=true;
          document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=true;
          document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=true;
          document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
       }
//ON1747 CHANGE ENDS
	}
	else
	{
		document.getElementById("MIR-CVG-REINS-CO-ID").disabled=true;
		document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=true;
		document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=true;
		document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
	}
	return;
}

function ReinsuranceEligibleAD()
{
	if ((document.getElementById("MIR-PLAN-ID").getAttribute("value")=="46400")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="46500")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="46600")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="46700")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="46800")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="46900")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50200")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50300")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="73000")
//MP241C CHANGES BEGIN	
//	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="73100"))
//NWLTRE CHANGES END
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="73100")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="51300")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="51301")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="51400")
// M252NB CHANGES START	
//	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="51401"))
// M252NB CHANGES ENDS
//MP241C CHANGES ENDS	
//M252NB CHANGES START
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="51401")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50601")
//MP266A CHANGES BEGIN
//      || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50701"))
//MP266A CHANGES END
//M252NB CHANEGS END
//MP266A CHANGES BEGIN
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50701")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="51100")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="51200")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="75600")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="75700")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="75800")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="75900")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="76000")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="76100")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="81600")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="81601")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="81700")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="81701")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="81800")
//M319R1 CHANGES BEGIN
//      || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="81801"))
//MP266A CHANGES END
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="81801")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="52100")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="52101")
	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="52200")
//TLB015 CHANGE BEGINS
//      || (document.all["MIR-PLAN-ID"].value=="52201"))
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="52201")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="32010")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="32020")
//S22674 CHANGE BEGINS
//    || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="32030"))
//    || (document.getElementById("MIR-PLAN-ID").value=="31020")
//    || (document.getElementById("MIR-PLAN-ID").value=="31000")
//   || (document.getElementById("MIR-PLAN-ID").value=="32001")
//    || (document.getElementById("MIR-PLAN-ID").value=="31060")
//S21993 CHANGE BEGINS
//    || (document.getElementById("MIR-PLAN-ID").value=="36008")
//    || (document.getElementById("MIR-PLAN-ID").value=="36001")
//S21993 CHANGE ENDS
//    || (document.getElementById("MIR-PLAN-ID").value=="31070")
//    || (document.getElementById("MIR-PLAN-ID").value=="31040")
//    || (document.getElementById("MIR-PLAN-ID").value=="31050")
//    || (document.getElementById("MIR-PLAN-ID").value=="50600")
//    || (document.getElementById("MIR-PLAN-ID").value=="50700")
//    || (document.getElementById("MIR-PLAN-ID").value=="50800")
//    || (document.getElementById("MIR-PLAN-ID").value=="50801")
//    || (document.getElementById("MIR-PLAN-ID").value=="50000")
//    || (document.getElementById("MIR-PLAN-ID").value=="31021")
//M319R1 CHANGES END
//S22548 CHANGE BEGINS
//    || (document.getElementById("MIR-PLAN-ID").value=="76200")
//S22548 CHANGE ENDS
//TLB015 CHANGE ENDS
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="32030")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="31020")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="31000")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="32001")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="31060")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="36008")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="36001")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="31070")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="31040")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="31050")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50600")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50700")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50800")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50801")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="50000")
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="31021")
//NV3N01 CHANGE BEGINS
//	|| (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="76200"))
//S22674 CHANGE ENDS
//ON1747 CHANGE BEGINS
//      || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="76200")
//      || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="53800")
//      || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="53801")
//      || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="53802")
//      || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="53803"))
        || (document.getElementById("MIR-PLAN-ID").getAttribute("value")=="76200"))
//ON1747 CHANGE ENDS
//NV3N01 CHANGE ENDS
	{
		document.getElementById("MIR-CVG-REINS-IND").disabled=false;
	}
	else
	{
		document.getElementById("MIR-CVG-REINS-IND").disabled=true;
	}

	if (document.getElementById("MIR-CVG-REINS-IND").checked)
	{
//ON1747 CHANGE BEGINS
//     document.getElementById("MIR-CVG-REINS-CO-ID").disabled=false;
//     document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=false;
//     document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=false;
//     document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
       if ((document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="53800")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="53801")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="53802")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="53803")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="54000")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="54001")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="54002")
       && (document.getElementById("MIR-PLAN-ID").getAttribute("value")!=="54003"))
       {
          document.getElementById("MIR-CVG-REINS-CO-ID").disabled=false;
          document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=false;
          document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=false;
          document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
       }
       else
       {
          document.getElementById("MIR-CVG-REINS-CO-ID").disabled=true;
          document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=true;
          document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=true;
          document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
       }
//ON1747 CHANGE ENDS
  }
  else
  {
         document.getElementById("MIR-CVG-REINS-CO-ID").disabled=true;
         document.getElementById("MIR-CVG-REINS-TRTY-NUM").disabled=true;
         document.getElementById("MIR-CVG-REINS-CED-PCT").disabled=true;
         document.getElementById("MIR-CVG-REINS-CED-AMT").disabled=true;
  }
	return;
}

