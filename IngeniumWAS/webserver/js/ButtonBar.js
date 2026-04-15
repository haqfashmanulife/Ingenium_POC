//******************************************************************************
//*  All right, title and interest in and to the software                      *
//*  (the "Software") and the accompanying documentation or                    *
//*  materials (the "Documentation"), including all proprietary                *
//*  rights, therein including all patent rights, trade secrets,               *
//*  trademarks and copyrights, shall remain the exclusive                     *
//*  property of Electronic Data Systems LLC.                                  *
//*  No interest, licence or any right respecting the Software                 *
//*  and the Documentation, other than expressly granted in                    *
//*  the Software Licence Agreement, is granted by implication                 *
//*  or otherwise.                                                             *
//*                                                                            *
//*  (C) Copyright 2000-2008 Electronic Data Systems LLC.                      *
//*  All rights reserved.                                                      *
//*                                                                            *
//*  Each Party agrees to (a) comply with all applicable laws                  *
//*  regarding export or re-export of the Confidential                         *
//*  Information, technical data, or derivatives of such items;                *
//*  and (b) not to export or re-export any such items to a                    *
//*  destination or end user for which applicable law, including               *
//*  Canadian or U.S. law, requires an export license or other                 *
//*  approval without first having obtained such license or                    *
//*  approval.                                                                 *
//******************************************************************************
//*  Component:   ButtonBar.js                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*  EN9512  PF4.0.2  PathFinder Upgrade                                       *                                                                               *
//*  15997A  CTS      CHANGES FOR FRA PREMIUM QUOTE SCREEN                     *                                                                          *
//*  15997D  CTS      CHANGES TO ADD CONDITIONS FOR FRA PREMIUM QUOTE SCREEN   *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//******************************************************************************
 

