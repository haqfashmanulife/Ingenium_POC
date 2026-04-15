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
//*  Component:   PageServer.js                                                *
//*  Description: Common routines required by PageServer.                      *
//*                                                                            *
//*  Note:  DO NOT MODIFY THIS CODE.  If there is a requirement to override    *
//*         the methods in this file, please add required code or method to    *
//*         the GlobalUserMethods.js file.                                     *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*          1.0      New for release 1.0 of Pathfinder                        *
//*  EN9512  PF4.0.2  PathFinder Upgrade                                       * 
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *                                                                              *
//*                                                                            *
//******************************************************************************

//+----------------------------------------------------------------------------
//  Function:       setFocus(frameId, ctlId)
//
//  Description:    Set focus to a specified control
//
//  Arguments:      frameId - frame where control is located
//                  ctlId - name of control
//-----------------------------------------------------------------------------

function setFocus(frameId, controlId)
{
	var frame = frames[frameId];

	if (frame == null) {
		frame = getIFrame(frames["ContentFrame"], frameId);
	}

	if (frame == null) {
		return;
	}

	var frameDocument = getDocument(frame);
	var control = frameDocument.getElementById(controlId);

	if (control == null) {
		control = frameDocument.getElementsByName(controlId);
		if (control.length == 0) {
		return;
		}
	}

	setFocusToControl(control);

	// Scroll the window to the top. This is compensates for the
	// behaviour of focus() which scrolls the page so that the 
	// field with the focus is at the top of the page.

	if (frame.scrollTo) {
		frame.scrollTo(0, 0);
	} else if (frame.contentWindow) {
		frame.contentWindow.scrollTo(0, 0);
	}
}

//+----------------------------------------------------------------------------
// Function: 		getIFrame(parentWindow, frameId)
// Description:		Tries to find a frame window that is embedded as an IFrame
//					inside another window.  Returns null if the window can't
//					be found or a reference to the window.
// Arguments:		parentWindow - The window that may contain the IFrame
//					frameId - The Id of the frame that we're looking for
//-----------------------------------------------------------------------------

function getIFrame(parentWindow, frameId)
{
	if (parentWindow == null)
	{
		return null;
	}

	// Is the frame on the parent window?  If not, check to see if it's nested
	// further down.
	var window = parentWindow.frames[frameId];

	if (window == null)
	{
		// Check each child frame to see if it includes the frame we're looking for
		for (count = 0; count < parentWindow.frames.length; ++count)
		{
			window = getIFrame(parentWindow.frames[count], frameId);

			if (window != null)
			{
				break;
			}
		}
	}

	return window;
}

//+----------------------------------------------------------------------------
//  Function:       setFocusToControl(control)
//  Description:    Set focus to the control passed in
//  Arguments:      window - The window that owns the control
//  				control - The control that should have focus
//-----------------------------------------------------------------------------

function setFocusToControl(control)
{
	// set focus and select the control (if select is supported)
	switch (control.type)
	{
		case "select-multiple":
		case "select-one":
		{
			control.focus();
			break;
		}

		case "text":
		case "textarea":
		case "password":
		case "checkbox":
		{
			control.focus();
			control.select();
			break;
		}

		default:
		{
			var tagName = control.tagName; // Special case for links
			if(tagName == "A" || tagName == "a")
			{
				control.focus();
			}

			// radio button
			if (control.length > 0)
			{
				for (i = 0; i < control.length; i++)
				{
					if (control[i].checked)
					{
						control[i].focus();
						break;
					}
				}

				// no value selected yet, position on first
				if (i >= control.length)
				{
					control[0].focus();
				}
			}
			else
			{
				control.focus();
			}
		}
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       getDocument(object)
//
//	Description:	Returns a document object for either a frame or a 
//			window object.
//
//	Arguments:	Object that could be a window or frame	
//
//	Returns:	A document object or undefined
//
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
