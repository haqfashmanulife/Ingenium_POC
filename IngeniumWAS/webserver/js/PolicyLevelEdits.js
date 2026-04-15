// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   PolicyLevelEdits.js                                          *
//*  Description: Javascript for Manulife specific changes                     *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*  SCP02   phase1   Disable agent information edit if policy status is       *
//*                   "inforce"                                                *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
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
//+----------------------------------------------------------------------------
//
//  Function:       checkagtedit
//
//  Description:    disable agent information based on status of policy
//
//  Arguments:      None.
//
//  Returns:        None.
//
//-----------------------------------------------------------------------------
function checkagtedit()
{
    if (document.getElementById("MIR-POL-CSTAT-CD").innerText == "PREMIUM PAYING"
    ||  document.getElementById("MIR-POL-CSTAT-CD").innerText == "WAIVER"
    ||  document.getElementById("MIR-POL-CSTAT-CD").innerText == "PAID-UP LIFE"
    ||  document.getElementById("MIR-POL-CSTAT-CD").innerText == "PAID-UP ANNUITY/EXTENDED TERM")
    {
      DisableAgtInfo();
    }
}
//+----------------------------------------------------------------------------
//
//  Function:       DisableAgtInfo
//
//  Description:    Disable the agent information fields
//
//  Arguments:      None.
//
//  Returns:        None.
//
//-----------------------------------------------------------------------------
function DisableAgtInfo()
{
  var nRows = 2;
  for (var i = 1; i <= nRows; i++)
  {
   document.getElementById("MIR-AGT-ID-T[" + i + "]").disabled = true;
   document.getElementById("MIR-DV-AGT-CLI-NM-T[" + i + "]").disabled = true;
   document.getElementById("MIR-POL-AGT-SHR-PCT-T[" + i + "]").disabled = true;
   document.getElementById("MIR-POL-AGT-TYP-CD-T[" + i + "]").disabled = true;
  }
}
