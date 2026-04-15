// Converted from PathFinder 2.2 to 3.0 on Jun 19, 2018 3:26:17 PM EDT
//******************************************************************************
//*  Component:   BF9272.js                                                    *
//*  Description: DISABLING THE SURGERY NAME(REPORT) FIELD FOR NON PAYMENT     *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Author  Description                                      *
//*                                                                            *
//*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                   *
//*  S20982  CTS      CHANGES FOR BUG ID 982 - MEDICAL CLAIM                   *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*  R16993  CTS      fix done for Incident INC05572197 to fix the Surgery name*
//*                   field disapperance issue. The fix was done to change the *
//*                   code from .value to .getAttribute as MIR-BNFT-NM-ID is a *
//*                   Span variable                                            *
//******************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom scripts for BF.htm
//
//-----------------------------------------------------------------------------
//
//  Function:       BF9272.js - NonpaymentreasnEligible
//
//  Description:    Determine if Screen Line of Non-payment reason code is not
//                  blank, enable the surgery name field for user edit. 
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function NonpaymentreasnEligible()
{
    var myTable = "Claiminfo";
        var table =  document.getElementById(myTable);
        var num =  (table.rows.length) - 1;
        for (var i=1; i<=num; i++)
        
        {
                if ((document.getElementById("MIR-BNFT-NM-ID").getAttribute("value") =="SURG ")
                || (document.getElementById("MIR-BNFT-NM-ID").getAttribute("value") =="SURG")
                || (document.getElementById("MIR-BNFT-NM-ID").getAttribute("value") =="SURGA")
                || (document.getElementById("MIR-BNFT-NM-ID").getAttribute("value") =="SURGB")
                || (document.getElementById("MIR-BNFT-NM-ID").getAttribute("value") =="CASUR")
                || (document.getElementById("MIR-BNFT-NM-ID").getAttribute("value") =="RADIO")
                //S20982 Changes Starts
                || (document.getElementById("MIR-BNFT-NM-ID").getAttribute=="CATRT")
                //S20982 Changes Ends
                || (document.getElementById("MIR-BNFT-NM-ID").getAttribute("value") =="CASRD"))
                {
                    document.getElementById("MIR-NON-PMT-SURGY-NM-T["+i+"]").disabled=false;
                }
                else
                {
                    document.getElementById("MIR-NON-PMT-SURGY-NM-T["+i+"]").disabled=true;
                }
        }
        return;
}