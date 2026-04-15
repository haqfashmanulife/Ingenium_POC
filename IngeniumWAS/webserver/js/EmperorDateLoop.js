// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   EmperorDateLoop.js                                           *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*  PF30    PF 3.0   Manual changes for array format after conversion         *
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

//+----------------------------------------------------------------------------
//
//  Class:         setEmperorDateLoop(serverDateName, listSize)
//
//  Description:    calls the setEmperorDate function ( which returns the 4 
//                  componenets of a Japanese emperor format date for a given
//                  date) for a list of dates
//
//  Arguments:      serverDateName - date to be formated
//                  listSize - max number of rows in the list on the HTML page
//
//-----------------------------------------------------------------------------

function setEmperorDateLoop(serverDateName, listSize)
{
  for (var j = 1; j < (listSize + 1); j++)
  {
            var ctl = document.getElementById(serverDateName + j + "]");
      if (ctl != null)
      {
    ctl.setAttribute("emperorDate", "myEmperorDate-T[" + j + "]");
                setEmperorDate(serverDateName + j + "]");
      }
  }
}
