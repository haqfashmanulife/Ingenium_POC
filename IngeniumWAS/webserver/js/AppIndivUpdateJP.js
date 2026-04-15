// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:07 PM EDT
//******************************************************************************
//*  Component:   AppIndivUpdateJP.js                                          *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  6.3      New for release 602J                                     *
//*  018763  6.3      Code Cleanup                                             *
//*  PF 20   2.0      PathFinder 2.0 Retrofits                                 *
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
//     Functions for the AppIndivUpdateJP.htm page
//
//
//     Uses:  cleanString() function from ClientLevelEdits.js
//
//
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//     Function:       onLoadCustom()
//
//     Description:     Custom onload handler. Will hide prevNameTable and
//               prevAddrTable if they have no data. The script assumes
//               that the tables have 2 heading rows.
//
//     Arguments:     none
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
     showHideClientID();
     showHidePrevNameonLoad();
     showHidePrevAddronLoad();

     ctl = document.getElementById("prevNameTable");
     if (ctl != null)
     {
          if (ctl.rows.length <= 2)
          {
               ctl.style.display = "none";
          }
     }

     ctl = document.getElementById("prevAddrTable");
     if (ctl != null)
     {
          if (ctl.rows.length <= 2)
          {
               ctl.style.display = "none";
          }
     }
}

//-----------------------------------------------------------------------------
//
//     Function:       showHideClientID(message)
//
//     Description:     Show or hide user-defined client id fields based on 
//               whether the ClientIDAssignmentOverride checkbox is checked. No
//               need to warn the user that they'll lose data, just erase the field.
//
//     Arguments:          none
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function showHideClientID()
{
     // Get table used for user-defined client id entry
     var ctl = document.getElementById("ClientIDFields");
     if (ctl == null)
     {
          return;
     }

     // Get the checkbox that controls whether user-defined client id
     // entry table is displayed
     var masterCtl = document.getElementById("ClientIDAssignmentOverride");
     if (masterCtl == null)
     {
          return;
     }

     // show or hide table depending on master checkbox
     if (masterCtl.checked)
     {
          // Show the section
          ctl.style.display = "";
          
          // Show the individual field
          document.getElementById("UserDefinedClientID").style.display = "";
     }
     else
     {
          // No need to ask for confirmation on this field, just erase it.
          document.getElementById("UserDefinedClientID").value = "";
          
          // Hide the individual field to prevent mandatory check
          document.getElementById("UserDefinedClientID").style.display = "none";

          ctl.style.display = "none";
     }     
}

//-----------------------------------------------------------------------------
//
//     Function:       showHidePrevName(message)
//
//     Description:     Show or hide previous name entry fields based on 
//               whether the PrevNameEntry checkbox is checked. If
//               there is data in the previous name entry fields and
//               the check box is being unchecked, verify with the
//               user that they wish to lose the data. If the user
//               chooses not to lose the data, leave the checkbox
//               checked.
//
//     Arguments:     message - message to show if user is hiding previous
//               name and there is data there (as the data will not be
//               sent to the server if it is hidden).
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function showHidePrevName(message)
{
     // Get table used for previous name entry
     var ctl = document.getElementById("prevNameEntryTable");
     if (ctl == null)
     {
          return;
     }

     // Get the checkbox that controls whether previous name entry table
     // is displayed
     var masterCtl = document.getElementById("prevNameEntry");
     if (masterCtl == null)
     {
          return;
     }

     // show or hide table depending on master checkbox
     if (masterCtl.checked)
     {
          ctl.style.display = "";
     }
     else
     {
          var bHide = true;

          // if there is data, display a message to user
          if (cleanString(document.getElementById("MIR-ENTR-GIV-NM-T[1]").value) != "" ||
              cleanString(document.getElementById("MIR-ENTR-SUR-NM-T[1]").value) != "")
          {
               if (confirm(message) != true)
               {
                    // user doesn't want to lose the data
                    bHide = false;
                    window.event.preventDefault();
               }
          }


          // hide the data entry table
          if (bHide)
          {          
               ctl.style.display = "none";
          }
     }
}

//-----------------------------------------------------------------------------
//
//     Function:       showHidePrevNameonLoad()
//
//     Description:     on Load - Show or hide previous name entry fields based on 
//               whether the PrevNameEntry checkbox is checked. 
//
//     Arguments:     none
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function showHidePrevNameonLoad()
{
     // Get table used for previous name entry
     var ctl = document.getElementById("prevNameEntryTable");
     if (ctl == null)
     {
          return;
     }

     // Get the checkbox that controls whether previous name entry table
     // is displayed
     var masterCtl = document.getElementById("prevNameEntry");
     if (masterCtl == null)
     {
          return;
     }

     // show or hide table depending on master checkbox
     if (masterCtl.checked)
     {
          ctl.style.display = "";
     }
     else
     {
          ctl.style.display = "none";
     }
}

