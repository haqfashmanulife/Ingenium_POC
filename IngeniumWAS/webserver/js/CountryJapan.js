// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:16 PM EDT
//******************************************************************************
//*  Component:   CountryJapan.js                                              *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//* 01AD05   BMB      New for Aug 1st release                                  *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
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
// Global variables
//-----------------------------------------------------------------------------
var previousCountryCodeIndex;
 
//----------------------------------------------------------------------------
//
//  Function: CountryJapan
//
//  Description:  The Country Select box must always be Japan
//
//  Arguments:  passed in object (select box)
//
//  Returns:  Nothing
//
//----------------------------------------------------------------------------

function CountryJapan(ctl)
{
  if (ctl.selectedIndex != previousCountryCodeIndex)
      {
        ctl.selectedIndex = previousCountryCodeIndex;
        window.event.preventDefault();
        alert(getUserMessage(msgCountryCodeJapan));
      }
  return;
}

//-----------------------------------------------------------------------------
//
//  Function: saveCountryCodeDeflt()
//
//  Description:  Called when the page loads
//
//  Arguments:  None
//
//  Returns:  Nothing
//
//-----------------------------------------------------------------------------

function saveCountryCodeDeflt()
{
  previousCountryCodeIndex = document.getElementById("MIR-CLI-CTRY-CD").selectedIndex;
}