//-----------------------------------------------------------------------------
//
//	Function:       onClickedActionButton
//
//	Description:    This function is called when the user clicks on a button
//	                in the button bar.  You should pass in the string that
//	                you want to pass back to the PageServer.  This value
//	                will be saved in the "action" field and the form will
//	                be submitted.
//
//	Arguments:      A string corresponding to the action clicked
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onClickedActionButton(action)
{
	// The "action" field is on the ContentFrame

	var contentDocument = getDocument(getFrame("ContentFrame"));

	// Set the action field to the value passed in

	contentDocument.getElementById("action").value = action;

	// If the pre-submit is successful, then submit the form.

	if (contentDocument.getElementById("inputForm").onsubmit())
	{
		contentDocument.getElementById("inputForm").submit();
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       onClickedActionButtonConfirm
//
//	Description:    This function is called when the user clicks on a button
//	                and you want to put up an alert message asking the user
//	                if they're sure they want to do the action.  You have to
//	                pass in the string that will be displayed in the alert
//	                and the action to be sent if the user chooses OK or
//	                the action to be sent if the user chooses CANCEL in the
//	                alert. If you pass in an empty string for cancelAction,
//	                you will stay on the same page
//
//	Arguments:      See description above
//
//	Returns:        true if browser should submit the page, false otherwise
//
//-----------------------------------------------------------------------------

function onClickedActionButtonConfirm(message, okAction, cancelAction)
{
	// Display a confirm message box to the user displaying the message
	// passed in.  A confirm box has an OK and CANCEL button on it.
	// confirm returns true if OK is pressed.

	if (confirm(message) == true)
		action = okAction;
	else
	{
		if (cancelAction == "")
		{
			window.event.preventDefault();
			return false;
		}	
		else
			action = cancelAction;
	}

	return onClickedActionButton(action);
}

//-----------------------------------------------------------------------------
//
//	Function:       onClickedActionButtonCheckForSelection
//
//	Description:    This function is called when the user clicks on a
//	                button on a list page and you want to make sure that
//	                they have selected a record before proceeding.  You have
//	                to pass in the error message string that will be
//	                displayed if no item has been selected and the action
//	                to be sent if an item has been selected.
//
//	Arguments:      See description above
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onClickedActionButtonCheckForSelection(message, action)
{
	// Check that the user has selected an item to apply action to
	if (getDocument(getFrame("ContentFrame")).getElementById("index").value > 0)
	{
		// user has selected an item so process the action
		return onClickedActionButton(action);
	}
	else
	{
		// user hasn't selected an item yet, display the message
		// and stop processing of the action
		alert(message);
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       onClickedActionButtonConfirmCheckForSelection
//
//	Description:    This function is called when the user clicks on a
//	                button and you want to put up an alert message asking
//	                the user if they're sure they want to do the action.
//	                You have to pass in the string that will be displayed
//	                in the alert and the action to be sent if the user chooses
//	                OK or the action to be sent if the user chooses CANCEL
//	                in the alert. This function also ensures that a selection
//	                has been made. If no selection has been made a message
//	                is displayed (which you pass in) and the action does not
//	                proceed. If you pass in an empty string for cancelAction,
//	                you will stay on the same page
//
//	Arguments:      See description above
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onClickedActionButtonConfirmCheckForSelection(noSelectionMessage, confirmMessage,
                                                       okAction, cancelAction)
{
	// Check that the user has selected an item to apply action to
	if (getDocument(getFrame("ContentFrame")).getElementById("index").value > 0)
	{
		// user has selected an item so process the action
		return onClickedActionButtonConfirm(confirmMessage, okAction, cancelAction);
	}
	else
	{
		// user hasn't selected an item yet, display the message
		// and stop processing of the action
		alert(noSelectionMessage);
		return false;
	}
}
//-----------------------------------------------------------------------------
//
//     Function:          Sendmthdcd
//
//     Description:     This function is called when the user clicks on a
//	                button and you want to put up an alert message asking
//	                the user when MIR-SEND-MTHD-CD is "not required".
//	                You have to pass in the string that will be displayed
//	                in the alert and the action to be sent if the user chooses
//	                OK or the action to be sent if the user chooses CANCEL
//	                in the alert. This function also ensures that a selection
//	                has been made. If no selection has been made a message
//	                is displayed (which you pass in) and the action does not
//	                proceed. If you pass in an empty string for cancelAction,
//	                you will stay on the same page
//
//     Arguments:          none required
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

//function Sendmthdcd(message1,message2,okAction,cancelAction)
//Added 3rd message for checking the exchange rate when the report button is clicked
function Sendmthdcd(message1,message2,message3,okAction,cancelAction)
{
     // If the send mthdcode is incorrect then throw Pop up message
     // Changes done as part of CR-2 of FRA Yen reduction quote screen to find out the exhange rate
     // and throw a guard when the exchange rate is not found on the simulation date
         var dvSendmthdcd = getDocument(getFrame("ContentFrame")).getElementById("MIR-SEND-MTHD-CD").value;
         var dvxchngchk = getDocument(getFrame("ContentFrame")).getElementById("MIR-XCHG-RT-DIFF-IND").value;
          if ("3" == dvSendmthdcd)          // Account Holder Type = Owner
          {
              
               alert(message1);
               return;                
          }         
          if ("Y" == dvxchngchk)
           {
              alert (message3);
           }
          else
          {
              onClickedActionButtonConfirm(message2, okAction, cancelAction);
          }

}

//-----------------------------------------------------------------------------
// Function: getFrame(frameName)
//
// Description: Searches backwards through the window hierarchy looking for
// a frame with the name passed in. 
//
// Arguments: Name of the frame to find. The search is case insensitive.
//
// Returns: The window representing the requested frame or null if
// no frame could be found.
//-----------------------------------------------------------------------------

function getFrame(frameName) {
	currentParent = parent;
	
	while (true) {
		if (currentParent.frames.length > 0) {
			var frame = currentParent.frames[frameName]
			if (frame) {
				return frame
			}
		}
		
		// If the window's parent is itself, then it has no parent.

		if (currentParent == currentParent.parent) {
			return null;
		}

		currentParent = currentParent.parent;
	}
}

//-----------------------------------------------------------------------------
// Function: getDocument(object)
//
// Description: Returns a document object for either a frame or a 
// window object.
//
// Arguments: Object that could be a window or frame	
//
// Returns: A document object or undefined
//-----------------------------------------------------------------------------

function getDocument(object) {
	if (object.document) {
		return object.document;
	} else if (object.contentDocument) {
		return object.contentDocument;
	} else if (object.contentWindow) {
		return object.contentWindow.document;
	} else {
		return undefined;
	}
}
