//******************************************************************************
//*  Component:   BF9960.js                                                    *
//*  Description: Cloned from AppCwaFTJUL.js                                   *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  602J     New for release 602J                                     *
//*  P02945  H.L      Change MIR-POL-ID TO MIR-POL-ID-BASE                     *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
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
//  Functions for the BF9960.htm  pages
//
//  Uses:  getCheckedRadioValue() from ClientLevelEdits.js
//
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//  Function:       onLoadCustom()
//
//  Description:  Custom onload handler. 
//          Shows or hides the PA Policy Inquiry fields.
//
//  Arguments:    None
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
  var ctl = document.getElementById("MIR-SEL-TYP-CD").value;
  if (ctl == "1")
  {
    policyFields.style.display               = "";
    document.getElementById("MIR-POL-ID-BASE").setAttribute("mandatory", "yes");
    nameFields.style.display               = "none";
    document.getElementById("MIR-CLI-INDV-SUR-NM").setAttribute("mandatory", "no");
    document.getElementById("MIR-CLI-INDV-SUR-NM").value   = "";
    document.getElementById("MIR-CLI-INDV-GIV-NM").value   = "";
  }
  if (ctl == "2")
  {
    policyFields.style.display               = "none";
    document.getElementById("MIR-POL-ID-BASE").setAttribute("mandatory", "no");
    document.getElementById("MIR-POL-ID-BASE").value   = "";
    nameFields.style.display               = "";
    document.getElementById("MIR-CLI-INDV-SUR-NM").setAttribute("mandatory", "yes");
  }
  if (ctl == "3")
  {
    policyFields.style.display               = "none";
    document.getElementById("MIR-POL-ID-BASE").setAttribute("mandatory", "no");
    document.getElementById("MIR-CLI-INDV-SUR-NM").setAttribute("mandatory", "no");
    nameFields.style.display               = "none";
  }
}

//-----------------------------------------------------------------------------
//
//  Function:   onClickPAInquiry([ctl])
//
//  Description:  Show or hide the Cash With App Fields.
//
//  Arguments:    none required
//
//  OPTIONAL:   ctl - Cash With App radio control
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function onClickPAInquiry(ctl)
{
  showPAInquiryFields(ctl);
}


//-----------------------------------------------------------------------------
//
//  Function:       showPAInquiryFields(show)
//
//  Description:  Determine which sections of the screen to display, based on
//          the Cash With App choice.
//
//  Arguments:    none required
//
//  OPTIONAL:   ctl - Cash With App radio control
//            - if not passed, the function will find the control itself
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function showPAInquiryFields(ctl)
{
  ctlValue = ctl.value;     // ...whereas this is a single radio button.

  if ("1" == ctlValue)
  {
    policyFields.style.display               = "";
    document.getElementById("MIR-POL-ID-BASE").setAttribute("mandatory", "yes");
    nameFields.style.display               = "none";
    document.getElementById("MIR-CLI-INDV-SUR-NM").setAttribute("mandatory", "no");
    document.getElementById("MIR-CLI-INDV-SUR-NM").value   = "";
    document.getElementById("MIR-CLI-INDV-GIV-NM").value   = "";
  }
  if ("2" == ctlValue)
  {
    policyFields.style.display               = "none";
    document.getElementById("MIR-POL-ID-BASE").setAttribute("mandatory", "no");
    document.getElementById("MIR-POL-ID-BASE").value   = "";
    nameFields.style.display               = "";
    document.getElementById("MIR-CLI-INDV-SUR-NM").setAttribute("mandatory", "yes");
  }
  if ("3" == ctlValue)
  {
    policyFields.style.display               = "none";
    document.getElementById("MIR-POL-ID-BASE").setAttribute("mandatory", "no");
    document.getElementById("MIR-CLI-INDV-SUR-NM").setAttribute("mandatory", "no");
    nameFields.style.display               = "none";
  }
}


