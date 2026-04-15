// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   AppSignaturesFTJ.js                                             *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  602J     New for release 602J                                     *
//*  23774A   CTS     Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
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
//  Functions for the AppApplicationFTJUL.htm page
//
//-----------------------------------------------------------------------------
//
//  Uses:  getCheckedRadioValue(radioGrp)       from ClientLevelEdits.js
//       setCheckedRadioValue(radioGrp, choice) from ClientLevelEdits.js
//

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//  Function:   onLoadCustom()
//
//  Description:  Custom function executed when the page loads
//
//  Arguments:    None
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
  showHideSigsReceivedInfo();
}

//-----------------------------------------------------------------------------
//
//  Function:   onClickSigsReceived([ctl])
//
//  Description:  Show or hide the Application Signed fields.
//
//  Arguments:    none required
//
//  OPTIONAL:   ctl - Signatures Received radio control
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------
function onClickSigsReceived(ctl)
{
  showHideSigsReceivedInfo(ctl);
}

//-----------------------------------------------------------------------------
//
//  Function:   showHideSigsReceivedInfo([ctl])
//
//  Description:  Shows or hides the Application Signed Date and the Signed
//          At information.
//
//  Arguments:    None required
//
//  OPTIONAL:     ctl - Have All Other Signatures Been Received radio control
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function showHideSigsReceivedInfo(ctl)
{
  if ((arguments.length < 1) ||
    (null == ctl))
  {
    ctl = document.getElementById("signaturesReceived"); // This represents the entire radio group...
  
    if (null == ctl)
    {
      document.getElementById("dateSignedSection").style.display     = "none"
      return;
    }
  
    ctlValue = getCheckedRadioValue(ctl);
  }
  else
  {
    ctlValue = ctl.value;           // ...whereas this is a single radio button.
  }
  
  //
  // If answer to "Have all other signatures been received?" is "Yes"
  // show the Date Signed At and Location Signed At sections.
  //
  if ("Y" == ctlValue)
  {
    document.getElementById("dateSignedSection").style.display     = "";
  }
  //
  // Otherwise reset data, and hide section.
  //
  else
  {
    document.getElementById("dateSignedSection").style.display     = "none"
    document.getElementById("MIR-POL-APP-SIGN-DT").value           = ""
  }
}

