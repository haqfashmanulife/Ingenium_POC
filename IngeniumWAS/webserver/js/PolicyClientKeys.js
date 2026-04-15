// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   PolicyClientKeys.js                                          *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************
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
//  Javascript for handling policy or client keys. Based on radio buttons,
//  will show policy key and hide client key or vice versa.
//
//  Assumptions:
//      1. Two Radio buttons determine which key field(s) to dispay. First radio
//         button is to show client key, second is to show policy key. First
//         radio button has a value of "1", second radio button has a value of
//         "2".
//      2. Client key field and label are in a table row with id ClientKeys
//      3. Policy key fields and labels are in a table row with id PolicyKeys
//      4. Client key field is MIR-CLI-ID.
//      5. Policy key fields are MIR-POL-ID-BASE and MIR-POL-ID-SFX
//
//-----------------------------------------------------------------------------

//+----------------------------------------------------------------------------
//  When an input page is first loaded, show correct key fields based on
//  radio button selection
//
//  Input:  ctlName - name of radio button controls that determine which key
//                    to display. First radio button checked will display client
//                    key, second radio button checked will display policy key.
//
//-----------------------------------------------------------------------------

function onLoadPolicyClientKeys(ctlName)
{
	ctls = document.getElementsByName(ctlName);
	if (ctls[0].checked)
	{
		showHidePolicyClientKeys(ctls[0]);
	}
	else
	{
		showHidePolicyClientKeys(ctls[1]);
	}
}

//+----------------------------------------------------------------------------
//  When radio buttons are clicked, show/hide key fields as appropriate.
//
//  Input:  ctl - radio button that was clicked. Radio button to show client
//                key should have a value of 1. Radio button to show policy
//                key can have any value other than "1".
//              - alternatively, ctl can be a text input field that has a 
//                value of "1" if client key is to be shown and any other
//                value if policy key is to be shown.
//
//-----------------------------------------------------------------------------

function showHidePolicyClientKeys(ctl)
{
	if (ctl.value == "1")
	{
		if (document.getElementById("ClientKeys").style.display == "none")
		{
			document.getElementById("ClientKeys").style.display = "";
			document.getElementById("PolicyKeys").style.display = "none";
		}
	}
	else
	{
		if (document.getElementById("PolicyKeys").style.display == "none")
		{
			document.getElementById("PolicyKeys").style.display = "";
			document.getElementById("ClientKeys").style.display = "none";
		}
	}
}

//+----------------------------------------------------------------------------
//  When an input page is submitted, make sure only one set of the key fields
//  has a value (this functionality is not required on output pages as they
//  aren't sending anything back to PageServer).
//
//  Input:  ctlName - name of radio button controls that determine which key
//                    to display. First radio button checked will display client
//                    key, second radio button checked will display policy key.
//-----------------------------------------------------------------------------

function onSubmitPolicyClientKeys(ctlName)
{
	ctls = document.getElementsByName(ctlName);
	if (ctls[0].checked == true)
	{
		// client key should be sent, blank policy key
		document.getElementById("MIR-POL-ID-BASE").value = "";
		document.getElementById("MIR-POL-ID-SFX").value = "";
	}
	else
	{
		// policy key should be sent, blank client key
		document.getElementById("MIR-CLI-ID").value = "";
	}
}
