// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   bf0944-o.js                                                  *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*          602J     New for release 6.0.2J                                   *
//*  016424  602J     Updates for Pathfinder 1.1                               *
//*  017150  612J     Removal of Currency Scaling                              *
//*  019830  PF3.0    ReFactor ClientlevelEdits.js                             *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
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
//  Functions for the BF0944-O (PAYO-LIST) page
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//  Constants
//
//-----------------------------------------------------------------------------

var maxDests = 12;


//-----------------------------------------------------------------------------
//
//  Function:       onLoadCustom()
//
//  Description:  Custom onLoad functionality required for PAYO-LIST
//
//  Arguments:  none
//
//  Returns:  Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
  // check for conditional currency amount scaling
//017150 Remove the followings
//017150 onLoadCustomScaling();
    onLoadCustomFormat();

//017150 Add the followings
        return;
}

//-----------------------------------------------------------------------------
//
//  Function:       onLoadCustomFormat()
//
//  Description:  Checks if currency fields need conditional formatting. On
//                  this page, we look at the amount field itself to see if
//                  it should be scaled.
//
//  Arguments:  None
//
//  Returns:  Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustomFormat()
{
  for (var i = 1; i <= maxDests; i++)
  {
    var ctlAmt = document.getElementById("MIR-POL-PAYO-UNIT-QTY-T[" + i + "]");

    // we've hit the end of the generated rows - we're done.
    if (ctlAmt == null)
    {
      return;
    }

    processAmtFld(ctlAmt);
  }
}

//-----------------------------------------------------------------------------
//
//  Function:       processAmtFld(ctlAmt)
//
//  Description:  Check if an amount needs to be scaled. Scale the amount
//                  if necessary. Reformat field as a number if scaled.
//
//  Arguments:  ctlAmt - control with amount that needs to be checked.
//
//  Returns:  Nothing
//
//-----------------------------------------------------------------------------

function processAmtFld(ctlAmt)
{
  // scale number based on number of decimals that came down from
  // server - if 2 we should scale, otherwise we shouldn't
  var originalFldAmt = new Field(ctlAmt);
  var txtValue = originalFldAmt.getValue();
//19830 remove the reference "currentLocale" that is eliminated in ClientlevelEdits.js
//      var decPos = txtValue.indexOf(currentLocale.currencyDecSeparator);
        var decPos = txtValue.indexOf(m_currencyDecSeparator);
  if ((txtValue.length - decPos) == 3)
  {
    // field comes down as text - change format to number before
    // scaling
    ctlAmt.setAttribute("stype", "Number", 0);
//19830 remove the reference "currentLocale" that is eliminated in ClientlevelEdits.js
//              ctlAmt.setAttribute("decimals", currentLocale.currencyScale, 0);
                ctlAmt.setAttribute("decimals", m_currencyScale, 0);
    ctlAmt.setAttribute("elength", 16, 0);

      var fldAmt = new Field(ctlAmt);
      txtValue = NumberFormat(fldAmt);
      fldAmt.setValue(txtValue);
  }
}
