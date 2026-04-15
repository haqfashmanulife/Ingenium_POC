// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   ServiceEntryPoint.js                                         *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016051  6.1      New for release 6.1                                      *
//*  016103  6.1.1J   Added new fields to blank out in showhide                *
//*  PF22    PF 2.2   PathFinder release 2.2 fix - following line removed      * 
//*                   document.getElementById("MIR-CLI-INDV-MID-NM").value = "";* 
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
//     Functions for the ServiceEntryPoint.htm page
//
//
//     Uses:  cleanString() function from ClientLevelEdits.js
//
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//  Global variables
//-----------------------------------------------------------------------------
var headerCount = 1;  // Number of header rows in the results table

//-----------------------------------------------------------------------------
//
//     Function:       onLoadCustom()
//
//     Description:     Custom onload handler.
//
//                         - Shows or hides the Enhanced Search criteria table.
//                         - Hides the results table if there's no data.
//
//     Arguments:     none
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
     showHideEnhancedSearch();

     ctl = document.getElementById("ResultsTable");
     if (null != ctl)
     {
          if (ctl.rows.length <= headerCount)
          {
               ctl.style.display = "none";
          }
     }
}

//-----------------------------------------------------------------------------
//
//     Function:       showHideEnhancedSearch()
//
//     Description:     Show or hide Enhanced Search Criteria fields based on
//                       the status of the Enhanced Search Indicator.
//
//                         If there is data in the Enhanced Search Criteria fields,
//                         erase it when hiding the table.
//
//     Arguments:          none
//
//     Returns:          Nothing
//
//-----------------------------------------------------------------------------

function showHideEnhancedSearch()
{
     // Get the checkbox that controls whether enhanced search criteria
     // entry table is displayed
     var ctl = document.getElementById("EnhancedSearchIndicator");
     if (null == ctl)
     {
          return;
     }

     // show or hide table depending on master checkbox
     if (ctl.checked)
     {
          // Show table
          document.getElementById("EnhancedSearchTable").style.display = "";
     }
     else
     {
          // Hide table
          document.getElementById("EnhancedSearchTable").style.display = "none";

          // Clear data
          document.getElementById("MIR-CLI-TAX-ID").value      = "";
          document.getElementById("MIR-CLI-BTH-DT").value      = "";
          document.getElementById("MIR-CLI-PSTL-CD").value     = "";

          document.getElementById("MIR-CLI-SEX-CD").value      = "";
          document.getElementById("MIR-CLI-CRNT-LOC-CD").value = "";
          document.getElementById("MIR-CLI-JP-ADDR-CD").value = "";
          document.getElementById("MIR-CLI-CITY-NM-TXT").value = "";

     }
}

//-----------------------------------------------------------------------------
//
//     Function:       submitClientID
//
//     Description:    Sets the action to ACTION_SUBMIT_CLIENTID and submits the page
//
//     Arguments:      None
//
//     Returns:        Nothing
//
//-----------------------------------------------------------------------------

function submitClientID()
{
     inputForm.action.value = "ACTION_SUBMIT_CLIENTID";

     if (inputForm.onsubmit())
     {
          inputForm.submit();
     }
}

//-----------------------------------------------------------------------------
//
//     Function:       submitPolicyID
//
//     Description:    Sets the action to ACTION_SUBMIT_POLICYID and submits the page
//
//     Arguments:      None
//
//     Returns:        Nothing
//
//-----------------------------------------------------------------------------

function submitPolicyID()
{
     inputForm.action.value = "ACTION_SUBMIT_POLICYID";

     if (inputForm.onsubmit())
     {
          inputForm.submit();
     }
}

//-----------------------------------------------------------------------------
//
//     Function:       SearchClient
//
//     Description:    Sets the action to ACTION_SEARCH_CLIENT and submits the page
//
//     Arguments:      None
//
//     Returns:        Nothing
//
//-----------------------------------------------------------------------------

function SearchClient()
{
     inputForm.action.value = "ACTION_SEARCH_CLIENT";

     if (inputForm.onsubmit())
     {
          inputForm.submit();
     }
}

