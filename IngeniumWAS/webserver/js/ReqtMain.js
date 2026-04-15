// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   ReqtMain.js                                                  *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  6.02J    New for release 6.02J                                    *
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
//	Functions for the ReqtMain.htm pages
//
//
//	Uses:  cleanString() function from ClientLevelEdits.js
//
//
//-----------------------------------------------------------------------------
//
//	Function:       submitClientID
//
//	Description:    Sets the action to ACTION_SUBMIT_CLIENTID and submits the page
//
//	Arguments:      None
//
//	Returns:        Nothing
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
//	Function:       submitPolicyID
//
//	Description:    Sets the action to ACTION_SUBMIT_POLICYID and submits the page
//
//	Arguments:      None
//
//	Returns:        Nothing
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

