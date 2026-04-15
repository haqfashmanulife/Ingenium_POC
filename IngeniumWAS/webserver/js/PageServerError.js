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
//*  EN9512  PF4.0.2  PathFinder Upgrade                                       *  
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *                                                                                                                    *
//******************************************************************************
//+----------------------------------------------------------------------------
//
//  Function:       onLoadPageServerError()
//
//  Description:    Set the error message on the PageServerError htm pages
//                  to give appropriate action.  Shared by PageServerError.htm
//                  and PageServerRedirectNewProcess.htm
//
//  Arguments:      none
//
//-----------------------------------------------------------------------------

function onLoadPageServerError()
{
	myFrameset = parent.parent.window.document.getElementById("topmostFrameSet");

	if (myFrameset == null)
	{
		// For first browser window whose menu was hidden, there is no parent
		myFrameset = parent.window.document.getElementById("topmostFrameSet");
	}

	if (myFrameset != null)
	{
		// We have a frame set so show the menu so that the user can choose another
		// process
		if (myFrameset.cols == "0,*")
		{
			myFrameset.cols = "20%,80%";
		}
	}
	else
	{
		// We don't have a frameset so we ask the user to close the window
		// and sign on again
		document.getElementById("suggestion").innerText = getSystemMessage(msgCloseBrowserSignOn);
	}
}
        