//-----------------------------------------------------------------------------
//
//     Function:       showHidePrevAddr(message)
//
//     Description:     Show or hide previous address entry fields based on 
//               whether the PrevAddrEntry checkbox is checked. If
//               there is data in the previous address entry fields and
//               the check box is being unchecked, verify with the
//               user that they wish to lose the data. If the user
//               chooses not to lose the data, leave the checkbox
//               checked.
//
//     Arguments:     message - message to show if user is hiding previous
//               address and there is data there (as the data will not be
//               sent to the server if it is hidden).
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function showHidePrevAddr(message)
{
     // Get table used for previous address entry
     var ctl = document.getElementById("prevAddrEntryTable");
     if (ctl == null)
     {
          return;
     }

     // Get the checkbox that controls whether previous address entry table
     // is displayed
     var masterCtl = document.getElementById("prevAddrEntry");
     if (masterCtl == null)
     {
          return;
     }

     // show or hide table depending on master checkbox
     if (masterCtl.checked)
     {
          ctl.style.display = "";
     }
     else
     {
          bHide = true;
          // if there is data, display a message to user
          if (cleanString(document.getElementById("MIR-CLI-ADDR-LN-1-TXT-T-1-ADDITIONAL").value) != "")
          {
               if (confirm(message) != true)
               {
                    // user doesn't want to lose the data
                    bHide = false;
                    window.event.preventDefault();
               }
          }


          // hide the data entry table
          if (bHide)
          {          
               ctl.style.display = "none";
          }
     }     
}
//-----------------------------------------------------------------------------
//
//     Function:       showHidePrevAddronLoad()
//
//     Description:     on Load - Show or hide previous address entry fields based on 
//               whether the PrevAddrEntry checkbox is checked. 
//
//     Arguments:     none
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function showHidePrevAddronLoad()
{
     // Get table used for previous address entry
     var ctl = document.getElementById("prevAddrEntryTable");
     if (ctl == null)
     {
          return;
     }

     // Get the checkbox that controls whether previous address entry table
     // is displayed
     var masterCtl = document.getElementById("prevAddrEntry");
     if (masterCtl == null)
     {
          return;
     }

     // show or hide table depending on master checkbox
     if (masterCtl.checked)
     {
          ctl.style.display = "";
     }
     else
     {
          ctl.style.display = "none";
     }     
}

//-----------------------------------------------------------------------------
//
//     Function:       onSubmitCustom
//
//     Description:     Called before standard onSubmit function when form is
//               going to be submitted. Will clear previous name and
//               previous address data fields if they are hidden.
//
//     Arguments:     none
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function onSubmitCustom()
{
     // Clear previous name entry fields if they are hidden
     if (PrevNameEntry.style.display == "none")
     {
          document.getElementById("MIR-CLI-INDV-TITL-TXT-T[1]").value = "";
          document.getElementById("MIR-ENTR-GIV-NM-T[1]").value = "";
          document.getElementById("MIR-CLI-INDV-MID-NM-T[1]").value = "";
          document.getElementById("MIR-ENTR-SUR-NM-T[1]").value = "";
          document.getElementById("MIR-CLI-INDV-SFX-NM-T[1]").value = "";
     }

     // Clear previous address entry fields if they are hidden
     if (PrevAddressEntry.style.display == "none")
     {
          document.getElementById("MIR-CLI-RES-TYP-CD-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-ADDR-YR-DUR-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-ADDR-LN-1-TXT-T-1-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-RES-NUM-T-1-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-ADDR-LN-2-TXT-T-1-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-ADDR-LN-3-TXT-T-1-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-CITY-NM-TXT-T-1-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-CRNT-LOC-CD-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-CTRY-CD-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-PSTL-CD-T-1-ADDITIONAL").value = "";
     // Add the Japan specific addresses
          document.getElementById("MIR-CLI-ADDR-ADDNL-TXT-T-1-ADDITIONAL").value = "";
//  PF 20 - replaced the following line
//        document.getElementById("MIR-CLI-ALT-ADDR-CD-T-1-ADDITIONAL").value = "";
          document.getElementById("MIR-CLI-JP-ADDR-CD-T-1-ADDITIONAL").value = "";
     }

}
