// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   UserSession.js                                               *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*  019361  PF13     Changed disable to readonly for MIR-USER-ID              *
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

//+----------------------------------------------------------------------------
//
//  Custom script for User Session List and Update functions
//  (BF1990-I.htm and BF1991-I.htm)
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//     Function:       disableEnableCoIdSelBox
//
//     Description:    This function is called when the user clicks on the
//                     "All Companies" check box. It disables the corresponding
//                     Company Id Selection box so that only one of
//                     "Company id" or "All Companies" is populated on the page
//
//     Arguments:      "All Companies" check box
//
//     Returns:        Nothing
//
//-----------------------------------------------------------------------------

function disableEnableCoIdSelBox(objRef)
{
     if (objRef.checked == true)
          document.getElementById("MIR-CO-ID").disabled = true;
        else
          document.getElementById("MIR-CO-ID").disabled = false;
}

//-----------------------------------------------------------------------------
//
//     Function:       disableEnableCoIdCheckBox
//
//     Description:    This function is called when the user selects an entry
//                     from the selection box contents disabling the check box
//                     to select all companies.  If a value is selected from the
//                     list the checkbox is disabled, preventing the user
//                     from clicking that as well.
//
//     Arguments:      See description above
//
//     Returns:        Nothing
//
//-----------------------------------------------------------------------------

function disableEnableCoIdCheckBox(objRef)
{
     if (objRef.value == "")
          document.getElementById("MIR-DV-CO-ID-IND").disabled = false;
        else
          document.getElementById("MIR-DV-CO-ID-IND").disabled = true;
}

//-----------------------------------------------------------------------------
//
//     Function:       disableEnableUserIdCheckBox
//
//     Description:    This function is called when the user enters a value
//                     into the User id text box.  It disables the corresponding
//                     "All users" check box so that there is no possibility of
//                     passing a specific user and all users up to the host.
//
//     Arguments:      See description above
//
//     Returns:        Nothing
//
//-----------------------------------------------------------------------------

function disableEnableUserIdCheckBox(objRef)
{
     if (cleanString(objRef.value) == "")
          document.getElementById("MIR-DV-USER-ID-IND").disabled = false;
        else
          document.getElementById("MIR-DV-USER-ID-IND").disabled = true;
}

//-----------------------------------------------------------------------------
//
//     Function:       disableEnableUserIdText
//
//     Description:    This function is called when the user checks the
//                     "All users" check box.  It disables the User Id text
//                     field so that there is no possibility of passing both a
//                     specific user id and a "All users" indicator value of 'Y'
//
//     Arguments:      See description above
//
//     Returns:        Nothing
//
//-----------------------------------------------------------------------------

function disableEnableUserIdText(objRef)
{
     if (objRef.checked == true)
          document.getElementById("MIR-USER-ID").readOnly = true;
        else
          document.getElementById("MIR-USER-ID").readOnly = false;
}
